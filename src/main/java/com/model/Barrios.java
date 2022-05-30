package com.model;

/**
 * @author Jane & Cristina
 */
public class Barrios {
	private String codigo;
	private String nombre;
	private String zona;

	/**
	 * Contructor de barrios
	 * @param codigo (del barrio)
	 * @param nombre (del barrio)
	 * @param zona (del barrio)
	 */
	public Barrios(String codigo, String nombre, String zona) {
		super();
		this.codigo = codigo;
		this.nombre = nombre;
		this.zona = zona;
	}
	
	/**
	 * @return
	 */
	public String getCodigo() {
		return codigo;
	}

	/**
	 * @param codigo
	 */
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	/**
	 * @return
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * @param nombre
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * @return
	 */
	public String getZona() {
		return zona;
	}

	/**
	 * 
	 * @param zona
	 */
	public void setZona(String zona) {
		this.zona = zona;
	}
}
