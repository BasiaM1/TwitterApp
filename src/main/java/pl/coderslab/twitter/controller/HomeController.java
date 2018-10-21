package pl.coderslab.twitter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.twitter.entity.Tweet;
import pl.coderslab.twitter.repository.CommentRepository;
import pl.coderslab.twitter.repository.TweetRepository;
import pl.coderslab.twitter.entity.User;
import pl.coderslab.twitter.repository.UserRepository;
import pl.coderslab.twitter.utils.TweetByDateComparator;

import java.util.Collections;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    TweetRepository tweetRepository;
    @Autowired
    CommentRepository commentRepository;

    @RequestMapping({"/home", "/"})
    public String welcomePage(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("allUsers", users);
        List<Tweet> userTweets = tweetRepository.findAll();

        Collections.sort(userTweets, new TweetByDateComparator());

        model.addAttribute("tweets", userTweets);
        return "index";
    }


}

