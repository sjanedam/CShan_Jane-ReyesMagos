package com.model;

/**
 * 
 * @author Jane & Cristina
 *
 */
public class Vecinos {
	private String dni;
	private String nombre;
	private String apellido;
	private String rey_mago;
	private String cod_barrio;
	private String dni_vecino;
	private String grupo_vecino;

	/**
	 * 
	 * @param dni
	 * @param nombre
	 * @param apellido
	 * @param rey_mago
	 * @param cod_barrio
	 * @param dni_vecino
	 * @param grupo_vecino
	 */

	public Vecinos(String dni, String nombre, String apellido, String rey_mago, String cod_barrio, String dni_vecino,
			String grupo_vecino) {
		super();
		this.dni = dni;
		this.nombre = nombre;
		this.apellido = apellido;
		this.rey_mago = rey_mago;
		this.cod_barrio = cod_barrio;
		this.dni_vecino = dni_vecino;
		this.grupo_vecino = grupo_vecino;
	}


	/**
	 * 
	 * @return
	 */
	public String getDni() {
		return dni;
	}
	/**
	 * 
	 * @param dni
	 */
	public void setDni(String dni) {
		this.dni = dni;
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
	public String getRey_mago() {
		return rey_mago;
	}
	/**
	 * 
	 * @param rey_mago
	 */
	public void setRey_mago(String rey_mago) {
		this.rey_mago = rey_mago;
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
	/**
	 * 
	 * @return
	 */
	public String getDni_vecino() {
		return dni_vecino;
	}
	/**
	 * 
	 * @param dni_vecino
	 */
	public void setDni_vecino(String dni_vecino) {
		this.dni_vecino = dni_vecino;
	}
	/**
	 * 
	 * @return
	 */
	public String getGrupo_vecino() {
		return grupo_vecino;
	}
	/**
	 * 
	 * @param grupo_vecino
	 */
	public void setGrupo_vecino(String grupo_vecino) {
		this.grupo_vecino = grupo_vecino;
	}

	/**
	 * 
	 */
	@Override
	public String toString() {
		StringBuffer sbResultado = new StringBuffer();
		sbResultado.append(dni);
		sbResultado.append(", ");
		sbResultado.append(nombre);
		sbResultado.append(", ");
		sbResultado.append(apellido);
		sbResultado.append(", ");
		sbResultado.append(rey_mago);
		sbResultado.append(", ");
		sbResultado.append(", ");
		sbResultado.append(cod_barrio);
		sbResultado.append(", ");
		sbResultado.append(dni_vecino);
		sbResultado.append(", ");
		sbResultado.append(grupo_vecino);
		sbResultado.append("; \n ");

		return sbResultado.toString();

	}

}