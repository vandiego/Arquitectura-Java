<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="com.arquitecturajava.aplicacion.DataBaseHelper"%>
<%@page import="com.arquitecturajava.aplicacion.Libro"%>
<%@page import="java.util.List"%>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<head>
<link rel="stylesheet" type="text/css" href="css/formato.css" />
<script type="text/javascript" src="js/validacion.js" ></script>
<title>Formulario Libro</title>
</head>
<body>
<form action="InsertarLibro.do" onsubmit="return validacion();" >
<fieldset>
<legend>Formulario alta libro</legend>
<p><label for="isbn">ISBN:</label>
<input id="isbn" type="text" name="isbn"/></p>
<p>
<label for="titulo">Titulo:</label>
<input id="titulo" type="text" name= "titulo"/>
</p><p>
<label for="categoria">Categoria:</label>
<select name="categoria">
	<%  List<String> listaDeCategorias=null;
		listaDeCategorias=Libro.buscarTodasLasCategorias();
		for(String categoria:listaDeCategorias) { %>
	<option value="<%=categoria%>"><%=categoria%></option>
		<% } %>	
	</select>
<br/>
</p>
<p>
<input type="submit" value="Insertar" />
</p>
</fieldset></form>
</body>
</html>