package pl.coderslab.twitter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.twitter.entity.Comment;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    List<Comment> findAllByTweetId(Long id);

}
