package com.arquitecturajava;

import java.util.List;

public class Libro {
	private String isbn;
	private String titulo;
	private String categoria;
	
	public Libro(){	
		
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public Libro(String isbn, String titulo, String categoria) {
		this.isbn = isbn;
		this.titulo = titulo;
		this.categoria = categoria;
	}

	public void insertar() {
		String consultaSQL = "insert into Libros (isbn,titulo,categoria) values ";
		consultaSQL += "('" + this.isbn + "','" + this.titulo + "','" + this.categoria + "')";
		DataBaseHelper<Object> helper = new DataBaseHelper<Object>();
		helper.modificarRegistro(consultaSQL);
	}	
	
	public static List<Libro> buscarTodos() {
		String consultaSQL = "select isbn,titulo,categoria from Libros";
		DataBaseHelper<Libro> helper = new DataBaseHelper<Libro>();
		List<Libro> listaDeLibros = helper.seleccionarRegistros(consultaSQL,Libro.class);
		return listaDeLibros;
	}
	
	public static List<String> buscarTodasLasCategorias() {
		String consultaSQL = "select distinct(categoria) as categoria from Libros";
		DataBaseHelper<String> helper = new DataBaseHelper<String>();
		List<String>listaDeCategorias = helper.seleccionarRegistros(consultaSQL,String.class);
		return listaDeCategorias;
	}
}
