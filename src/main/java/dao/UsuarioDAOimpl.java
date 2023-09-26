package dao;

import conexion.Conexion;
import idao.IUsuarioDAO;
import models.Usuario;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAOimpl implements IUsuarioDAO {


    @Override
    public boolean registrar(Usuario usuario) {

        boolean registrar = false;
        Statement stm = null;
        Connection con = null;

        String sql = "INSERT INTO users (username,password,nombre,fechaNacimiento,tipo) values('" +
                usuario.getUsername() + "','" + usuario.getPassword() + "','" + usuario.getNombre() + "','" + usuario.getFechaNacimiento() + "'" +
                ",'" + usuario.getTipo() + "')";

        try {
            con = Conexion.conectar();
            stm = con.createStatement();
            stm.execute(sql);
            registrar = true;
            stm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: clase UsuarioDAOimpr en el metodo registrar");
            e.printStackTrace();
        }
        return registrar;

    }

    @Override
    public boolean eliminar(Usuario usuario) {
        boolean eliminar = false;
        Statement stm = null;
        Connection con = null;

        String sql = "DELETE from users where id = '" + usuario.getId() + "'";

        try {
            con = Conexion.conectar();
            stm = con.createStatement();
            stm.execute(sql);
            eliminar = true;
            stm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: clase UsuarioDAOimpr en el metodo eliminar");
            e.printStackTrace();
        }
        return eliminar;
    }

    @Override
    public boolean modificar(Usuario usuario) {
        boolean modificar = false;
        Statement stm = null;
        Connection con = null;

        String sql = "UPDATE users SET username='" + usuario.getUsername() + "' WHERE id ='" + usuario.getId() + "'";

        try {
            con = Conexion.conectar();
            stm = con.createStatement();
            stm.execute(sql);
            modificar = true;
            stm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: clase UsuarioDAOimpr en el metodo modificar");
            e.printStackTrace();
        }
        return modificar;
    }


    public List<Usuario> listarUsuarios() {
        List<Usuario> listaUsuarios = new ArrayList<>();
        Statement stm = null;
        Connection con = null;
        ResultSet rs = null;

        String sql = "SELECT * from users ORDER BY id";

        try {
            con = Conexion.conectar();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);


            while (rs.next()) {

                Usuario usuario = new Usuario();

                usuario.setId(rs.getInt(1));
                usuario.setUsername(rs.getString(2));
                usuario.setPassword(rs.getString(3));
                usuario.setNombre(rs.getString(4));
                usuario.setFechaNacimiento(rs.getString(5));
                usuario.setTipo(rs.getString(6));
                usuario.setCreated_at(rs.getDate(7));

                listaUsuarios.add(usuario);

            }
            rs.close();
            stm.close();
            con.close();

        } catch (SQLException e) {
            System.out.println("Error: clase UsuarioDAOimpl en el metodo listar");
            e.printStackTrace();
        }

        return listaUsuarios;
    }

}
