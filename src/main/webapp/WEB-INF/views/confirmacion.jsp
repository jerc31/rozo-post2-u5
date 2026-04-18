<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmación de Pedido</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
    <h1>Confirmación de Pedido</h1>

    <c:choose>
        <c:when test="${empty sessionScope.carrito or empty sessionScope.carrito}">
            <div class="alert alert-warning">
                <p class="empty-message">No hay items en el carrito para confirmar.
                   <a href="${pageContext.request.contextPath}/catalogo">Ir al catálogo</a></p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-success">
                <h2>¡Pedido confirmado exitosamente!</h2>
                <p>Tu compra ha sido registrada. A continuación se detalla tu pedido:</p>
            </div>

            <!-- Tabla de resumen del pedido -->
            <table>
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio Unitario</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="totalPedido" value="0" />
                    <c:forEach var="item" items="${sessionScope.carrito.values()}">
                        <tr>
                            <td>${item.producto.nombre}</td>
                            <td>${item.cantidad}</td>
                            <td class="precio">
                                <fmt:formatNumber value="${item.producto.precio}"
                                                  type="currency"
                                                  currencySymbol="$"/>
                            </td>
                            <td class="precio">
                                <fmt:formatNumber value="${item.subtotal}"
                                                  type="currency"
                                                  currencySymbol="$"/>
                            </td>
                        </tr>
                        <c:set var="totalPedido" value="${totalPedido + item.subtotal}" />
                    </c:forEach>
                </tbody>
            </table>

            <!-- Resumen final -->
            <div class="summary">
                <div class="summary-row">
                    <span>Total de items:</span>
                    <span>
                        <c:set var="cantidadTotal" value="0" />
                        <c:forEach var="item" items="${sessionScope.carrito.values()}">
                            <c:set var="cantidadTotal" value="${cantidadTotal + item.cantidad}" />
                        </c:forEach>
                        ${cantidadTotal}
                    </span>
                </div>
                <div class="summary-row total">
                    <span>Total del pedido:</span>
                    <span>
                        <fmt:formatNumber value="${totalPedido}"
                                          type="currency"
                                          currencySymbol="$"/>
                    </span>
                </div>
            </div>

            <!-- Información del pedido -->
            <div style="background: white; padding: 20px; margin: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
                <h3>Información de tu pedido:</h3>
                <p><strong>Número de pedido:</strong> #${sessionScope.carrito.hashCode()}</p>
                <p><strong>Fecha y hora:</strong> <%= new java.util.Date() %></p>
                <p><strong>Estado:</strong> Confirmado</p>
                <p>Tu pedido está siendo procesado. Recibirás un correo de confirmación próximamente.</p>
            </div>

            <!-- Botones de acción -->
            <div style="text-align: center; margin: 20px;">
                <a href="${pageContext.request.contextPath}/catalogo" class="btn btn-success">Continuar Comprando</a>
            </div>
        </c:otherwise>
    </c:choose>
</body>
</html>

