package pl.coderslab.user;

import pl.coderslab.event.Event;
import pl.coderslab.validation.Login;
import pl.coderslab.validation.UserValidationGroup;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;


@Entity
@Table(name = "users")
public class User {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @NotBlank(groups = UserValidationGroup.class)
    @Column(unique = true)
    private String username;


    @NotBlank(groups = UserValidationGroup.class)
    private String password;

    @NotBlank(groups = UserValidationGroup.class)
    @Email(groups = UserValidationGroup.class)

    private String email;

    @NotBlank(groups = UserValidationGroup.class)
    private String vehicle;
//
//    @ManyToMany(cascade = CascadeType.ALL)
//    @JoinTable(name = "events_users")
//    private List<Event> event = new ArrayList<>();
//
//    @OneToMany(mappedBy = "organist", cascade = CascadeType.ALL)
//    private List<Event> events = new ArrayList<>();
//


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getVehicle() {
        return vehicle;
    }

    public void setVehicle(String vehicle) {
        this.vehicle = vehicle;
    }

    @Override
    public String toString() {
        return  email;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(id, user.id) &&
                Objects.equals(username, user.username) &&
                Objects.equals(password, user.password) &&
                Objects.equals(email, user.email) &&
                Objects.equals(vehicle, user.vehicle);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, password, email, vehicle);
    }
}
