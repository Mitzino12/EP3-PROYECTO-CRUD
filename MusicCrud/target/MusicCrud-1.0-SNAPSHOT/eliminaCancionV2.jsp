<%-- 
    Document   : eliminaCancionV2
    Created on : 7 jul 2020, 23:19:22
    Author     : izelo
--%>

<%@page import="formularios.Musica"%>
<%@page import="formularios.MusicaDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elimina cancion</title>
    </head>
    <body>
        <%
            int id_cancion = Integer.parseInt(request.getParameter("id"));
            Musica cancion = new Musica();
            cancion.setIdCancion(id_cancion);
            MusicaDb musica = new MusicaDb();
            musica.eliminarCancionv2(cancion);
            response.sendRedirect("repertorio.jsp");
        %>
    </body>
</html>
