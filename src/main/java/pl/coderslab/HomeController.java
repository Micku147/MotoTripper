package pl.coderslab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.email.Email;
import pl.coderslab.email.EmailService;
import pl.coderslab.event.Event;
import pl.coderslab.event.EventRepository;
import pl.coderslab.user.User;
import pl.coderslab.user.UserRepository;
import pl.coderslab.user.UserService;
import pl.coderslab.validation.EventValidationGroup;
import pl.coderslab.validation.UserValidationGroup;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import java.util.List;

@Controller
public class HomeController {

        @Autowired
        private EmailService emailService;

        private UserRepository userRepository;
        private UserService userService;
        private EventRepository eventRepository;

        @Autowired
        public HomeController(UserRepository userRepository, UserService userService, EventRepository eventRepository) {
                this.userRepository = userRepository;
                this.userService = userService;
                this.eventRepository = eventRepository;
        }

        @GetMapping("/login")
        public String login (){
                return "login";
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

                try{ userService.saveUser(user);
                        emailService.sendSimpleMessage(user.getEmail(),"Witaj "+user.getUsername()+" !","Zapraszamy do brania udziału w naszych eventach :D");

                }catch (Exception e){
                        return "loginError";
                }

                return "redirect:login";
        }

        @GetMapping("/")
        public String home() {
                return "index";
        }

        @GetMapping("/list")
        public String eventList(Model model) {
                List<Event> events = eventRepository.findAll();

                model.addAttribute("events", events);

                return "eventList";
        }


        @GetMapping("/description/{id}")
        public String eventDescription(@PathVariable Long id, Model model) {
                Event event = eventRepository.findById(id).orElse(null);
                model.addAttribute("event",event);
                return "description";
        }

        @GetMapping("/credential-error")
        public String credentialError(){
                return "credential-error";
        }



        @GetMapping("/email")
        public String mail(HttpServletRequest request, HttpServletResponse response){
        String message = "Zapraszamy do udziału w naszych eventach :D";
        emailService.sendSimpleMessage("","",message);

        return "send";
        }


        @GetMapping("/sendEmail")
        public String sendEmail (Model model) {
                model.addAttribute("email", new Email());
                return "emailClient";
        }

        @PostMapping("/sendEmail")
        public String addUser(Email email) {
              String mail = "michalkwiatkowski95@gmail.com";
                emailService.sendSimpleMessage(mail,email.getSubject(),email.getMessage());
                return "send";
        }

        @GetMapping("/onlysend")
        public String sendOnly(){
                return "send";
        }
}