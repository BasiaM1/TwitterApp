package pl.coderslab.twitter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.twitter.entity.Message;
import pl.coderslab.twitter.entity.Tweet;

import java.util.List;


public interface MessageRepository extends JpaRepository<Message, Long> {
    List<Message> findAllBySender(Long id);
}

