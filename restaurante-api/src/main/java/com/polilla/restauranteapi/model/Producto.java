package com.polilla.restauranteapi.model; // (Tu paquete)

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "producto")
@Data
public class Producto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idProducto") // <--- ¡ASEGÚRATE DE TENER ESTA LÍNEA!
    private Integer idProducto;

    @Column(name = "idRestaurante") // <--- ¡Y ESTA!
    private Integer idRestaurante;

    @Column(name = "idCategoria") // <--- ¡Y ESTA!
    private Integer idCategoria;

    // Para los demás (nombre, descripcion, etc.), no es necesario
    // porque se llaman igual en Java y en tu BDD.
    private String nombre;
    private String descripcion;
    private Float precio;
    private Integer stock;
    private String imagen;
    private Boolean disponible;
}