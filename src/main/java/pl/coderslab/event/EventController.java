package pl.coderslab.event;

import br.com.esign.google.geocode.GoogleGeocode;
import br.com.esign.google.geocode.model.GeocodeResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.speed.Speed;
import pl.coderslab.speed.SpeedRepository;
import pl.coderslab.user.User;
import pl.coderslab.user.UserRepository;
import pl.coderslab.validation.EventValidationGroup;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/event")
public class EventController {

    private EventRepository eventRepository;

    private SpeedRepository speedRepository;

    private UserRepository userRepository;

    @Value("AIzaSyAb-ERRif3M_NQd-srbAwF-i9KmN9kbtlc")
    private String apiKey;

    @Autowired
    public EventController(EventRepository eventRepository, SpeedRepository speedRepository, UserRepository userRepository) {
        this.eventRepository = eventRepository;
        this.speedRepository = speedRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/list")
    public String eventList(Model model, HttpSession session) {
        List<Event> events = eventRepository.findAll();
        List<User> users = userRepository.findAll();
        User user = (User)session.getAttribute("userSession");

        model.addAttribute("events", events);
        model.addAttribute("user",users);
        return "eventListEC";

    }


    @GetMapping("/addEvent")
    public String addEvent(Model model) {
        model.addAttribute("event", new Event());
        return "event";
    }


    @PostMapping("/addEvent")
    public String addUser(@ModelAttribute @Validated(EventValidationGroup.class) Event event, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "event";
        }
        GoogleGeocode googleGeocode = new GoogleGeocode(apiKey, event.getStartPlace()); // the address must not be encoded

        GeocodeResponse geocodeResponse = null;
        try {
            geocodeResponse = googleGeocode.getResponseObject();
            if(geocodeResponse.isStatusOK()) {
                event.setStartLatitude(geocodeResponse.getGeometry().getLocation().getLat().floatValue());
                event.setStartLongitude(geocodeResponse.getGeometry().getLocation().getLng().floatValue());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        googleGeocode = new GoogleGeocode(apiKey, event.getTarget()); // the address must not be encoded

        GeocodeResponse geocodeResponsetarget = null;
        try {
            geocodeResponsetarget = googleGeocode.getResponseObject();
            if(geocodeResponse.isStatusOK()) {
                event.setTargetLatitude(geocodeResponsetarget.getGeometry().getLocation().getLat().floatValue());
                event.setTargetLongitude(geocodeResponsetarget.getGeometry().getLocation().getLng().floatValue());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        User user = (User)session.getAttribute("userSession");
        event.setOrganist(user);
        eventRepository.save(event);
        return "redirect:../event/list";

    }


    @GetMapping("/addToEvent/{id}")

    public String updateUser(@PathVariable Long id, HttpSession session) {
        Event event = eventRepository.findById(id).orElse(null);
        User user = (User)session.getAttribute("userSession");

        List<User> users = event.getUsers();
        if(users.stream().filter(item -> item.equals(user)).findFirst().isPresent()){
            return "redirect:../user-already-added";
        }else {
            users.add(user);
            event.setUsers(users);
            eventRepository.save(event);
            return "redirect:../list";
        }
    }
    @GetMapping("/user-already-added")
    public String alreadyAdded(){
        return "user-already-added";
    }
    @GetMapping("/description/{id}")
    public String eventDescription(@PathVariable Long id, Model model) {
        Event event = eventRepository.findById(id).orElse(null);
        model.addAttribute("event",event);
        return "description";
    }

    @ModelAttribute("events")
    public List<Event> getEvents(){
        return eventRepository.findAll();
    }


    @ModelAttribute("speeds")
    public List<Speed> getSpeeds(){ return speedRepository.findAll();}

    @ModelAttribute("users")
    public  List<User> getUser(){ return userRepository.findAll();}



}
