<%--
  Created by IntelliJ IDEA.
  User: Ganon
  Date: 15-07-2023
  Time: 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@include file="footer.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body style="background-color: bisque">

<hr class="hr" style="height: 100px"/>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-4 col-md-6 col-sm-8">
            <form class="register-form" action="svRegister" method="POST" id="passwordForm"
                  onsubmit="return validateForm()">
                <h2 class="text-center mb-4">Registrarse</h2>
                <div class="form-group">
                    <label class="mb-3" for="Usuariox">Nombre de Usuario</label>
                    <input name="nuevoUsuario" type="text" id="Usuariox" class="form-control"
                           placeholder="Ingresa Usuario" minlength="4" required>
                </div>
                <br>
                <div class="form-group">
                    <label class="mb-3" for="passwordy">Contraseña</label>
                    <input name="nuevoPassword" type="password" id="passwordy" class="form-control"
                           placeholder="Ingresa tu contraseña" minlength="6" required>
                </div>

                <div class="form-group">
                    <label class="mb-3" for="confirmPassword">Confirmar contraseña</label>
                    <input name="confirmarPassword" type="password" id="confirmPassword" class="form-control"
                           placeholder="Confirma tu contraseña" required>
                </div>

                <div class="form-group">
                    <label class="mb-3" for="nombre">Nombre</label>
                    <input name="nombre" type="text" id="nombre" class="form-control" placeholder="Ingresa tu nombre"
                           minlength="3" required>
                </div>
                <div class="form-group">
                    <label class="mb-3" for="fechaNacimiento">Fecha de Nacimiento</label>
                    <input name="fechaNacimiento" type="text" id="fechaNacimiento" class="form-control"
                           placeholder="Ingresa tu fecha de nacimiento " required>
                </div>
                <div class="form-group">
                    <label for="Tipo">Tipo</label>
                    <select name="Tipo" class="form-control" id="Tipo">
                        <option>Cliente</option>
                        <option>Profesional</option>
                        <option>Administrativo</option>
                    </select>
                </div>
                <br>
                <div style="display: flex; justify-content: space-between;">
                    <button type="submit" class="btn btn-primary btn-dark mb-3">Registrar</button>
                    <a href="login.jsp" class="btn btn-dark mb-3">Log In</a>
                </div>
                <% Boolean usuarioRegistrado = (Boolean) session.getAttribute("usuarioRegistrado");

                    if (usuarioRegistrado != null && usuarioRegistrado) { %>
                <div id="alertReg" class="alert alert-danger" role="alert">
                    El Usuario que intenta registrar ya existe!
                </div>
                <% } %>
            </form>
        </div>
    </div>
</div>


<script>
    function validateForm() {
        var password = document.getElementById("passwordy").value;
        var confirmPassword = document.getElementById("confirmPassword").value;

        if (password !== confirmPassword) {
            alert("Las contraseñas no coinciden. Por favor, inténtalo de nuevo.");
            return false;
        }

        return true;
    }
</script>

<script>

    function hideAlert() {
        var alertElement = document.getElementById('alertReg');
        alertElement.style.display = 'none';
    }

    setTimeout(hideAlert, 3000);
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
</body>
</html>
