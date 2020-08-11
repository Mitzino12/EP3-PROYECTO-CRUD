package formularios;
/* @author izelo */
public class Catalogo {
    private int idGenero;
    private String Genero;

    public Catalogo() {
    }

    public Catalogo(int idGenero, String Genero) {
        this.idGenero = idGenero;
        this.Genero = Genero;
    }

    public int getIdGenero() {
        return idGenero;
    }

    public void setIdGenero(int idGenero) {
        this.idGenero = idGenero;
    }

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
    }

    @Override
    public String toString() {
        return "Catalogo{" + "idGenero=" + idGenero + ", Genero=" + Genero + '}';
    }
}