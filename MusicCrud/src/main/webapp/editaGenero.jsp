<%-- 
    Document   : editaGenero
    Created on : 27 jul 2020, 12:11:07
    Author     : izelo
--%>
<%@page import="formularios.Catalogo"%>
<%@page import="formularios.CatalogoDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int idGenero = Integer.parseInt(request.getParameter("id_genero"));
    Catalogo catalogo = new Catalogo();
    catalogo.setIdGenero(idGenero);
    catalogo.setGenero(request.getParameter("genero"));
    CatalogoDb edita = new CatalogoDb();
    edita.editaCancion(catalogo);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Género editado</title>
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
                    <a class="nav-item nav-link " href="index.jsp">INICIO <span class="sr-only">(current)</span></a>
                    <a class="nav-item nav-link" href="repertorio.jsp" role="button">Repertorio</a>
                    <a class="nav-item nav-link active" href="#" role="button">G&eacute;nero actualizado</a>
                </div>
            </div>
        </nav>
        <br></br>
        <div class="container">
            <h1 style="text-align:center;color: blue;font-size: 50px" >G&eacute;nero actualizado con &eacute;xito</h1>
            <br></br>
            <h1 style="text-align:center;color: bluw;font-size: 30px" >Gracias por corregir el g&eacute;nero</h1>
            <br></br>
            <a class="btn btn-block btn-primary active" href="index.jsp" role="button">Volver al inicio</a>
        </div>
        <br></br> <br></br> <br></br> <br></br>
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