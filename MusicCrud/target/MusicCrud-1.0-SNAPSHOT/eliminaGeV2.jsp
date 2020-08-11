<%-- 
    Document   : eliminaGeV2
    Created on : 27 jul 2020, 12:54:39
    Author     : izelo
--%>

<%@page import="formularios.Catalogo"%>
<%@page import="formularios.CatalogoDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>elimina genero</title>
    </head>
    <body>
        <%
            int idGenero = Integer.parseInt(request.getParameter("id"));
            Catalogo catalogo = new Catalogo();
            catalogo.setIdGenero(idGenero);
            CatalogoDb elimina = new CatalogoDb();
            elimina.eliminarGenerov2(catalogo);
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
