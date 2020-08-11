package formularios;
/*  * @author izelo  */
public class Musica {
    private int idCancion;
    private String cancion;
    private float duracion;
    private String grupo;
    private String album;
    private String id_genero;
    
    public Musica(){
    }
    
    public Musica(int idCancion, String cancion, float duracion, String grupo, String album, String id_genero) {
        this.idCancion = idCancion;
        this.cancion = cancion;
        this.duracion = duracion;
        this.grupo = grupo;
        this.album = album;
        this.id_genero = id_genero;
    }
    
    public int getIdCancion(){
        return idCancion;
    }
    
    public void setIdCancion(int idCancion){
        this.idCancion = idCancion;
    }

    public String getCancion() {
        return cancion;
    }

    public void setCancion(String cancion) {
        this.cancion = cancion;
    }

    public float getDuracion() {
        return duracion;
    }

    public void setDuracion(float duracion) {
        this.duracion = duracion;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public String getAlbum() {
        return album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    public String getId_genero() {
        return id_genero;
    }

    public void setId_genero(String id_genero) {
        this.id_genero = id_genero;
    }

    @Override
    public String toString() {
        return "Musica{" + "cancion=" + cancion + ", duracion=" + duracion + ", grupo=" + grupo + ", album=" + album + ", id_genero=" + id_genero + '}';
    }
}
