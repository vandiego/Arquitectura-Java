<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.arquitecturajava.DataBaseHelper"%>
<%@page import="com.arquitecturajava.Libro"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Libros</title>
</head>
<body>
	<select name="categoria">
	<%  List<String> listaDeCategorias=null;
		listaDeCategorias=Libro.buscarTodasLasCategorias();
		for(String categoria:listaDeCategorias) { %>
	<option value="<%=categoria%>"><%=categoria%></option>
		<% } %>	
	</select>
	<br/>	
		<%List<Libro> listaDeLibros=null;
		listaDeLibros=Libro.buscarTodos();
		for(Libro libro:listaDeLibros){ %>
			<%=libro.getIsbn()%> <%=libro.getTitulo()%> <%=libro.getCategoria()%>
	<br/>
		<% } %>
	<a href="FormularioInsertarLibro.jsp">Insertar Libro</a>
</body>
</html>