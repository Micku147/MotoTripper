package pl.coderslab.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User,Long> {

    User findByUsername(String username);


    @Query("select u from User u where u.username = 'admin'")
    User findByUsernameAdmin(String username);

}
