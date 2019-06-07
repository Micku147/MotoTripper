package pl.coderslab.login;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.user.User;
import pl.coderslab.user.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes("userSession")
public class LoginController {

    private UserService userService;

    @Autowired
    public LoginController(UserService userService) {
        this.userService = userService;
    }


    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model) {
        User user = userService.findByUsername(username);
        model.addAttribute("isLogged", false);
        if (user == null) {
            return "login";
        }


        if (BCrypt.checkpw(password, user.getPassword())) {
            model.addAttribute("userSession", user);
            model.addAttribute("isLogged", true);
            if (user.getUsername().equals("admin")) {
                return "redirect:/admin/list";
            }
            return "redirect:event/list";
        }
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session, Model model) {
       model.addAttribute("userSession", null);
            session.invalidate();

        return "index";
    }
}

