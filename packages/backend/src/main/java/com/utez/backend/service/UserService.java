package com.utez.backend.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.utez.backend.model.User;
import com.utez.backend.repository.UserRepository;

@Service
@Transactional // Asegura que todas las operaciones de la DB se ejecuten en una transacción
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public User registerUser(User user) {
        // 1. Verificar si el email ya está en uso
        if (userRepository.findByEmail(user.getEmail()).isPresent()) {
            throw new IllegalStateException("El email ya está en uso.");
        }

        // 2. Cifrar la contraseña antes de guardarla
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);

        // 3. Guardar el nuevo usuario en la base de datos
        return userRepository.save(user);
    }
}