package com.polilla.restauranteapi.controller; // <-- Corregido

import com.polilla.restauranteapi.model.Producto; // <-- Import corregido
import com.polilla.restauranteapi.service.ProductoService; // <-- Import corregido
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/productos") // Ruta base del enunciado
public class ProductoController {

    @Autowired
    private ProductoService productoService;

    // POST /api/productos (Ruta del enunciado)
    @PostMapping
    public Producto crearProducto(@RequestBody Producto producto) {
        return productoService.crearProducto(producto);
    }

    // GET /api/productos (Ruta del enunciado)
    @GetMapping
    public List<Producto> listarProductos() {
        return productoService.listarProductos();
    }

    // PUT /api/productos/{id} (Ruta del enunciado)
    @PutMapping("/{id}")
    public Producto actualizarProducto(@PathVariable("id") Integer id, @RequestBody Producto producto) {
        return productoService.actualizarProducto(id, producto);
    }

    // DELETE /api/productos/{id} (Ruta del enunciado)
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminarProducto(@PathVariable("id") Integer id) {
        productoService.eliminarProducto(id);
        return ResponseEntity.ok().build();
    }

    // (Endpoint extra para buscar por ID)
    @GetMapping("/{id}")
    public Producto obtenerProductoPorId(@PathVariable("id") Integer id) {
        return productoService.obtenerProductoPorId(id);
    }
}