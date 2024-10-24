package com.example.techNovaa.controller;

import com.example.techNovaa.bean.User;
import com.example.techNovaa.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {
    private final UserService userService;
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
    public String createUser(@Valid @ModelAttribute("user") User user , BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "users-list";
        }
        if (user.getExpirationDate().isBefore(user.getRegistrationDate())) {
            model.addAttribute("errorMessage", "La date d'expiration doit être après la date d'enregistrement.");
            model.addAttribute("user", user);
            return "users-list";
        }
        userService.saveUser(user);
        return "redirect:/users";
    }
    @GetMapping("/edit/{id}")
    public String editUser(@PathVariable Long id, Model model) {
        User user = userService.getUserById(id).orElse(null);
        model.addAttribute("user", user);
        return "edit-user";
    }
    @PostMapping("/update")
    public String updateUser(@Valid @ModelAttribute("user") User user , BindingResult result,Model model) {
        if (result.hasErrors()) {
            return "edit-user";
        }
        if (user.getExpirationDate().isBefore(user.getRegistrationDate())) {
            model.addAttribute("errorMessage", "La date d'expiration doit être après la date d'enregistrement.");
            model.addAttribute("user", user);
            return "edit-user";
        }
        userService.updateUser(user);
        return "redirect:/users";
    }
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return "redirect:/users";
    }

}

