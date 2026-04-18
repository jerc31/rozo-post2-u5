<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito de Compras</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
    <h1>Carrito de Compras</h1>

    <!-- Botones de navegación -->
    <form method="get" action="${pageContext.request.contextPath}/catalogo" style="display: inline;">
        <button type="submit" class="btn btn-warning">Volver al Catálogo</button>
    </form>

    <c:choose>
        <c:when test="${empty items}">
            <div class="alert alert-info">
                <p class="empty-message">Tu carrito está vacío.
                   <a href="${pageContext.request.contextPath}/catalogo">Ir al catálogo</a></p>
            </div>
        </c:when>
        <c:otherwise>
            <!-- Tabla de carrito -->
            <table>
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Categoría</th>
                        <th>Precio Unitario</th>
                        <th>Cantidad</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="totalCarrito" value="0" />
                    <c:forEach var="item" items="${items}">
                        <tr>
                            <td>${item.producto.nombre}</td>
                            <td>${item.producto.categoria}</td>
                            <td class="precio">
                                <fmt:formatNumber value="${item.producto.precio}"
                                                  type="currency"
                                                  currencySymbol="$"/>
                            </td>
                            <td>
                                <span class="cantidad-control">
                                    ${item.cantidad}
                                </span>
                            </td>
                            <td class="precio">
                                <fmt:formatNumber value="${item.subtotal}"
                                                  type="currency"
                                                  currencySymbol="$"/>
                            </td>
                        </tr>
                        <c:set var="totalCarrito" value="${totalCarrito + item.subtotal}" />
                    </c:forEach>
                </tbody>
            </table>

            <!-- Resumen de compra -->
            <div class="summary">
                <div class="summary-row">
                    <span>Total de items:</span>
                    <span>
                        <c:set var="cantidadTotal" value="0" />
                        <c:forEach var="item" items="${items}">
                            <c:set var="cantidadTotal" value="${cantidadTotal + item.cantidad}" />
                        </c:forEach>
                        ${cantidadTotal}
                    </span>
                </div>
                <div class="summary-row total">
                    <span>Total a pagar:</span>
                    <span>
                        <fmt:formatNumber value="${totalCarrito}"
                                          type="currency"
                                          currencySymbol="$"/>
                    </span>
                </div>
            </div>

            <!-- Botones de acción -->
            <div style="text-align: center; margin: 20px;">
                <form method="post" action="${pageContext.request.contextPath}/carrito" style="display: inline;">
                    <input type="hidden" name="accion" value="limpiar">
                    <button type="submit" class="btn btn-danger">Limpiar Carrito</button>
                </form>
                <a href="${pageContext.request.contextPath}/confirmacion" class="btn btn-success">Confirmar Compra</a>
            </div>
        </c:otherwise>
    </c:choose>
</body>
</html>

