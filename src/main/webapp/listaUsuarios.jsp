<%@ page import="dao.UsuarioDAOimpl" %>
<%@ page import="models.Usuario" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Ganon
  Date: 22-07-2023
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="navbar.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
    <title>Lista Usuarios</title>
</head>
<body>
<% if (usuarioConectado != null && usuarioConectado) { %>
<h1 class="text-center">Lista de Usuarios</h1>
<hr class="hr" style="height: 20px"/>
<table class="table table-dark">
    <thead>
    <tr>
        <th scope="col">Identificador</th>
        <th scope="col">Usuario</th>
        <th scope="col">Nombre</th>
        <th scope="col">Fecha Nacimiento</th>
        <th scope="col">Tipo</th>
        <th scope="col">Creacion</th>
    </tr>
    </thead>
    <%
        UsuarioDAOimpl UsuarioDAO = new UsuarioDAOimpl();
        List<Usuario> usuarios = UsuarioDAO.listarUsuarios();
        for (Usuario usuario : usuarios) {
    %>
    <tbody>
    <tr>
        <td><%= usuario.getId()%>
        </td>
        <td><%= usuario.getUsername()%>
        </td>
        <td><%= usuario.getNombre()%>
        </td>
        <td><%= usuario.getFechaNacimiento()%>
        </td>
        <td><%= usuario.getTipo()%>
        </td>
        <td><%= usuario.getCreated_at()%>
        </td>
    </tr>
    </tbody>
    <%}%>
</table>

<% } else { %>
<% response.sendRedirect("login.jsp"); %>
<% } %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
</html>
