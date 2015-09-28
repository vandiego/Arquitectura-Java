package com.arquitecturajava.aplicacion.controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arquitecturajava.aplicacion.controlador.acciones.*;


public class ControladorLibros extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher despachador = null;	
		Accion accion = null;
		String url= request.getServletPath();
		accion= Accion.getAccion(url.substring(1,url.length()-3));
		despachador = request.getRequestDispatcher(accion.ejecutar(request,response));
		despachador.forward(request, response);
	}
}