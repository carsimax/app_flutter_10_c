package com.utez.backend.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.utez.backend.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    // Método para buscar un usuario por su email.
    // Lo usaremos para verificar si un usuario ya existe.
    Optional<User> findByEmail(String email);
}