package conection;

import java.sql.Connection;
import java.sql.DriverManager;
/* * @author izelo */
public class Conexion {

    private Connection conexion = null;
    private static final String localhost = "";
    private static final String usuario = "root";
    private static final String contraseña = "";
    private static final String bd = "usuarios";

    public Connection getConection() {//Metodo para hacer la conexion con la base de datos.
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/musica", "root", "");
        } catch (Exception e) {
            System.out.println("Error");
        } finally {
            return conexion;
        }
    }
}
