package com.model;

/**
 * 
 * @author Jane & Cristina
 *
 */
public class Ninos {
	private String id;
	private String nombre;
	private String apellido;
	private String regalo;
	private String codigo_evento;
	private String orfanato_cif;
	/**
	 * 
	 * @param id
	 * @param nombre
	 * @param apellido
	 * @param regalo
	 * @param codigo_evento
	 * @param orfanato_cif
	 */
	public Ninos(String id, String nombre, String apellido, String regalo, String codigo_evento, String orfanato_cif) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellido = apellido;
		this.regalo = regalo;
		this.codigo_evento = codigo_evento;
		this.orfanato_cif = orfanato_cif;
	}
	/**
	 * 
	 * @return
	 */
	public String getId() {
		return id;
	}
	/**
	 * 
	 * @param id
	 */
	public void setId(String id) {
		this.id = id;
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
	public String getApellido() {
		return apellido;
	}
	/**
	 * 
	 * @param apellido
	 */
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	/**
	 * 
	 * @return
	 */
	public String getRegalo() {
		return regalo;
	}
	/**
	 * 
	 * @param regalo
	 */
	public void setRegalo(String regalo) {
		this.regalo = regalo;
	}
	/**
	 * 
	 * @return
	 */
	public String getCodigo_evento() {
		return codigo_evento;
	}
	/**
	 * 
	 * @param codigo_evento
	 */
	public void setCodigo_evento(String codigo_evento) {
		this.codigo_evento = codigo_evento;
	}
	/**
	 * 
	 * @return
	 */
	public String getOrfanato_cif() {
		return orfanato_cif;
	}
	/**
	 * 
	 * @param orfanato_cif
	 */
	public void setOrfanato_cif(String orfanato_cif) {
		this.orfanato_cif = orfanato_cif;
	}
	
	/**
	 * 
	 */
	@Override
	public String toString() {
		StringBuffer sbResultado = new StringBuffer();
		sbResultado.append(id);
		sbResultado.append(", ");
		sbResultado.append(nombre);
		sbResultado.append(", ");
		sbResultado.append(apellido);
		sbResultado.append(", ");
		sbResultado.append(regalo);
		sbResultado.append(", ");
		sbResultado.append(codigo_evento);
		sbResultado.append(", ");
		sbResultado.append(orfanato_cif);
		sbResultado.append(", ");


		return sbResultado.toString();

	}
}
