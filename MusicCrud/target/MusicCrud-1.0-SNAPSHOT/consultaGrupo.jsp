<%-- 
    Document   : consultaGrupo
    Created on : 21 jul 2020, 16:36:19
    Author     : izelo
--%>

<%@page import="formularios.MusicaDb"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="formularios.Musica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Musica cancion = new Musica();
    String grupo = request.getParameter("grupo");
    cancion.setGrupo(request.getParameter("grupo"));
    List<Musica> musica = new MusicaDb().ListadoMusicaGrupo(cancion);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
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
                    <a class="nav-item nav-link" href="formuAgregaCancion.jsp" role="button">Agregar canci&oacute;n</a>
                    <a class="nav-item nav-link" href="repertorio.jsp" role="button">Repertorio</a>
                    <a class="nav-item nav-link active" href="#" role="button">Consulta por grupo</a>
                </div>
            </div>
        </nav>
        <br></br>
        <div class="container">
            <table class="table table-hover table-bordered table-hover table-condensed">
                <h1 class="text-primary" style="font-size: 45px">Tabla de m&uacute;sica registrada por grupo o artista:  "<%= grupo%>"</h1>
                <br></br>
                <thead class="bg-primary">
                    <tr class="bg-primary" style="color: white">
                        <th class="text-center"><h3>Canci&oacute;n</h3></th>
                        <th class="text-center"><h3>Duraci&oacute;n</h3></th>
                        <th class="text-center"><h3>&Aacute;lbum</h3></th>
                        <th class="text-center"><h3>Opciones</h3></th>
                    </tr>
                </thead>
                <% for (Musica canciones : musica) {%>
                <tbody>
                    <tr class="table-light">
                        <td class="text-center"><%= canciones.getCancion()%></td>
                        <td class="text-center"><%= canciones.getDuracion()%></td>
                        <td class="text-center"><%= canciones.getAlbum()%></td>
                        <td>
                            <a class="btn btn-block btn-warning active" href="formEditCancion.jsp?id=<%= canciones.getIdCancion()%>&cancion=<%= canciones.getCancion()%>
                               &duracion=<%= canciones.getDuracion()%>&grupo=<%= canciones.getGrupo()%>&album=<%= canciones.getAlbum()%>&genero=<%= canciones.getId_genero()%>" role="button">Editar</a>
                            <a class="btn btn-block btn-danger active" href="formEliminaCancion.jsp?id=<%= canciones.getIdCancion()%>&cancion=<%= canciones.getCancion()%>" role="button">Eliminar</a>
                            <a class="btn btn-block btn-danger active" href="eliminaCancionV2.jsp?id=<%= canciones.getIdCancion()%>" role="button">EliminarV2</a>
                        </td>
                    </tr>
                </tbody>
                <%}%>
            </table>
        </div><br></br>
        <br></br>
        <br></br>
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