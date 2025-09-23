package com.utez.backend.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.utez.backend.model.User;
import com.utez.backend.service.UserService;

@RestController
@RequestMapping("/api/users")
@CrossOrigin(origins = "*") // Permite peticiones desde cualquier origen (para desarrollo)
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/register")
    public ResponseEntity<Object> registerUser(@RequestBody User user) {
        try {
            User registeredUser = userService.registerUser(user);
            // Devolvemos el usuario creado con un estado 201 Created
            return new ResponseEntity<>(registeredUser, HttpStatus.CREATED);
        } catch (IllegalStateException e) {
            // Si el email ya existe, devolvemos un estado 409 Conflict
            return new ResponseEntity<>(e.getMessage(), HttpStatus.CONFLICT);
        }
    }
}