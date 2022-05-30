package com.model;

/**
 * @author Jane  & Cristina
 *
 */
public class Eventos {
	private String codigo_evento;
	private String ubicacion;
	private String fecha;
	private String hora;
	private String cod_grupo;

	/**
	 * Constructor de Eventos
	 * @param codigo_evento
	 * @param ubicacion
	 * @param fecha
	 * @param hora
	 * @param cod_grupo
	 */
	public Eventos(String codigo_evento, String ubicacion, String fecha, String hora, String cod_grupo) {
		super();
		this.codigo_evento = codigo_evento;
		this.ubicacion = ubicacion;
		this.fecha = fecha;
		this.hora = hora;
		this.cod_grupo = cod_grupo;
	}

	/**
	 * @return
	 */
	public String getCodigo_evento() {
		return codigo_evento;
	}

	/**
	 * @param codigo_evento
	 */
	public void setCodigo_evento(String codigo_evento) {
		this.codigo_evento = codigo_evento;
	}

	/**
	 * 
	 * @return
	 */
	public String getUbicacion() {
		return ubicacion;
	}

	/**
	 * 
	 * @param ubicacion
	 */
	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}

	/**
	 * 
	 * @return
	 */
	public String getFecha() {
		return fecha;
	}

	/**
	 * 
	 * @param fecha
	 */
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	/**
	 * 
	 * @return
	 */
	public String getHora() {
		return hora;
	}

	/**
	 * 
	 * @param hora
	 */
	public void setHora(String hora) {
		this.hora = hora;
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
}