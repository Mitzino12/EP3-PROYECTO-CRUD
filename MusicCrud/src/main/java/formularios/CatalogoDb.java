package formularios;

import conection.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/* @author izelo */
public class CatalogoDb {

    private String consulta = "SELECT * FROM `catalogo_genero`";
    private String consultaCatalogo = "SELECT * FROM `catalogo_genero` WHERE id_genero=?";
    private String agregaGenero = "INSERT INTO `catalogo_genero` SET genero=?";
    private String editaGenero = "UPDATE `catalogo_genero` SET genero=? WHERE id_genero=?";
    private String eliminaGenero = "DELETE FROM `catalogo_genero` WHERE id_genero=?";
    private String eliminaGeneroV2 = "DELETE FROM `catalogo_genero` WHERE id_genero=";

    private Connection conexion = new Conexion().getConection();//Metodo getConection() para hacer la conexion con la base de datos.
    private PreparedStatement stmt;
    private ResultSet rs;

    public List<Catalogo> ListadoCatalogo() throws SQLException {
        List<Catalogo> catalogo = new ArrayList<>(); //Se crea el array de la clase Usuario
        this.stmt = this.conexion.prepareStatement(consulta);//Se hace la conexion con la bd por la variable conexion
        this.rs = this.stmt.executeQuery();
        while (this.rs.next()) {
            catalogo.add(new Catalogo(this.rs.getInt("id_genero"), this.rs.getString("genero")));
        }
        return catalogo;
    }

    public int validaIdCatalogo(int id_genero) throws SQLException {
        String numero = String.valueOf(id_genero);
        if (numero != null) {
            //int id = Integer.parseInt(numero);
            this.stmt = this.conexion.prepareStatement(consultaCatalogo);
            this.stmt.setInt(1, id_genero);
            this.rs = this.stmt.executeQuery();
        }
        return id_genero;
    }

    public void AgregaGenero(Catalogo catalogo) throws SQLException {
        this.stmt = this.conexion.prepareStatement(agregaGenero);
        this.stmt.setString(1, catalogo.getGenero());
        this.stmt.executeUpdate();
    }

    public void editaCancion(Catalogo catalogo) throws SQLException {
        this.stmt = this.conexion.prepareStatement(editaGenero);
        this.stmt.setString(1, catalogo.getGenero());
        this.stmt.setInt(2, catalogo.getIdGenero());
        this.stmt.executeUpdate();
    }

    public void eliminarGenero(Catalogo catalogo) throws SQLException {
        this.stmt = this.conexion.prepareStatement(eliminaGenero);
        this.stmt.setInt(1, catalogo.getIdGenero());
        this.stmt.executeUpdate();
    }

    public void eliminarGenerov2(Catalogo catalogo) throws SQLException {
        this.stmt = this.conexion.prepareStatement(eliminaGeneroV2 + catalogo.getIdGenero());
        this.stmt.executeUpdate();
    }
}