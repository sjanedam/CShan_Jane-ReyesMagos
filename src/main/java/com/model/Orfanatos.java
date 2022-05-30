package com.model;

/**
 * 
 * @author Jane & Cristina
 *
 */
public class Orfanatos {
	private String cif;
	private String nombre;
	private String direccion;
	private String cod_barrio;
	
	/**
	 * 
	 * @param cif
	 * @param nombre
	 * @param direccion
	 * @param cod_barrio
	 */
	public Orfanatos(String cif, String nombre, String direccion, String cod_barrio) {
		super();
		this.cif = cif;
		this.nombre = nombre;
		this.direccion = direccion;
		this.cod_barrio = cod_barrio;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getCif() {
		return cif;
	}
	/**
	 * 
	 * @param cif
	 */
	public void setCif(String cif) {
		this.cif = cif;
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
	public String getDireccion() {
		return direccion;
	}
	/**
	 * 
	 * @param direccion
	 */
	public void setDireccion(String direccion) {
		this.direccion = direccion;
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
