<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="com.arquitecturajava.DataBaseHelper"%>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<head>
<link rel="stylesheet" type="text/css" href="css/formato.css" />
<script type="text/javascript" src="js/validacion.js" ></script>
<title>Formulario Libro</title>
</head>
<body>
<form action="InsertarLibro.jsp" onsubmit="return validacion();" >
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
	<option value="seleccionar">seleccionar</option>
	<%
	ResultSet rs=null;
	try {
	String consultaSQL = "select distinct(categoria) from Libros";
	DataBaseHelper helper = new DataBaseHelper();
	rs=helper.seleccionarRegistros(consultaSQL);
	while(rs.next()) { %>
	<option value="<%=rs.getString("categoria")%>">
	<%=rs.getString("categoria")%></option>
	<%
	}
	}
	catch (SQLException e) {
		System.out.println("Error accediendo a la base de datos"	+ e.getMessage());
	} finally {
		if (rs != null) {
			try {
			rs.close();
			} catch (SQLException e) {
				System.out.println("Error cerrando el resultset"	+ e.getMessage());
			}
		}
	}
	%>
</select>
<br/>
</p>
<p>
<input type="submit" value="Insertar" />
</p>
</fieldset></form>
</body>
</html>