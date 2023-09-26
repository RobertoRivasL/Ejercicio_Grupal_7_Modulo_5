package controllers;

import dao.UsuarioDAOimpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Usuario;

import java.io.IOException;
import java.util.List;

public class svRegister extends HttpServlet {
    public svRegister() {
        super();

    }

    public void init() throws ServletException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        String nuevoUsername = request.getParameter("nuevoUsuario");
        String nuevoPassword = request.getParameter("nuevoPassword");
        String nuevoNombre = request.getParameter("nombre");
        String nuevaFecha = request.getParameter("fechaNacimiento");
        String nuevoTipo = request.getParameter("Tipo");

        Usuario usuario = new Usuario(nuevoUsername, nuevoPassword, nuevoNombre, nuevaFecha, nuevoTipo);

        boolean usuarioEncontrado = false;

        UsuarioDAOimpl UsuarioDAO = new UsuarioDAOimpl();

        List<Usuario> listado = UsuarioDAO.listarUsuarios();


        for (Usuario usuariox : listado) {
            if (usuariox.getUsername().equals(nuevoUsername)) {
                usuarioEncontrado = true;
                break;
            }
        }

        if (usuarioEncontrado) {
            request.getSession().setAttribute("usuarioRegistrado", true);
            RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
            rd.forward(request, response);
        } else {
            request.getSession().setAttribute("usuarioRegistrado", false);
            UsuarioDAO.registrar(usuario);
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);

        }

    }
}
