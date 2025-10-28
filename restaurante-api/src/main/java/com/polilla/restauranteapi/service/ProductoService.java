package com.polilla.restauranteapi.service; // <-- Corregido

import com.polilla.restauranteapi.model.Producto; // <-- Import corregido
import java.util.List;

public interface ProductoService {

    Producto crearProducto(Producto producto);
    Producto actualizarProducto(Integer id, Producto productoActualizado);
    void eliminarProducto(Integer id);
    List<Producto> listarProductos();
    Producto obtenerProductoPorId(Integer id);
}