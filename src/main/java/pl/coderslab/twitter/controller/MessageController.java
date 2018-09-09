package pl.coderslab.twitter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.twitter.entity.Message;
import pl.coderslab.twitter.entity.Tweet;
import pl.coderslab.twitter.entity.User;
import pl.coderslab.twitter.repository.CommentRepository;
import pl.coderslab.twitter.repository.MessageRepository;
import pl.coderslab.twitter.repository.TweetRepository;
import pl.coderslab.twitter.repository.UserRepository;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController {
    @Autowired
    UserRepository userRepository;

    @Autowired
    MessageRepository messageRepository;


    @Autowired
    Validator validator;

    @RequestMapping(value="/add", method = RequestMethod.GET) // /tweet/add?userId=1
    public String showMessageForm(Model model, @RequestParam("senderId") Long senderId) { // TODO automativ strong 2 long conversion
        Message m = new Message();
        m.setSender(userRepository.findById(senderId).get());
        model.addAttribute("message", m);
        return "messageForm";
    }

    @RequestMapping(value="/add", method = RequestMethod.POST)
    public String saveTweet(@Valid Message message, BindingResult result, Model model) {

        if (result.hasErrors()) {
            return "messageForm";
        }
        User receiver = new User();
        message.setDate(new Date());
        message.setReceiver(userRepository.getUserIdByUsername(receiver.getUsername()));
        messageRepository.save(message);
        return "redirect:/user/" + message.getSender().getId() ;
    }
}
