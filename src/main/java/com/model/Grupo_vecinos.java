package com.model;

/**
 * 
 * @author Jane & Cristina
 *
 */
public class Grupo_vecinos {
	private String cod_grupo;
	private String nombre;
	private String cod_barrio;
	
	/**
	 * 
	 * @param cod_grupo
	 * @param nombre
	 * @param cod_barrio
	 */
	public Grupo_vecinos(String cod_grupo, String nombre, String cod_barrio) {
		super();
		this.cod_grupo = cod_grupo;
		this.nombre = nombre;
		this.cod_barrio = cod_barrio;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getCod_grupo() {
		return cod_grupo;
	}
	/**
	 * 
	 * @param cod_grupo
	 */
	public void setCod_grupo(String cod_grupo) {
		this.cod_grupo = cod_grupo;
	}
	/**
	 * 
	 * @return
	 */
	public String getNombre() {
		return nombre;
	}
	/**
	 * 
	 * @param nombre
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	/**
	 * 
	 * @return
	 */
	public String getCod_barrio() {
		return cod_barrio;
	}
	/**
	 * 
	 * @param cod_barrio
	 */
	public void setCod_barrio(String cod_barrio) {
		this.cod_barrio = cod_barrio;
	}
}
