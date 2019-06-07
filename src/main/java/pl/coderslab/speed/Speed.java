package pl.coderslab.speed;


import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "speeds")
public class Speed {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String speed;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed;
    }
}
