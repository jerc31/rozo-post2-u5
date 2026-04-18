<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda Online - Inicio</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
    <h1>Bienvenido a Nuestra Tienda Online</h1>

    <div style="text-align: center; padding: 40px 20px; background: white; margin: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
        <h2>Tienda de Productos Electrónicos</h2>
        <p style="font-size: 1.2rem; color: #666; margin: 20px 0;">
            Explora nuestro catálogo completo de productos tecnológicos de alta calidad.
        </p>
        <a href="${pageContext.request.contextPath}/catalogo" class="btn btn-success"
           style="font-size: 1.1rem; padding: 15px 40px; margin-top: 20px;">
            Ir al Catálogo
        </a>
    </div>

    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; max-width: 1200px; margin: 20px auto; padding: 0 20px;">
        <div style="background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); text-align: center;">
            <h3 style="color: #667eea;">✓ Catálogo Completo</h3>
            <p>Más de 1000 productos disponibles en diferentes categorías.</p>
        </div>
        <div style="background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); text-align: center;">
            <h3 style="color: #667eea;">✓ Búsqueda Avanzada</h3>
            <p>Busca productos por nombre o filtra por categoría fácilmente.</p>
        </div>
        <div style="background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); text-align: center;">
            <h3 style="color: #667eea;">✓ Carrito Inteligente</h3>
            <p>Gestiona tu carrito de compras de forma segura en tu sesión.</p>
        </div>
    </div>

    <footer style="text-align: center; padding: 20px; color: #999; margin-top: 40px; border-top: 1px solid #ddd;">
        <p>&copy; 2026 Tienda Online. Todos los derechos reservados.</p>
    </footer>
</body>
</html>

