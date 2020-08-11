<%-- 
    Document   : formEditCancion
    Created on : 20 jul 2020, 14:59:33
    Author     : izelo
--%>
<%@page import="formularios.CatalogoDb"%>
<%@page import="java.util.List"%>
<%@page import="formularios.Catalogo"%>
<%@page import="formularios.Musica"%>
<%@page import="formularios.MusicaDb"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Musica cancion = new Musica();
    cancion.setIdCancion(id);
    MusicaDb musica = new MusicaDb();
    musica.validaId(cancion);
    List<Catalogo> catalogo = new CatalogoDb().ListadoCatalogo();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Edita canción</title>
    </head>
    <body>
        <nav class="navbar navbar-fixed-top navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="index.jsp">
                <img src="img/musica.svg" width="35" height="35" class="d-inline-block align-top" alt="" loading="lazy">
                Musica
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="form-inline my-2 my-lg-0" id="navbarTogglerDemo03">
                <div class="navbar-nav">
                    <a class="nav-item nav-link" href="index.jsp">INICIO <span class="sr-only">(current)</span></a>
                    <a class="nav-item nav-link" href="repertorio.jsp" role="button">Repertorio</a>
                    <a class="nav-item nav-link active" href="#" role="button">Editando canci&oacute;n</a>
                </div>
            </div>
        </nav>
        <br></br>
        <div class="container">
            <h1 style="font-size: 50px;color: purple">Actualiza la canci&oacute;n "<%= request.getParameter("cancion")%>"</h1><br></br>
            <form  action="editaCancion.jsp" method="POST">
                <div class="form-group">
                    <input type="hidden" name="id_cancion" value="<%=id%>"/>
                </div>
                <div class="form-group">
                    <label style="font-size: 20px;color: black">Canci&oacute;n </label><br></br>
                    <input type="text" class="form-control" name="cancion" value="<%= request.getParameter("cancion")%>" required/>
                </div >
                <div class="form-group">
                    <label style="font-size: 20px;color: black">Duraci&oacute;n</label><br></br>
                    <input type="number" min="2"  max="30" step="0.01" maxlength="255" size="100" class="form-control" name="duracion" value="<%= request.getParameter("duracion")%>" required/>
                </div >
                <div class="form-group">
                    <label style="font-size: 20px;color: black">Grupo</label><br></br>
                    <input type="text" class="form-control" name="grupo" value="<%= request.getParameter("grupo")%>" required/>
                </div >
                <div class="form-group">
                    <label style="font-size: 20px;color: black">&Aacute;lbum</label><br></br>
                    <input type="text" class="form-control" name="album" value="<%= request.getParameter("album")%>" required/>
                </div >
                <div class="form-group">
                    <label style="font-size: 20px;color: black">G&eacute;nero</label><br></br>
                    <input type="text" class="form-control" placeholder="<%= request.getParameter("genero")%>"/><br></br>
                    <label style="font-size: 20px;color: black">Selecione un g&eacute;nero</label><br></br>
                    <select name="id_genero" required>
                        <% for (Catalogo c : catalogo) {%>
                        <option value="<%= c.getIdGenero()%>"><%= c.getGenero()%></option>   
                        <%}%>
                    </select> 
                </div >
                <input type="submit" class="btn btn-primary active" value="Actualizar"/>
                <a class="btn btn-danger active" href="repertorio.jsp" role="button">Cancelar</a>
            </form>
        </div>
        <br></br>
        <div class="card text-center bg-primary">
            <div class="card-header">  
            </div>
            <div class="card-body">
                <h5 class="card-title" style="color: white">Se parte de nuestra comunidad</h5>
                <p class="card-text" style="color: white">Agregando canciones </p>
                <p class="card-text" style="color: white">Agregando g&aacute;eneros </p>
                <a href="repertorio.jsp" class="btn btn-light active">Ver todas las canciones</a>
            </div>
            <div class="card-footer text-muted bg-primary">
                <p style="color: white"> Mitzino music xD </p>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </body>
</html>
