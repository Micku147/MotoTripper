package pl.coderslab.validation;

import pl.coderslab.user.User;


import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class LoginValidator implements ConstraintValidator<Login,String> {

    private User user;

    @Override
    public boolean isValid(String username, ConstraintValidatorContext constraintValidatorContext) {
        if (username == null) {
            return true;
        }
        return username.equals(user.getUsername());
    }

        @Override
        public void initialize (Login constraintAnnotation){
        }


}