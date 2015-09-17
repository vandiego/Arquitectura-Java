<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.arquitecturajava.DataBaseHelper"%>
<%@page import="com.arquitecturajava.DataBaseException"%>
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
	<form id="formularioFiltrar" action="MostrarLibros.jsp">
		<select name="categoria">
		<option value="seleccionar">seleccionar</option>
		<%  try {
				List<String> listaDeCategorias=null;
				listaDeCategorias=Libro.buscarTodasLasCategorias();
				for(String categoria:listaDeCategorias) { %>
		<option value="<%=categoria%>"><%=categoria%></option>
		<%}%>
		</select>		
		<%}catch(DataBaseException e) {
		out.println("</select>"+e.getMessage()+"");
		}%>
		<input type="submit" value="Filtrar" />		   	
   	</form>	
	<br/>	
		<%
		try{
		List<Libro> listaDeLibros=null;
		if (request.getParameter("categoria")==null || request.getParameter("categoria").equals("seleccionar")) {
			listaDeLibros=Libro.buscarTodos();
		}
		else {
		 	listaDeLibros=Libro.buscarPorCategoria(request.getParameter("categoria"));
		}
		for(Libro libro:listaDeLibros){ %>
			<%=libro.getIsbn()%> <%=libro.getTitulo()%> <%=libro.getCategoria()%> 
			<a href="BorrarLibro.jsp?isbn=<%=libro.getIsbn()%>">Borrar</a>
			<a href="FormularioEditarLibro.jsp?isbn=<%=libro.getIsbn()%>">Editar</a>
	<br/>
		<% }
		}catch(DataBaseException e){
			out.println(e.getMessage()+": ");
			out.println(e.getCause().getMessage());
		}
		%>
	<a href="FormularioInsertarLibro.jsp">Insertar Libro</a>
</body>
</html>