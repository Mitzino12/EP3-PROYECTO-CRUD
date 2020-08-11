<%-- 
    Document   : index
    Created on : 6 jul 2020, 0:37:15
    Author     : izelo
--%>
<%@page import="formularios.CatalogoDb"%>
<%@page import="formularios.Catalogo"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<Catalogo> catalogo = new CatalogoDb().ListadoCatalogo();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Cátalogo de música</title>
    </head>
    <body>
        <nav class="navbar navbar-fixed-top navbar-expand-lg navbar-dark bg-primary">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">
                <img src="img/musica.svg" width="35" height="35" class="d-inline-block align-top" alt="" loading="lazy">
                Musica
            </a>
            <div class="form-inline my-2 my-lg-0" id="navbarTogglerDemo01">
                <div class="navbar-nav">
                    <div class="d-flex justify-content-center">

                        <a class="nav-item nav-link active" href="index.jsp">INICIO <span class="sr-only">(current)</span></a>
                        <a class="nav-item nav-link" href="formGenero.jsp" role="button">Agregar un g&eacute;nero</a>
                        <a class="nav-item nav-link" href="repertorio.jsp" role="button">Repertorio</a><br></br>
                    </div>
                </div>
            </div> 
        </nav>
        <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/Music-Wallpapers-043.jpg" class="d-block w-100" alt="The Beatles">
                    <div class="carousel-caption d-none d-md-block">
                        <h1>¡Bienvenido!</h1>
                        <p>Se parte de nuestra comunidad</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/lwfQm84.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h1>¡Agrega g&eacute;neros!</h1>
                        <p>Adem&aacute;s de poder editar y eliminar</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/neon-music-wallpaper-preview.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h1>¡Agrega canciones!</h1>
                        <p>Adem&aacute;s de poder editar y eliminar</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <br></br>
        <div class="container">
            <h1> INTRODUCCI&Oacute;N</h1>
            <p style="font-size: 20px;color: black">
                ¿Qu&eacute; tanto sabes de m&uacute;sica?, ¿Sabes su duraci&oacute;n exacta?, ¿De que &aacute;lbum es? o lo mas importante,
                ¿Sabes identificar de que grupo o artista es?.
                Pues bien, te mostramos un c&aacute;talogo de las canciones registradas de acuerdo al g&eacute;nero, en ellas podras observar: 
            </p>
            <ol style="font-size: 20px;color: black">
                <li>El nombre de la canci&oacute;n</li>
                <li>Cuanto tiempo dura</li>
                <li>El grupo o artista que toca la canci&oacute;n</li>
                <li>El nombre del &aacute;lbum</li>
                <li>El g&eacute;nero</li>
            </ol>
            <%--<p style="font-size: 20px;color: purple">
                Adem&aacute;s de observar las canciones, podr&aacute;s agregar una canci&oacute;n de acuerdo al c&aacute;talogo que se mostr&oacute;, adem&aacute;s de editar
                el nombre de la canci&oacute;n o bien eliminarla. As&iacute; que, adelante da clic en "Ver toda la m&uacute;sica" y se parte de la comunidad...
            </p>--%> <br></br>
            <h1 align="center" style="font-size: 40px;color: black">Cat&aacute;logo de m&uacute;sica <br></br> </h1>
            <table class="table table-hover table-bordered table-hover table-condensed">
                <thead class="bg-primary">
                    <tr class="bg-primary">
                        <th class="text-center"><h2 style="color: white">Numeraci&oacute;n</h3></th>
                        <th class="text-center"><h2 style="color: white">G&eacute;nero</h3></th>
                    </tr>
                </thead>
                <%for (Catalogo catalogos : catalogo) {%>
                <tr class="table-light">
                    <td class="text-center table-dark"><h3 style="color: black"><%= catalogos.getIdGenero()%></h3></td>
                    <td class="text-center table-dark"> 
                        <div class="btn-group dropright">
                            <button type="button" class="btn btn-primary">
                                <%= catalogos.getGenero()%>
                            </button>
                            <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="sr-only">Toggle Dropright</span>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="cancionPorGenero.jsp?id=<%= catalogos.getIdGenero()%>&genero=<%= catalogos.getGenero()%>">Ver canciones</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="formEditaGe.jsp?id=<%= catalogos.getIdGenero()%>&g=<%= catalogos.getGenero()%>">Editar</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="formEliminaGe.jsp?id=<%= catalogos.getIdGenero()%>&g=<%= catalogos.getGenero()%>">Eliminar</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="eliminaGeV2.jsp?id=<%= catalogos.getIdGenero()%>">EliminarV2</a>
                            </div>
                        </div>
                        <%--<a class="btn btn-block btn-info active" href="cancionPorGenero.jsp?id=<%= catalogos.getIdGenero()%>&genero=<%= catalogos.getGenero()%>" role="button">Ver canciones</a>
                        <a class="btn btn-block btn-warning active" href="formEditaGe.jsp?id=<%= catalogos.getIdGenero()%>&g=<%= catalogos.getGenero()%>" role="button">Editar</a>
                        <a class="btn btn-block btn-danger active" href="formEliminaGe.jsp?id=<%= catalogos.getIdGenero()%>&g=<%= catalogos.getGenero()%>" role="button">Eliminar</a>
                        <a class="btn btn-block btn-danger active" href="eliminaGeV2.jsp?id=<%= catalogos.getIdGenero()%>" role="button">EliminarV2</a>--%>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
        <div class="card text-center bg-primary">
            <div class="card-header">  
            </div>
            <div class="card-body">
                <h3 class="card-title" style="color: white">Se parte de nuestra comunidad</h3>
                <p class="card-text" style="color: white">Agregando canciones</p>
                <p class="card-text" style="color: white">Agregando g&aacute;eneros</p>
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