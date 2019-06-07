package pl.coderslab.admin;

import br.com.esign.google.geocode.GoogleGeocode;
import br.com.esign.google.geocode.model.GeocodeResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.event.Event;
import pl.coderslab.event.EventRepository;
import pl.coderslab.speed.Speed;
import pl.coderslab.speed.SpeedRepository;
import pl.coderslab.user.User;
import pl.coderslab.user.UserRepository;
import pl.coderslab.user.UserService;
import pl.coderslab.validation.EventValidationGroup;
import pl.coderslab.validation.UserValidationGroup;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class adminController {

    private UserRepository userRepository;

    private EventRepository eventRepository;

    private UserService userService;

    private SpeedRepository speedRepository;

    @Value("AIzaSyAb-ERRif3M_NQd-srbAwF-i9KmN9kbtlc")
    private String apiKey;

    @Autowired
    public adminController(UserRepository userRepository, EventRepository eventRepository, UserService userService, SpeedRepository speedRepository) {
        this.userRepository = userRepository;
        this.eventRepository = eventRepository;
        this.userService = userService;
        this.speedRepository = speedRepository;
    }

    @GetMapping("/add")
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "user";
    }

    @PostMapping("/add")
    public String addUser(@ModelAttribute @Validated(UserValidationGroup.class) User user, BindingResult result) {
        if (result.hasErrors()) {
            return "user";
        }
      try {
          userService.saveUser(user);
      }catch (Exception e){
          return "loginError";
      }

        return "redirect:list";
    }

    @GetMapping("/list")
    public String userList(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "adminUserList";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {

        userRepository.deleteById(id);
        return "redirect:../list";
    }

    @GetMapping("/update/{id}")
    public String updateUser(@PathVariable Long id, Model model) {
        User user = userRepository.findById(id).orElse(null);
        model.addAttribute("user", user);
        return "user";
    }

    @PostMapping("/update/{id}")
    public String updateUser(@ModelAttribute @Validated(UserValidationGroup.class) User user, BindingResult result) {
        if (result.hasErrors()) {
            return "user";
        }
        userService.saveUser(user);
        return "redirect:../list";
    }

//


//


//    obsluga eventow


//


//

    @GetMapping("/listEvent")
    public String eventList(Model model) {
        List<Event> events = eventRepository.findAll();
        model.addAttribute("events", events);
        return "adminEventList";
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
        }  GoogleGeocode googleGeocode = new GoogleGeocode(apiKey, event.getStartPlace()); // the address must not be encoded

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

        return "redirect:../admin/listEvent";
    }

    @GetMapping("/deleteEvent/{id}")
    public String deleteEvent(@PathVariable Long id) {

        eventRepository.deleteById(id);

        return "redirect:../listEvent";
    }

    @GetMapping("/updateEvent/{id}")
    public String updateEvent(@PathVariable Long id, Model model) {
        Event event = eventRepository.findById(id).orElse(null);
        model.addAttribute("event", event);
        return "event";
    }

    @PostMapping("/updateEvent/{id}")
    public String updateEvent(@ModelAttribute @Validated(EventValidationGroup.class) Event event, BindingResult result) {
        if (result.hasErrors()) {
            return "event";
        }
        eventRepository.save(event);
        return "redirect:../listEvent";
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


}
