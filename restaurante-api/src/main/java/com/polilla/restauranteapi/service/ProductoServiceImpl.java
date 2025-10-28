package com.polilla.restauranteapi.service; // <-- Corregido

import com.polilla.restauranteapi.model.Producto; // <-- Import corregido
import com.polilla.restauranteapi.repository.ProductoRepository; // <-- Import corregido
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductoServiceImpl implements ProductoService {

    @Autowired
    private ProductoRepository productoRepository;

    @Override
    public Producto crearProducto(Producto producto) {
        return productoRepository.save(producto);
    }

    @Override
    public Producto actualizarProducto(Integer id, Producto productoActualizado) {
        Optional<Producto> productoExistente = productoRepository.findById(id);

        if (productoExistente.isPresent()) {
            Producto producto = productoExistente.get();
            producto.setNombre(productoActualizado.getNombre());
            producto.setDescripcion(productoActualizado.getDescripcion());
            producto.setPrecio(productoActualizado.getPrecio());
            producto.setStock(productoActualizado.getStock());
            producto.setDisponible(productoActualizado.getDisponible());

            return productoRepository.save(producto);
        } else {
            return null; // O lanzar una excepción
        }
    }

    @Override
    public void eliminarProducto(Integer id) {
        productoRepository.deleteById(id);
    }

    @Override
    public List<Producto> listarProductos() {
        return productoRepository.findAll();
    }

    @Override
    public Producto obtenerProductoPorId(Integer id) {
        return productoRepository.findById(id).orElse(null);
    }
}