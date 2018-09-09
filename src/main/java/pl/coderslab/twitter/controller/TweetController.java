package pl.coderslab.twitter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.twitter.entity.Comment;
import pl.coderslab.twitter.entity.Tweet;
import pl.coderslab.twitter.entity.User;
import pl.coderslab.twitter.repository.CommentRepository;
import pl.coderslab.twitter.repository.TweetRepository;
import pl.coderslab.twitter.repository.UserRepository;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/tweet")
public class TweetController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    TweetRepository tweetRepository;

    @Autowired
    CommentRepository commentRepository;

    @Autowired
    Validator validator;


    @RequestMapping(value="/add", method = RequestMethod.GET) // /tweet/add?userId=1
    public String showAddTweetForm(Model model, @RequestParam("userId") Long userId) { // TODO automativ strong 2 long conversion
        Tweet t = new Tweet();
        t.setUser(userRepository.findById(userId).get());
        model.addAttribute("tweet", t);
        return "tweetForm";
    }

    @RequestMapping(value="/add", method = RequestMethod.POST)
    public String saveTweet(@Valid Tweet tweet, BindingResult result,  Model model) {

        if (result.hasErrors()) {
            return "tweetForm";
        }
        tweet.setCreated(new Date());
        tweetRepository.save(tweet);
        return "redirect:/user/" + tweet.getUser().getId() ;
    }


    @ModelAttribute("/all")
    public List<Tweet> getAllTweets() {
        List<Tweet> tweetList= tweetRepository.findAll();
        return tweetList;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editTweet(Model model, @PathVariable Long id) {

        Tweet tweet = tweetRepository.getOne(id);
        model.addAttribute("tweet", tweet);
        return "tweetForm";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String editTweetPost(@Valid Tweet tweet, BindingResult result) {
//        User user = userRepository.getOne(id);
//        model.addAttribute("user", user);
        if (result.hasErrors()) {
            return "tweetForm";
        }
        tweet.setCreated(new Date());
//        tweet.setUser(user);
        tweetRepository.save(tweet);
        return "redirect:/user/" + tweet.getUser().getId();
    }


    @RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
    public String deleteTweet(@PathVariable Long id) {
        Tweet deleteTweet = tweetRepository.getOne(id);

        User loggedIn = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(!deleteTweet.getUser().getId().equals(loggedIn.getId())){
            throw new SecurityException("you are not a tweet owner");
        }

        Long userId = deleteTweet.getUser().getId();
        tweetRepository.delete(deleteTweet);
        return "redirect:/user/" + userId;
    }

    @RequestMapping(value = "/{id}/comment", method = RequestMethod.GET)
    public String commentPrepare(Model model, @PathVariable Long id){

        model.addAttribute("comment", new Comment());
        return "commentForm";
    }

    @RequestMapping(value = "/{tweetId}/comment", method = RequestMethod.POST)
    public String comment(@ModelAttribute Comment comment, @PathVariable Long tweetId){
        User commentingUser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                //userRepository.getOne(1L); // TODO get logged in user

        comment.setUser(commentingUser);
        comment.setTweet(tweetRepository.getOne(tweetId));
        comment.setCreated(new Date());

        commentRepository.save(comment);

        return "redirect:/";

    }


//    @RequestMapping(value = "/{tweetId}/comments", method = RequestMethod.GET)
//    public String getCommentByTweet(Model model, @PathVariable Long tweetId) {
//        Tweet tweetCommented = tweetRepository.getOne(tweetId);
//        model.addAttribute("tweet", tweetCommented);
//        List<Comment> tweetComments = commentRepository.findAllByTweetId(tweetId);
//        model.addAttribute("comments", tweetComments);
//        return "tweetComments";
//    }
}
