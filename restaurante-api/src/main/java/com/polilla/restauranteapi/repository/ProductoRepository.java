package com.polilla.restauranteapi.repository; // <-- Corregido

import com.polilla.restauranteapi.model.Producto; // <-- Import corregido
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductoRepository extends JpaRepository<Producto, Integer> {
    // Spring nos da la magia aquí
}