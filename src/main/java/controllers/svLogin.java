package controllers;

import dao.UsuarioDAOimpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Contenedor;
import models.Usuario;

import java.io.IOException;
import java.util.List;

public class svLogin extends HttpServlet {
    private Contenedor contenedor;

    public svLogin() {
        super();

    }

    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String rutUsuario = request.getParameter("rutUsuario");
        String password = request.getParameter("password");

        boolean usuarioEncontrado = false;
        String name = "";

        UsuarioDAOimpl UsuarioDAO = new UsuarioDAOimpl();

        List<Usuario> listado = UsuarioDAO.listarUsuarios();

        for (Usuario usuario : listado) {
            if (usuario.getUsername().equals(rutUsuario) && usuario.getPassword().equals(password)) {
                usuarioEncontrado = true;
                name = usuario.getNombre();
                break;
            }

        }

        if (usuarioEncontrado) {
            request.getSession().setAttribute("usuarioConectado", true);
            request.getSession().setAttribute("nombre", name);
            RequestDispatcher rd = request.getRequestDispatcher("/inicio.jsp");
            rd.forward(request, response);
        } else {
            request.getSession().setAttribute("usuarioConectado", false);
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }

    }
}