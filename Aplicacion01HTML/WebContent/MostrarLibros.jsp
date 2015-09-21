<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.arquitecturajava.aplicacion.DataBaseHelper"%>
<%@page import="com.arquitecturajava.aplicacion.DataBaseException"%>
<%@page import="com.arquitecturajava.aplicacion.Libro"%>
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
	<form name="filtroCategoria" action="filtrar.do">
		<select name="categoria">
			<option value="seleccionar">seleccionar</option>
			<c:forEach var="categoria" items="${listaDeCategorias}">
			<option value="${categoria}">${categoria}</option>
			</c:forEach>
		</select><input type="submit" value="filtrar">
	</form>	
	<c:forEach var="libro" items="${listaDeLibros}">
		${libro.isbn} ${libro.titulo} ${libro.categoria}
		<a href="BorrarLibro.do?isbn=${libro.isbn}">borrar</a>
		<a href="FormularioEditarLibro.do?isbn=${libro.isbn}">editar</a>
		<br />
	</c:forEach>
	<a href="FormularioInsertarLibro.do">InsertarLibro</a>
</body>
</html>