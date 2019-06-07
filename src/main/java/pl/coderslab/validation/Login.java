package pl.coderslab.validation;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;


@Documented
@Constraint(validatedBy = LoginValidator.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Login {
    String message() default "{pl.coderslab.validation.Login.message}"; // \/ musi byc bo tak
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
