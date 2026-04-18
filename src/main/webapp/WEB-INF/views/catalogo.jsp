<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo de Productos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
    <h1>Catálogo de Productos</h1>

    <!-- Barra de búsqueda y filtro -->
    <form method="get" action="${pageContext.request.contextPath}/catalogo">
        <input type="text" name="q" value="${busqueda}"
               placeholder="Buscar producto...">
        <select name="cat">
            <option value="">Todas las categorías</option>
            <c:forEach var="cat" items="${categorias}">
                <option value="${cat}"
                    ${cat == catActual ? "selected" : ""}>${cat}</option>
            </c:forEach>
        </select>
        <button type="submit">Buscar</button>
        <a href="${pageContext.request.contextPath}/carrito" class="btn">Ver carrito</a>
    </form>

    <!-- Tabla de productos -->
    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Categoría</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${empty productos}">
                    <tr>
                        <td colspan="5" class="empty-message">No se encontraron productos.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="p" items="${productos}">
                        <tr>
                            <td>${p.nombre}</td>
                            <td>${p.categoria}</td>
                            <td class="precio">
                                <fmt:formatNumber value="${p.precio}"
                                                  type="currency"
                                                  currencySymbol="$"/>
                            </td>
                            <td>${p.stock}</td>
                            <td>
                                <form method="post"
                                      action="${pageContext.request.contextPath}/carrito">
                                    <input type="hidden" name="accion" value="agregar">
                                    <input type="hidden" name="idProducto" value="${p.id}">
                                    <button type="submit" class="btn btn-success">+ Carrito</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</body>
</html>

