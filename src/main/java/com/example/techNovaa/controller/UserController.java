package com.example.techNovaa.controller;

import com.example.techNovaa.bean.User;
import com.example.techNovaa.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {
    private final UserService userService;
    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
    @GetMapping
    public String getAllUsers(Model model) {
        List<User> users = userService.getUsers();
        model.addAttribute("users", users);
        return "users-list";
    }

    @PostMapping("/create")
    public String createUser(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "users-list";
        }
        userService.saveUser(user);
        return "redirect:/users";
    }

}

