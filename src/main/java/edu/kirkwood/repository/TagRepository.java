package edu.kirkwood.repository;

import edu.kirkwood.model.Tag;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TagRepository extends JpaRepository<Tag, Integer> {

    List<Tag> findAllByOrderByLabelAsc();
}
