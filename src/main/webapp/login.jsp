<%--
  Created by IntelliJ IDEA.
  User: Ganon
  Date: 14-07-2023
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Ganon

  Date: 13-07-2023
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@include file="footer.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
<hr class="hr" style="height: 100px"/>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-4 col-md-6 col-sm-8">
            <form class="login-form" action="svLogin" method="POST">
                <h2 class="text-center mb-4">Iniciar sesión</h2>
                <div class="form-group">
                    <label class="mb-3" for="Usuario">Nombre de Usuario</label>
                    <input name="rutUsuario" type="text" id="Usuario" class="form-control" placeholder="Ingresa Usuario"
                           required>
                </div>
                <br>
                <div class="form-group">
                    <label class="mb-3" for="passwordx">Contraseña</label>
                    <input name="password" type="password" id="passwordx" class="form-control"
                           placeholder="Ingresa tu contraseña" required>
                </div>
                <br>
                <div style="display: flex; justify-content: space-between;">
                    <button type="submit" class="btn btn-primary btn-dark mb-3">Ingresar</button>
                    <a href="register.jsp" class="btn btn-dark mb-3">Registrarse</a>
                </div>

                <%
                    Boolean usuarioConectado = (Boolean) session.getAttribute("usuarioConectado");

                    if (usuarioConectado != null && !usuarioConectado) { %>
                <div id="alertPass" class="alert alert-danger" role="alert">
                    Contraseña incorrecta. Por favor, inténtalo de nuevo.
                </div>

                <% } %>

            </form>

        </div>
    </div>
</div>


<script>
    // Function to hide the alert after 3 seconds
    function hideAlert() {
        var alertElement = document.getElementById('alertPass');
        alertElement.style.display = 'none';
    }

    setTimeout(hideAlert, 3000);
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
</body>
</html>