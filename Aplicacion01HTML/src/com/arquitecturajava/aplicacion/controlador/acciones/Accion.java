package com.arquitecturajava.aplicacion.controlador.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Accion {
	public abstract String ejecutar(HttpServletRequest request, HttpServletResponse response);
	/*
	public static Accion getAccion(String tipo) {
		Accion accion = null;
		if (tipo.equals("/MostrarLibros.do")) {
			accion = new MostrarLibroAccion();
		} else if (tipo.equals("/FormularioInsertarLibro.do")) {
			accion = new FormularioInsertarLibroAccion();
		} else if (tipo.equals("/InsertarLibro.do")){
			accion = new InsertarLibroAccion();
		}else if (tipo.equals("/FormularioEditarLibro.do")){
			accion = new FormularioEditarLibroAccion();
		}else if (tipo.equals("/SalvarLibro.do")){
			accion = new ModificarLibroAccion();
		}else if (tipo.equals("/BorrarLibro.do")) {
			accion = new BorrarLibroAccion();
		}else {//Filtrar Libros Por Categoria
			accion = new FiltrarLibrosPorCategoriaAccion();
		}		
		return accion;
	}
	*/
	public static Accion getAccion(String tipo) {
		Accion accion = null;
		try {
			accion = (Accion) Class.forName(Accion.class.getPackage().getName()+"."+tipo+"Accion").newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return accion;
	}
}