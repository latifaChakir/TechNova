package com.example.techNovaa;

import com.example.techNovaa.bean.User;
import com.example.techNovaa.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        UserService userService = context.getBean(UserService.class);

        List<User> users = userService.getUsers();

        if (users.isEmpty()) {
            System.out.println("Aucun utilisateur trouvé.");
        } else {
            for (User user : users) {
                System.out.println("ID: " + user.getId() + ", Prénom: " + user.getFirstName() + ", Nom: " + user.getLastName());
            }
        }
    }
}
