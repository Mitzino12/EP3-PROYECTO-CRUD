<%-- 
    Document   : index
    Created on : 6 jul 2020, 0:37:15
    Author     : izelo
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Music crud</title>
    </head>
    <body>
        <h1>Crud M&uacute;sica</h1>
        <br></br>
        <h2>Cat&aacute;logo de m&uacute;sica</h2>
        <p></p>
    </body>
</html>
<%
    Connection conexion = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/musica", "root", "");
        stmt = conexion.createStatement();
        rs = stmt.executeQuery("SELECT musica.cancion, musica.duracion, musica.grupo, musica.album, catalogo_genero.genero FROM musica, catalogo_genero WHERE musica.id_genero=catalogo_genero.id_genero");
    } catch (Exception e) {
        out.println("Error: " + e);
    }
%>
<table class="table table-striped">
    <caption> Tabla de m&uacute;sica registrada</caption>
    <tr>
        <th class="text-center">Canci&oacute;n</th>
        <th class="text-center">Duraci&oacute;n</th>
        <th class="text-center">Grupo</th>
        <th class="text-center">&Aacute;lbum</th>
        <th class="text-center">G&eacute;nero</th>
    </tr>
    <%while (rs.next()){%>
    <tr>
        <td class="text-center"><%out.println(rs.getString("cancion"));%></td>
        <td class="text-center"><%out.println(rs.getString("duracion"));%></td>
        <td class="text-center"><%out.println(rs.getString("grupo"));%></td>
        <td class="text-center"><%out.println(rs.getString("album"));%></td>
        <td class="text-center"><%out.println(rs.getString("genero"));%></td>
    </tr>
    <%}%>
</table>
    <br></br>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/musica", "root", "");
        stmt = conexion.createStatement();
        rs = stmt.executeQuery("SELECT * FROM `catalogo_genero`");
    } catch (Exception e) {
        out.println("Error: " + e);
    }
%>
<h2>Cat&aacute;logo de g&eacute;nero de m&uacute;sica</h2>
<table class="table table-hover">
    <caption> Tabla de catalogo</caption>
    <tr>
        <th class="text-center">ID</th>
        <th class="text-center">G&eacute;nero</th>
    </tr>
    <%while (rs.next()){%>
    <tr>
        <td class="text-center"><%out.println(rs.getInt("id_genero"));%></td>
        <td class="text-center"><%out.println(rs.getString("genero"));%></td>
    </tr>
    <%}%>
</table>