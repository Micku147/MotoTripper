package pl.coderslab.event;

import org.springframework.format.annotation.DateTimeFormat;
import pl.coderslab.user.User;
import pl.coderslab.validation.EventValidationGroup;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;


@Entity
@Table(name = "events")
public class Event {



    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(groups = EventValidationGroup.class)
    private String startPlace;

    private Float startLatitude;
    private Float startLongitude;



    @NotBlank(groups = EventValidationGroup.class)
    private String target;

    private Float targetLatitude;
    private Float targetLongitude;



    @NotNull(groups = EventValidationGroup.class)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate term;

    @NotBlank
    private String speed;

    @NotBlank(groups = EventValidationGroup.class)
    @Lob
    private String description;

    @ManyToOne(cascade = CascadeType.MERGE)
    private User organist;


    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinTable(name = "events_users",
            joinColumns = @JoinColumn(name = "event_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id"))
    private List<User> users = new ArrayList<>();


    public User getOrganist() {
        return organist;
    }

    public void setOrganist(User organist) {
        this.organist = organist;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }




    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStartPlace() {
        return startPlace;
    }

    public void setStartPlace(String startPlace) {
        this.startPlace = startPlace;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public LocalDate getTerm() {
        return term;
    }

    public void setTerm(LocalDate term) {
        this.term = term;
    }

    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Float getStartLatitude() {
        return startLatitude;
    }

    public void setStartLatitude(Float startLatitude) {
        this.startLatitude = startLatitude;
    }

    public Float getStartLongitude() {
        return startLongitude;
    }

    public void setStartLongitude(Float startLongitude) {
        this.startLongitude = startLongitude;
    }

    public Float getTargetLatitude() {
        return targetLatitude;
    }

    public void setTargetLatitude(Float targetLatitude) {
        this.targetLatitude = targetLatitude;
    }

    public Float getTargetLongitude() {
        return targetLongitude;
    }

    public void setTargetLongitude(Float targetLongitude) {
        this.targetLongitude = targetLongitude;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Event event = (Event) o;
        return Objects.equals(id, event.id) &&
                Objects.equals(startPlace, event.startPlace) &&
                Objects.equals(startLatitude, event.startLatitude) &&
                Objects.equals(startLongitude, event.startLongitude) &&
                Objects.equals(target, event.target) &&
                Objects.equals(targetLatitude, event.targetLatitude) &&
                Objects.equals(targetLongitude, event.targetLongitude) &&
                Objects.equals(term, event.term) &&
                Objects.equals(speed, event.speed) &&
                Objects.equals(description, event.description) &&
                Objects.equals(organist, event.organist) &&
                Objects.equals(users, event.users);
    }

    @Override
    public String toString() {
        return " Opis: " + description;
    }
}
