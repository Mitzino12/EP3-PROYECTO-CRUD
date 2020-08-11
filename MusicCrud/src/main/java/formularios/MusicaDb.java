package formularios;

import conection.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*  @author izelo */
public class MusicaDb {

    private String consulta = "SELECT * FROM `musica`";
    private String agregaCancion = "INSERT INTO `musica` SET cancion=?, duracion=?, grupo=?, album=?, id_genero=?";
    private String repertorio = "SELECT musica.id_cancion, musica.cancion, musica.duracion, musica.grupo, musica.album, catalogo_genero.genero FROM musica, catalogo_genero WHERE musica.id_genero=catalogo_genero.id_genero ORDER BY(cancion)ASC";
    private String repertorioG = "SELECT musica.id_cancion, musica.cancion, musica.duracion, musica.grupo, musica.album, catalogo_genero.genero FROM musica, catalogo_genero WHERE musica.id_genero=catalogo_genero.id_genero AND catalogo_genero.id_genero=?";
    private String editaCancion = "UPDATE `musica` SET cancion=?, duracion=?, grupo=?, album=?, id_genero=? WHERE id_cancion=?";
    private String consultaCancion = "SELECT * FROM `musica` WHERE id_cancion=?";
    private String eliminaCancion = "DELETE FROM `musica` WHERE id_cancion=?";
    private String eliminaCancionV2 = "DELETE FROM `musica` WHERE id_cancion=";
    private String consultaAlbum = "SELECT musica.id_cancion, musica.cancion, musica.duracion, musica.grupo, musica.album, catalogo_genero.genero FROM musica, catalogo_genero WHERE musica.id_genero=catalogo_genero.id_genero AND musica.album=?";
    private String consultaGrupo = "SELECT musica.id_cancion, musica.cancion, musica.duracion, musica.grupo, musica.album, catalogo_genero.genero FROM musica, catalogo_genero WHERE musica.id_genero=catalogo_genero.id_genero AND musica.grupo=?";
    private String eliminaCanciones = "DELETE FROM `musica` WHERE id_genero=?";

    private Connection conexion = new Conexion().getConection();//Metodo getConection() para hacer la conexion con la base de datos.
    private PreparedStatement stmt;
    private ResultSet rs;

    public List<Musica> ListadoMusica() throws SQLException {
        List<Musica> musica = new ArrayList<>();
        this.stmt = this.conexion.prepareStatement(repertorio);//Se hace la conexion con la bd por la variable conexion
        this.rs = this.stmt.executeQuery();
        while (this.rs.next()) {
            musica.add(new Musica(this.rs.getInt("id_cancion"), this.rs.getString("cancion"), this.rs.getFloat("duracion"), this.rs.getString("grupo"), this.rs.getString("album"), this.rs.getString("genero")));
        }
        return musica;
    }

    public List<Musica> ListadoMusicaGenero(Catalogo catalogo) throws SQLException {
        List<Musica> musicaG = new ArrayList<>();
        this.stmt = this.conexion.prepareStatement(repertorioG);//Se hace la conexion con la bd por la variable conexion
        this.stmt.setInt(1, catalogo.getIdGenero());
        this.rs = this.stmt.executeQuery();
        while (this.rs.next()) {
            musicaG.add(new Musica(this.rs.getInt("id_cancion"), this.rs.getString("cancion"), this.rs.getFloat("duracion"), this.rs.getString("grupo"), this.rs.getString("album"), this.rs.getString("genero")));
        }
        return musicaG;
    }

    public List<Musica> ListadoMusicaAlbum(Musica musica) throws SQLException {
        List<Musica> musicaA = new ArrayList<>();
        this.stmt = this.conexion.prepareStatement(consultaAlbum);//Se hace la conexion con la bd por la variable conexion
        this.stmt.setString(1, musica.getAlbum());
        this.rs = this.stmt.executeQuery();
        while (this.rs.next()) {
            musicaA.add(new Musica(this.rs.getInt("id_cancion"), this.rs.getString("cancion"), this.rs.getFloat("duracion"), this.rs.getString("grupo"), this.rs.getString("album"), this.rs.getString("genero")));
        }
        return musicaA;
    }

    public List<Musica> ListadoMusicaGrupo(Musica musica) throws SQLException {
        List<Musica> musicaG = new ArrayList<>();
        this.stmt = this.conexion.prepareStatement(consultaGrupo);//Se hace la conexion con la bd por la variable conexion
        this.stmt.setString(1, musica.getGrupo());
        this.rs = this.stmt.executeQuery();
        while (this.rs.next()) {
            musicaG.add(new Musica(this.rs.getInt("id_cancion"), this.rs.getString("cancion"), this.rs.getFloat("duracion"), this.rs.getString("grupo"), this.rs.getString("album"), this.rs.getString("genero")));
        }
        return musicaG;
    }

    public void AgregaCancion(Musica cancion) throws SQLException {
        int id_genero = Integer.parseInt(cancion.getId_genero());
        this.stmt = this.conexion.prepareStatement(agregaCancion);
        this.stmt.setString(1, cancion.getCancion());
        this.stmt.setFloat(2, cancion.getDuracion());
        this.stmt.setString(3, cancion.getGrupo());
        this.stmt.setString(4, cancion.getAlbum());
        this.stmt.setInt(5, id_genero);
        this.stmt.executeUpdate();
    }

    public void editaCancion(Musica cancion) throws SQLException {
        int id_genero = Integer.parseInt(cancion.getId_genero());
        this.stmt = this.conexion.prepareStatement(editaCancion);
        this.stmt.setString(1, cancion.getCancion());
        this.stmt.setFloat(2, cancion.getDuracion());
        this.stmt.setString(3, cancion.getGrupo());
        this.stmt.setString(4, cancion.getAlbum());
        this.stmt.setInt(5, id_genero);
        this.stmt.setInt(6, cancion.getIdCancion());
        this.stmt.executeUpdate();
    }

    public int validaId(Musica cancion) throws SQLException {
        String numero = String.valueOf(cancion.getIdCancion());
        if (numero != null) {
            //int id = Integer.parseInt(numero);
            this.stmt = this.conexion.prepareStatement(consultaCancion);
            this.stmt.setInt(1, cancion.getIdCancion());
            this.rs = this.stmt.executeQuery();
        }
        return cancion.getIdCancion();
    }

    public void eliminarCancion(Musica cancion) throws SQLException {
        this.stmt = this.conexion.prepareStatement(eliminaCancion);
        this.stmt.setInt(1, cancion.getIdCancion());
        this.stmt.executeUpdate();
    }

    public void eliminarCancionv2(Musica cancion) throws SQLException {
        this.stmt = this.conexion.prepareStatement(eliminaCancionV2 + cancion.getIdCancion());
        this.stmt.executeUpdate();
    }

    public void eliminaMusica(Musica cancion) throws SQLException {
        int id_genero = Integer.parseInt(cancion.getId_genero());
        this.stmt = this.conexion.prepareStatement(eliminaCanciones);
        this.stmt.setInt(1, id_genero);
        this.stmt.executeUpdate();
    }
}
