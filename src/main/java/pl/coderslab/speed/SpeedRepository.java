package pl.coderslab.speed;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.event.Event;

public interface SpeedRepository extends JpaRepository<Speed,Long> {
}
