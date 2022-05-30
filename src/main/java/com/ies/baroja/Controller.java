package com.ies.baroja;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.model.Barrios;
import com.model.Eventos;
import com.model.Grupo_vecinos;
import com.model.Ninos;
import com.model.Orfanatos;
import com.model.Vecinos;
import com.bbdd.ConexionBBDD;

/**
 * 
 * @author Jane & Cristina
 *
 */
public class Controller {

	// ------------------------------ LISTAS ------------------------------- //

	private static String sConsultaOrfanato = "SELECT cif, nombre, direccion, cod_barrio FROM orfanato;";

	/**
	 * Consulta de los orfanatos (LISTADO)
	 * @return
	 */
	public static LinkedList<Orfanatos> getOrfanatos() {
		/** OBJETO CON LA LISTA DE ORFANATOS */
		LinkedList<Orfanatos> listaOrfanato = new LinkedList<Orfanatos>();

		/** PRIMERO CONECTAMOS A LA BBDD */
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			miConexion.conectar();
			/** LANZAMOS LA CONSULTA */
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaOrfanato);
			if (rsResultado != null) {
				/** SI HAY RESULTADOS RECUPERAMOS LOS DATOS (como un FETCH de un CURSOR) */
				while (rsResultado.next()) {
					/** CREAMOS UN OBJETO ORFANATO POR CADA FILA DE LA TABLA (CADA ORFANATO) */
					Orfanatos orfanato = new Orfanatos(String.valueOf(rsResultado.getInt("cif")),
							rsResultado.getString("nombre"), rsResultado.getString("direccion"),
							String.valueOf(rsResultado.getInt("cod_barrio")));
					/** LO INSERTAMOS EN LA LISTA */
					listaOrfanato.add(orfanato);
				}
			} else {
				System.out.println("La consulta no devuelve resultados");
			}
			System.out.println("Número de orfanatos=" + listaOrfanato.size());
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaOrfanato;
	}

	private static String sConsultaNinos = "SELECT id, nombre, apellido, regalo, codigo_evento, orfanato_cif FROM ninos;";

	/**
	 * Consulta de los niños (LISTADO)
	 * @return
	 */
	public static LinkedList<Ninos> getNinos() {
		/** OBJETO CON LA LISTA DE NIÑOS */
		LinkedList<Ninos> listaNinyos = new LinkedList<Ninos>();

		/** PRIMERO CONECTAMOS A LA BBDD */
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			miConexion.conectar();
			/** LANZAMOS LA CONSULTA */
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaNinos);
			if (rsResultado != null) {
				/** SI HAY RESULTADOS RECUPERAMOS LOS DATOS (como un FETCH de un CURSOR) */
				while (rsResultado.next()) {
					/** CREAMOS UN OBJETO NIÑO POR CADA FILA DE LA TABLA (CADA NIÑO) */
					Ninos nino = new Ninos(rsResultado.getString("id"), 
							rsResultado.getString("nombre"),
							rsResultado.getString("apellido"), 
							rsResultado.getString("regalo"),
							String.valueOf(rsResultado.getInt("codigo_evento")),
							String.valueOf(rsResultado.getString("orfanato_cif")));
					/** LO INSERTAMOS EN LA LISTA */
					listaNinyos.add(nino);
				}
			} else {
				System.out.println("La consulta no devuelve resultados");
			}
			System.out.println("Número de jugadores=" + listaNinyos.size());
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaNinyos;
	}

	private static String sConsultaBarrios = "SELECT codigo, nombre, zona FROM barrio";

	/**
	 * Consulta de los barrios (LISTADO)
	 * @return
	 */
	public static LinkedList<Barrios> getBarrios() {
		/** OBJETO CON LA LISTA DE BARRIOS */
		LinkedList<Barrios> listaBarrios = new LinkedList<Barrios>();

		/** PRIMERO CONECTAMOS A LA BBDD */
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			miConexion.conectar();
			/** LANZAMOS LA CONSULTA */
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaBarrios);
			if (rsResultado != null) {
				/** SI HAY RESULTADOS RECUPERAMOS LOS DATOS (como un FETCH de un CURSOR) */
				while (rsResultado.next()) {
					/** CREAMOS UN OBJETO BARRIO POR CADA FILA DE LA TABLA (CADA BARRIO) */
					Barrios barrio = new Barrios(String.valueOf(rsResultado.getInt("codigo")),
							rsResultado.getString("nombre"), 
							rsResultado.getString("zona"));
					/** LO INSERTAMOS EN LA LISTA */
					listaBarrios.add(barrio);
				}
			} else {
				System.out.println("La consulta no devuelve resultados");
			}
			System.out.println("Número de jugadores=" + listaBarrios.size());
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaBarrios;
	}

	private static String sConsultaGrupos = "SELECT cod_grupo, nombre, cod_barrio FROM grupo_vecinos;";

	/**
	 * Consulta de los grupos de vecinos (LISTADO)
	 * @return
	 */
	public static LinkedList<Grupo_vecinos> getGrupo_vecinos() {
		/** OBJETO CON LA LISTA DE BARRIOS */
		LinkedList<Grupo_vecinos> listaGrupo_vecinos = new LinkedList<Grupo_vecinos>();

		/** PRIMERO CONECTAMOS A LA BBDD */
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			miConexion.conectar();
			/** LANZAMOS LA CONSULTA */
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaGrupos);
			if (rsResultado != null) {
				/** SI HAY RESULTADOS RECUPERAMOS LOS DATOS (como un FETCH de un CURSOR) */
				while (rsResultado.next()) {
					/**
					 * CREAMOS UN OBJETO GRUPO DE VECINOS POR CADA FILA DE LA TABLA (CADA GRUPO DE
					 * VECINOS)
					 */
					Grupo_vecinos grupo = new Grupo_vecinos(String.valueOf(rsResultado.getInt("cod_grupo")),
							rsResultado.getString("nombre"), 
							String.valueOf(rsResultado.getInt("cod_barrio")));
					/** LO INSERTAMOS EN LA LISTA */
					listaGrupo_vecinos.add(grupo);
				}
			} else {
				System.out.println("La consulta no devuelve resultados");
			}
			System.out.println("Número de jugadores=" + listaGrupo_vecinos.size());
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaGrupo_vecinos;
	}

	private static String sConsultaVecinos = "SELECT dni, nombre, apellido, rey_mago, cod_barrio, dni_vecino, grupo_vecino FROM vecinos;";

	/**
	 * Consulta de los vecinos (LISTADO)
	 * @return
	 */
	public static LinkedList<Vecinos> getVecinos() {
		/** OBJETO CON LA LISTA DE NIÑOS */
		LinkedList<Vecinos> listaVecinos = new LinkedList<Vecinos>();

		/** PRIMERO CONECTAMOS A LA BBDD */
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			miConexion.conectar();
			/** LANZAMOS LA CONSULTA */
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaVecinos);
			if (rsResultado != null) {
				/** SI HAY RESULTADOS RECUPERAMOS LOS DATOS (como un FETCH de un CURSOR) */
				while (rsResultado.next()) {
					/** CREAMOS UN OBJETO NIÑO POR CADA FILA DE LA TABLA (CADA NIÑO) */
					Vecinos vecino = new Vecinos(rsResultado.getString("DNI"), 
							rsResultado.getString("Nombre"),
							rsResultado.getString("Apellido"), 
							rsResultado.getString("Rey_mago"),
							String.valueOf(rsResultado.getString("cod_barrio")), 
							rsResultado.getString("dni_vecino"),
							String.valueOf(rsResultado.getString("grupo_vecino")));
					/** LO INSERTAMOS EN LA LISTA */
					listaVecinos.add(vecino);
				}
			} else {
				System.out.println("La consulta no devuelve resultados");
			}
			System.out.println("Número de Vecinos=" + listaVecinos.size());
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaVecinos;
	}

	private static String sConsultaEventos = "SELECT codigo_evento, ubicacion, fecha, hora, cod_grupo FROM eventos;";

	/**
	 * Consulta de los eventos (LISTADO)
	 * @return
	 */
	public static LinkedList<Eventos> getEventos() {
		/** OBJETO CON LA LISTA DE NIÑOS */
		LinkedList<Eventos> listaEventos = new LinkedList<Eventos>();

		/** PRIMERO CONECTAMOS A LA BBDD */
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			miConexion.conectar();
			/** LANZAMOS LA CONSULTA */
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaEventos);
			if (rsResultado != null) {
				/** SI HAY RESULTADOS RECUPERAMOS LOS DATOS (como un FETCH de un CURSOR) */
				while (rsResultado.next()) {
					/** CREAMOS UN OBJETO NIÑO POR CADA FILA DE LA TABLA (CADA NIÑO) */
					Eventos evento = new Eventos(String.valueOf(rsResultado.getInt("codigo_evento")),
							rsResultado.getString("ubicacion"), 
							String.valueOf(rsResultado.getDate("fecha")),
							String.valueOf(rsResultado.getTime("hora")),
							String.valueOf(rsResultado.getInt("cod_grupo")));
					/** LO INSERTAMOS EN LA LISTA */
					listaEventos.add(evento);
				}
			} else {
				System.out.println("La consulta no devuelve resultados");
			}
			System.out.println("Número de jugadores=" + listaEventos.size());
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaEventos;
	}
	
	// ------------------------------------- INSERTAR ------------------------------//

	/**
	 * INSERTAR ORFANATO EN LA BASE DE DATOS
	 * @param orfanato
	 * @return
	 */
	public static boolean insertarOrfanato(Orfanatos orfanato) {
		boolean bRes = true;
		/** CONECTAMOS A LA BBDD */
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			/** EJECUTAMOS EL MÉTODO INSERTAR VECINO */
			int iRes = miConexion.insertarOrfanato(orfanato);
			System.out.println("Resultado = " + iRes);

		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return bRes;
	}

	/**
	 * INSERTAR NIÑO EN LA BASE DE DATOS
	 * @param nino
	 * @return
	 */
	public static boolean insertarNino(Ninos nino) {
		boolean bRes = true;
		/** CONECTAMOS A LA BBDD */
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			/** EJECUTAMOS EL MÉTODO INSERTAR VECINO */
			int iRes = miConexion.insertarNinos(nino);
			System.out.println("Resultado = " + iRes);

		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return bRes;

	}

	/**
	 * INSERTAR BARRIO EN LA BASE DE DATOS
	 * @param nino
	 * @return
	 */
	public static boolean insertarBarrio(Barrios barrio) {
		boolean bRes = true;
		/** CONECTAMOS A LA BBDD */
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			/** EJECUTAMOS EL MÉTODO INSERTAR VECINO */
			int iRes = miConexion.insertarBarrio(barrio);
			System.out.println("Resultado = " + iRes);

		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return bRes;

	}

	/**
	 * INSERTAR GRUPO DE VECINOS EN LA BASE DE DATOS
	 * @param grupo
	 * @return
	 */
	public static boolean insertarGrupo(Grupo_vecinos grupo) {
		boolean bRes = true;
		/** CONECTAMOS A LA BBDD */
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			/** EJECUTAMOS EL MÉTODO INSERTAR VECINO */
			int iRes = miConexion.insertarGrupo(grupo);
			System.out.println("Resultado = " + iRes);

		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return bRes;

	}

	/**
	 * INSERTAR VECINO EN LA BASE DE DATOS
	 * @param vecino
	 * @return
	 */
	public static boolean insertarVecino(Vecinos vecino) {
		boolean bRes = true;
		/** CONECTAMOS A LA BBDD */
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			/** EJECUTAMOS EL MÉTODO INSERTAR VECINO */
			int iRes = miConexion.insertarVecinos(vecino);
			System.out.println("Resultado = " + iRes);

		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return bRes;

	}
	
	/**
	 * INSERTAR EVENTO EN LA BASE DE DATOS
	 * @param evento
	 * @return
	 */
	public static boolean insertarEvento(Eventos evento) {
		boolean bRes = true;
		/** CONECTAMOS A LA BBDD */
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			/** EJECUTAMOS EL MÉTODO INSERTAR EVENTO */
			int iRes = miConexion.insertarEventos(evento);
			System.out.println("Resultado = " + iRes);

		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return bRes;

	}

	 // ------------------------------ MÉTODOS BUSCAR ------------------------------- //
	
	/**
	 * BUSCAR ORFANATOS EN LA BASE DE DATOS
	 * @param sNombreOrfanato
	 * @return
	 */
	@SuppressWarnings("finally")
	public static Orfanatos getOrfanato(int sNombreOrfanato) {
		/** CONSULTA */
		String sConsultaBusq = "SELECT cif, nombre, direccion, cod_barrio FROM orfanato"
				+ " where cif = " + sNombreOrfanato + ";";

		Orfanatos orfanato = null;
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			/** CONECTAR A LA BBDD */
			miConexion.conectar();

			/** LANZAR CONSULTA */
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaBusq);

			if (rsResultado != null) {
				/** RECUPERAR LOS DATOS */
				while (rsResultado.next()) {
					/** CREAMOS UN OBJETO NIÑO POR CADA FILA DE LA TABLA, CADA NIÑO */
					orfanato = new Orfanatos(
							String.valueOf(rsResultado.getInt("cif")),
							rsResultado.getString("nombre"),
							rsResultado.getString("direccion"),
							String.valueOf(rsResultado.getInt("cod_barrio"))
							);
				}
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
			return orfanato;
		}
	}

	/**
	 * BUSCAR NIÑO EN LA BASE DE DATOS
	 * @param sNombreNino
	 * @return
	 */
	@SuppressWarnings("finally")
	public static Ninos getNino(String sNombreNino) {
		/** CONSULTA */
		String sConsultaBusq = "SELECT id, nombre, apellido, regalo, codigo_evento, orfanato_cif FROM ninos"
				+ " where nombre = '" + sNombreNino + "';";

		Ninos nino = null;
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			/** CONECTAR A LA BBDD */
			miConexion.conectar();

			/** LANZAR CONSULTA */
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaBusq);

			if (rsResultado != null) {
				/** RECUPERAR LOS DATOS */
				while (rsResultado.next()) {
					/** CREAMOS UN OBJETO NIÑO POR CADA FILA DE LA TABLA, CADA NIÑO */
					nino = new Ninos(
							rsResultado.getString("id"), 
							rsResultado.getString("nombre"),
							rsResultado.getString("apellido"), 
							rsResultado.getString("regalo"),
							String.valueOf(rsResultado.getInt("codigo_evento")),
							String.valueOf(rsResultado.getString("orfanato_cif")));
				}
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
			return nino;
		}
	}
	/**
	 * BUSCAR BARRIO EN LA BASE DE DATOS
	 * @param sNombreNino
	 * @return
	 */
	@SuppressWarnings("finally")
	public static Barrios getBarrio(String sNombreBarrio) {
		/** CONSULTA */
		String sConsultaBusq = "SELECT codigo, nombre, zona FROM barrio"
				+ " where nombre = '" + sNombreBarrio + "';";

		Barrios barrio = null;
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			/** CONECTAR A LA BBDD */
			miConexion.conectar();

			/** LANZAR CONSULTA */
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaBusq);

			if (rsResultado != null) {
				/** RECUPERAR LOS DATOS */
				while (rsResultado.next()) {
					/** CREAMOS UN OBJETO NIÑO POR CADA FILA DE LA TABLA, CADA NIÑO */
					barrio = new Barrios(
							String.valueOf(rsResultado.getString("codigo")),
							rsResultado.getString("nombre"),
							rsResultado.getString("zona"));
							
				}
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
			return barrio;
		}
	}
	
	/**
	 * BUSCAR GRUPO DE VECINOS EN LA BASE DE DATOS
	 * @param sNombreBarrio
	 * @return
	 */
	@SuppressWarnings("finally")
	public static Grupo_vecinos getGrupo(String sNombreGrupo) {
		/** CONSULTA */
		String sConsultaBusq = "SELECT cod_grupo, nombre, cod_barrio FROM grupo_vecinos"
				+ " where nombre = '" + sNombreGrupo + "';";

		Grupo_vecinos grupo = null;
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			/** CONECTAR A LA BBDD */
			miConexion.conectar();

			/** LANZAR CONSULTA */
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaBusq);

			if (rsResultado != null) {
				/** RECUPERAR LOS DATOS */
				while (rsResultado.next()) {
					/** CREAMOS UN OBJETO NIÑO POR CADA FILA DE LA TABLA, CADA NIÑO */
					grupo = new Grupo_vecinos(
							String.valueOf(rsResultado.getString("cod_grupo")),
							rsResultado.getString("nombre"),
							String.valueOf(rsResultado.getString("cod_barrio"))
							);
							
				}
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
			return grupo;
		}
	}

	/**
	 * BUSCAR VECINO EN LA BASE DE DATOS
	 * @param sNombreVecino
	 * @return
	 */
	@SuppressWarnings("finally")
	public static Vecinos getVecino(String sNombreVecino) {
		/** CONSULTA */
		String sConsultaBusq = "SELECT dni, nombre, apellido, rey_mago, cod_barrio, dni_vecino, grupo_vecino FROM vecinos"
				+ " where nombre = '" + sNombreVecino + "';";

		Vecinos vecino = null;
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			/** CONECTAR A LA BBDD */
			miConexion.conectar();

			/** LANZAR CONSULTA */
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaBusq);

			if (rsResultado != null) {
				/** RECUPERAR LOS DATOS */
				while (rsResultado.next()) {
					/** CREAMOS UN NUEVO VECINO POR CADA FILA DE LA TABLA, CADA VECINO */
					vecino = new Vecinos(
							rsResultado.getString("DNI"), 
							rsResultado.getString("Nombre"),
							rsResultado.getString("Apellido"), 
							rsResultado.getString("Rey_mago"),
							String.valueOf(rsResultado.getString("cod_barrio")), 
							rsResultado.getString("dni_vecino"),
							String.valueOf(rsResultado.getString("grupo_vecino")));
				}
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
			return vecino;
		}
	}
	
	/**
	 * BUSCAR EVENTOS EN LA BASE DE DATOS
	 * @param sNombreEvento
	 * @return
	 */
	@SuppressWarnings("finally")
	public static Eventos getEvento(String sNombreEvento) {
		/** CONSULTA */
		String sConsultaBusq = "SELECT codigo_evento, ubicacion, fecha, hora, cod_grupo FROM eventos"
				+ " where codigo_evento = " + sNombreEvento + ";";

		Eventos evento = null;
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			/** CONECTAR A LA BBDD */
			miConexion.conectar();

			/** LANZAR CONSULTA */
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaBusq);

			if (rsResultado != null) {
				/** RECUPERAR LOS DATOS */
				while (rsResultado.next()) {
					/** CREAMOS UN NUEVO VECINO POR CADA FILA DE LA TABLA, CADA VECINO */
					evento = new Eventos(
							String.valueOf(rsResultado.getString("codigo_evento")),
							rsResultado.getString("ubicacion"),
							String.valueOf(rsResultado.getString("fecha")),
							String.valueOf(rsResultado.getString("hora")),
							String.valueOf(rsResultado.getString("cod_grupo"))
							);
				}
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
			return evento;
		}
	}
	
	// ------------------------------------------------ BORRAR DATOS ------------------------------------------------------ //
	/**
	 * BORRAR ORFANATOS
	 * @param sBorrar
	 * @return
	 */
	@SuppressWarnings("finally")
	public static Orfanatos borrarOrfanato(String sBorrar) {
		/** CONSULTA */
		String sBorrarInt = "DELETE FROM orfanato"
				+ " where CIF = " + sBorrar + ";";

		Orfanatos orfanato = null;
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			/** CONECTAR A LA BBDD */
			miConexion.conectar();

			/** LANZAR CONSULTA */
			if (sBorrar != null) {
				int resultado = miConexion.ejecutarDelete(sBorrarInt);
				System.out.println("Se han eliminado " +resultado+ " orfanatos.");
			}

		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
			return orfanato;
		}
	}
	
	/**
	 * BORRAR NIÑO
	 * @param sBorrar
	 * @return
	 */
	@SuppressWarnings("finally")
	public static Ninos borrarNino(String sBorrar) {
		/** CONSULTA */
		String sBorrarInt = "DELETE FROM ninos"
				+ " where nombre = '" + sBorrar + "';";

		Ninos nino = null;
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			/** CONECTAR A LA BBDD */
			miConexion.conectar();

			/** LANZAR CONSULTA */
			if (sBorrar != null) {
				int resultado = miConexion.ejecutarDelete(sBorrarInt);
				System.out.println("Se han eliminado " +resultado+ " niños.");
			}

		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
			return nino;
		}
	}
	
	/**
	 * BORRAR BARRIOS
	 * @param sBorrar
	 * @return
	 */
	@SuppressWarnings("finally")
	public static Barrios borrarBarrio(String sBorrar) {
		/** CONSULTA */
		String sBorrarInt = "DELETE FROM barrio"
				+ " where nombre = '" + sBorrar + "';";

		Barrios barrio = null;
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			/** CONECTAR A LA BBDD */
			miConexion.conectar();

			/** LANZAR CONSULTA */
			if (sBorrar != null) {
				int resultado = miConexion.ejecutarDelete(sBorrarInt);
				System.out.println("Se han eliminado " +resultado+ " barrios.");
			}

		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
			return barrio;
		}
	}

	/**
	 * BORRAR GRUPO
	 * @param sBorrar
	 * @return
	 */
	@SuppressWarnings("finally")
	public static Grupo_vecinos borrarGrupo(String sBorrar) {
		/** CONSULTA */
		String sBorrarInt = "DELETE FROM grupo_vecinos"
				+ " where nombre = '" + sBorrar + "';";

		Grupo_vecinos grupo = null;
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			/** CONECTAR A LA BBDD */
			miConexion.conectar();

			/** LANZAR CONSULTA */
			if (sBorrar != null) {
				int resultado = miConexion.ejecutarDelete(sBorrarInt);
				System.out.println("Se han eliminado " +resultado+ " grupos.");
			}

		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
			return grupo;
		}
	}
	
	/**
	 * BORRAR VECINO
	 * @param sBorrar
	 * @return
	 */
	@SuppressWarnings("finally")
	public static Vecinos borrarVecino(String sBorrar) {
		/** CONSULTA */
		String sBorrarInt = "DELETE FROM vecinos"
				+ " where nombre = '" + sBorrar + "';";

		Vecinos vecino = null;
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			/** CONECTAR A LA BBDD */
			miConexion.conectar();

			/** LANZAR CONSULTA */
			if (sBorrar != null) {
				int resultado = miConexion.ejecutarDelete(sBorrarInt);
				System.out.println("Se han eliminado " +resultado+ " vecinos.");
			}

		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
			return vecino;
		}
	}
	
	/**
	 * BORRAR EVENTOS
	 * @param sBorrar
	 * @return
	 */
	@SuppressWarnings("finally")
	public static Eventos borrarEvento(String sBorrar) {
		/** CONSULTA */
		String sBorrarInt = "DELETE FROM eventos"
				+ " where codigo_evento = " + sBorrar + ";";

		Eventos evento = null;
		ConexionBBDD miConexion = new ConexionBBDD();

		try {
			/** CONECTAR A LA BBDD */
			miConexion.conectar();

			/** LANZAR CONSULTA */
			if (sBorrar != null) {
				int resultado = miConexion.ejecutarDelete(sBorrarInt);
				System.out.println("Se han eliminado " +resultado+ " vecinos.");
			}

		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
			return evento;
		}
	}
}