package pl.coderslab.event;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.persistence.Lob;

public interface EventRepository extends JpaRepository<Event,Long> {



        @Query(value ="update events_users set User_id = null where event_id =?1", nativeQuery = true)
        void setNullAtuserInEventsUsers(Long id);

         long findEventIdByOrganistId(Long id);


        void deleteEventByOrganistId(Long id);



}
