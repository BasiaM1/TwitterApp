
package pl.coderslab.twitter.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.twitter.repository.TweetRepository;
import pl.coderslab.twitter.repository.UserRepository;
import pl.coderslab.twitter.entity.Tweet;
import pl.coderslab.twitter.entity.User;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    TweetRepository tweetRepository;

    @Autowired
    Validator validator;

    @RequestMapping(value = ("/register"), method = RequestMethod.GET)
    public String registerForm(Model model) {
        model.addAttribute("user", new User());
        return "userRegistration";
    }

    @RequestMapping(value = ("/register"), method = RequestMethod.POST)
    public String registred(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "userRegistration";
        }

        user.setEnabled(true);
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        userRepository.save(user);
        return "redirect:/user/" + user.getId();
    }

    @RequestMapping(value = "/profile", method = RequestMethod.POST)
    public String showProfile(){
        User loggedIn = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return "redirect:/user/" +loggedIn.getId();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String showUserProfile(@PathVariable Long id, Model model) {
        User loggedIn = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(!id.equals(loggedIn.getId())){
            // TODO
            throw new SecurityException("you are not the profile owner");
        }


        User userShown = userRepository.getOne(id);
        model.addAttribute("userProfile", userShown);
        List<Tweet> userTweets = tweetRepository.findAllByUserId(id);
        model.addAttribute("tweets", userTweets);
        return "profile";
    }


    @RequestMapping(value = "/{id}/aboutUser", method = RequestMethod.GET)
    public String aboutByUser(Model model, @PathVariable Long id) {
        User user = userRepository.getOne(id);
        model.addAttribute("user", user);
        List<Tweet> userTweets = tweetRepository.findAllByUserId(id);
        model.addAttribute("tweets", userTweets);
        return "profileVisible";
    }


    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String getAllUsers(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("allUsers", users);
        return "allUsers";
    }
    @RequestMapping(value = "/{id}/tweets", method = RequestMethod.GET)
    public String getTweetsByUser(Model model, @PathVariable Long id) {
        User user = userRepository.getOne(id);
        model.addAttribute("user", user);
        List<Tweet> userTweets = tweetRepository.findAllByUserId(id);
        model.addAttribute("tweets", userTweets);
        return "usertweets";
    }

}
