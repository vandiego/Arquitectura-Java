<%@ page import="java.util.List" %>
<%@page import="com.arquitecturajava.Libro"%>
<%Libro libro= Libro.buscarPorClave(request.getParameter("isbn"));%>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
	<head>
		<link rel="stylesheet" type="text/css" href="css/formato.css" />
		<script type="text/javascript" src="js/validacion.js" ></script>
		<title>Formulario Libro</title>
	</head>
	<body>
		<form id="formularioEdicion" action="SalvarLibro.jsp">
		<fieldset>
		<legend>Formulario editar libro</legend>
		<p><label for="isbn">ISBN:</label>
		<input type="text" id="isbn" name="isbn" value="<%=libro.getIsbn()%>"/></p>
		<p><label for="titulo">Titulo:</label>
		<input type="text" id="titulo" name="titulo" value="<%=libro.getTitulo() %>" /></p>
		<p><label for="categoria">Categoria :</label>
		<select name="categoria">
		<%
		List<String> listaDeCategorias=null;
		listaDeCategorias=Libro.buscarTodasLasCategorias();
		for(String categoria:listaDeCategorias) {
		if (libro.getCategoria().equals(categoria)) { %>
		<option value="<%=categoria%>" selected="selected">
		<%=categoria%></option>
		<%}else{ %>
		<option value="<%=categoria%>"><%=categoria%></option>
		<% }
		} %>
		</select>
		<br/>
		</p>
		<p><input type="submit" value="Salvar" /></p>
		</fieldset>
		</form>
	</body>
</html>