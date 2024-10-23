package com.TachNova.bean;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;


@Entity
@Table(name = "users")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "firstName", nullable = false)
    @NotBlank(message = "First name is required")
    private String firstName;
    @Column(name = "lastName", nullable = false)
    @NotBlank(message = "Last name is required")
    private String lastName;
    @Column(name = "identificationNumber" , nullable = false, unique = true)
    @NotBlank(message = "identification Number is required")
    private String identificationNumber;
    @Column(name = "nationality",nullable = false)
    @NotBlank(message = "nationality name is required")
    private String nationality;
    @Column(name = "registrationDate",nullable = false)
    private LocalDate registrationDate;
    @Column(name = "expirationDate",nullable = false)
    private LocalDate expirationDate;

}
