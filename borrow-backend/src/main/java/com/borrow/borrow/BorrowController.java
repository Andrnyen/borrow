package com.borrow.borrow;

import com.borrow.borrow.models.User;
import com.borrow.borrow.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
public class BorrowController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/hello")
    public String hello(@RequestParam(value = "name", defaultValue = "World") String name) {
        return String.format("Hello %s!", name);
    }

    @GetMapping("/users")
    public void getUser(@RequestParam String lastName) {
        List<User> foundUsers = userRepository.findByLastName(lastName);
        for (User user : foundUsers) {
            System.out.println("Found user: " + user.getFirstName());
        }
    }
}
