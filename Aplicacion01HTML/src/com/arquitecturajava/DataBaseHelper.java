package com.arquitecturajava;


import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DataBaseHelper <T> {
	
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost/arquitecturajava";
	private static final String USUARIO = "root";
	private static final String CLAVE = "123456";
	
	public int modificarRegistro(String consultaSQL) {
		Connection conexion = null;
		Statement sentencia = null;
		int filasAfectadas = 0;
		try {
			Class.forName(DRIVER);
			conexion = DriverManager.getConnection(URL,	USUARIO, CLAVE);
			sentencia = conexion.createStatement();
			filasAfectadas = sentencia.executeUpdate(consultaSQL);
		} catch (ClassNotFoundException e) {
			System.out.println("Error driver" + e.getMessage());
			throw new DataBaseException("Clase no encontrada");
		} catch (SQLException e) {
			System.out.println("Error de SQL" + e.getMessage());
			throw new DataBaseException("Error de SQL");
		} finally {
			if (sentencia != null) {
				try {sentencia.close();} catch (SQLException e) {}
			}
			if (conexion != null) {
				try {conexion.close();} catch (SQLException e) {}
			}
		}
		return filasAfectadas;
	}
	
	public List<T> seleccionarRegistros(String consultaSQL,Class<T> clase) {
		Connection conexion = null;
		Statement sentencia = null;
		ResultSet filas = null;
		List<T> listaDeObjetos=new ArrayList<T>();
		try {
			Class.forName(DRIVER);
			conexion = DriverManager.getConnection(URL, USUARIO, CLAVE);
			sentencia = conexion.createStatement();
			filas = sentencia.executeQuery(consultaSQL);
			while (filas.next()) {				
				T objeto=(T)Class.forName(clase.getName()).newInstance();				
				Method[] metodos=objeto.getClass().getDeclaredMethods();				
				for (int i=0;i<metodos.length;i++) {
					if (metodos[i].getName().startsWith("set") ) {
						metodos[i].invoke(objeto,filas.getString(metodos[i].getName().substring(3)));
					}
					if (objeto.getClass().getName().equals("java.lang.String")) {
						objeto=(T)filas.getString(1);
					}
				}
				listaDeObjetos.add(objeto);
			}
		} catch (ClassNotFoundException e) {
			System.out.println("SELECTION: no se ha podido cargar el driver "+ e.getMessage());
			throw new DataBaseException("Clase no encontrada",e);
		} catch (SQLException e) {
			System.out.println("SELECTION: no se ha podido acceder a la bd "+ e.getMessage());
			throw new DataBaseException("Error de SQL",e);
		} catch (IllegalArgumentException e) {
			System.out.println("REFLECTION: " + e.getMessage());
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			System.out.println("REFLECTION " + e.getMessage());
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			System.out.println("REFLECTION: no se ha podido invocar al método "+ e.getMessage());
			e.printStackTrace();
		} catch (InstantiationException e) {
			System.out.println("REFLECTION: no se ha podido instanciar la clase "+ e.getMessage());
			e.printStackTrace();
		}
		finally {
			if (sentencia != null) {
				try {sentencia.close();} catch (SQLException e) {}
			}
			if (conexion != null) {
				try {conexion.close();} catch (SQLException e) {}
			}
		}
		return listaDeObjetos;
		}
	
}
