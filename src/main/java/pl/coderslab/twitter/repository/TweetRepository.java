package pl.coderslab.twitter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.twitter.entity.Tweet;

import java.util.List;

public interface TweetRepository extends JpaRepository<Tweet, Long> {


    List<Tweet> findAllByUserId(Long id);
}
