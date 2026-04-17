package com.ejemplo.servlet;

import com.ejemplo.model.Producto;
import com.ejemplo.model.CarritoItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/carrito")
public class CarritoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String accion = req.getParameter("accion");
        HttpSession session = req.getSession();

        @SuppressWarnings("unchecked")
        Map<Integer, CarritoItem> carrito =
            (Map<Integer, CarritoItem>) session.getAttribute("carrito");
        if (carrito == null) {
            carrito = new LinkedHashMap<>();
            session.setAttribute("carrito", carrito);
        }

        if ("agregar".equals(accion)) {
            int idProd = Integer.parseInt(req.getParameter("idProducto"));
            // Buscar producto en el contexto de aplicación
            Producto prod = obtenerProducto(idProd);
            if (prod != null) {
                carrito.merge(idProd,
                    new CarritoItem(prod, 1),
                    (existing, nuevo) -> {
                        existing.setCantidad(existing.getCantidad() + 1);
                        return existing;
                    });
            }
        } else if ("limpiar".equals(accion)) {
            carrito.clear();
        }

        resp.sendRedirect(req.getContextPath() +
            ("verCarrito".equals(accion) ? "/carrito" : "/catalogo"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        @SuppressWarnings("unchecked")
        Map<Integer, CarritoItem> carrito = session != null ?
            (Map<Integer, CarritoItem>) session.getAttribute("carrito") : null;

        req.setAttribute("items", carrito != null ?
            carrito.values() : Collections.emptyList());
        req.getRequestDispatcher("/WEB-INF/views/carrito.jsp")
           .forward(req, resp);
    }

    private Producto obtenerProducto(int id) {
        // Crear una lista de productos inline (duplicación temporal)
        // En un proyecto real, usaríamos una base de datos o servicio compartido
        List<Producto> catalogo = new ArrayList<>(Arrays.asList(
            new Producto(1, "Laptop Dell",       "Computadores", 2500000, 5),
            new Producto(2, "Mouse Logitech",   "Periféricos",   85000, 20),
            new Producto(3, "Teclado Mecánico", "Periféricos",  220000, 10),
            new Producto(4, "Monitor 24\"",     "Computadores",  650000, 8),
            new Producto(5, "Audífonos Sony",   "Audio",        180000, 15),
            new Producto(6, "Webcam HD",        "Periféricos",   95000, 12)
        ));
        return catalogo.stream()
            .filter(p -> p.getId() == id)
            .findFirst()
            .orElse(null);
    }
}

