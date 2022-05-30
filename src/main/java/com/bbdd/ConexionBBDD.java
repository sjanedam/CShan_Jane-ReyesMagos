package com.bbdd;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

import com.model.Barrios;
import com.model.Eventos;
import com.model.Grupo_vecinos;
import com.model.Ninos;
import com.model.Orfanatos;
import com.model.Vecinos;

/**
 * Clase que centraliza los métodos de acceso a BBDD
 * 
 * @author JAGD
 * @since 27/05/2021
 */
public class ConexionBBDD {

	Connection conexion; 
	int port = 3306;
	String host= "localhost";
	String db  = "proyecto";
	String user="root";
	String password="";

	String url = String.format("jdbc:mysql://%s:%d/%s?useSSL=false", host, port, db);

	/**
	 * Conectar a la BBDD
	 * @throws SQLException
	 */
	public void conectar() throws SQLException {
		conexion =  DriverManager.getConnection(url, user, password);
	}	
	 

	/**
	 * Desconectar de la BBDD
	 */
	public void desconectar() {
		try {
			conexion.close();
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
		}
	}
	
	/**
	 * EJECUTAR CONSULTA
	 * @param sentencia
	 * @return
	 */
	public ResultSet ejecutarConsulta(String sentencia) {
		ResultSet rsResultado = null;
		try {
			System.out.println("Ejecutando: " + sentencia);
			PreparedStatement prepStatement = conexion.prepareStatement(sentencia);
			rsResultado = prepStatement.executeQuery();
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
		}
		return rsResultado;
	}
	
	/**
	 * EJECUTAR DELETE
	 * @param sentencia
	 * @return
	 */
	public int ejecutarDelete (String sentencia) {
		int rsResultado = 0;
		try {
			System.out.println("Ejecutando: " + sentencia);
			PreparedStatement prepStatement = conexion.prepareStatement(sentencia);
			rsResultado = prepStatement.executeUpdate();
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
		}
		return rsResultado;
	}
	
	/**
	 * INSERTAR NUEVA INFORMACIÓN DENTRO DE LA TABLA DE ORFANATOS
	 * @param orfanato
	 * @return
	 */
	public int insertarOrfanato(Orfanatos orfanato) {
		int iRes = 0;
		
		/** CONSULTA */
		String sInsert = "Insert into orfanato (cif, nombre, direccion, cod_barrio) "
				+ "values (?, ?, ?, ?) ";
		try {
			System.out.println("Ejecutando "+sInsert);
			System.out.println("Datos"+orfanato);
			
			/** PARA INSERTAR DATOS */
			PreparedStatement ps = conexion.prepareStatement(sInsert);
			
			/** SUSTITUIMOS LAS '?' POR LOS DATOS */
			ps.setInt(1, Integer.parseInt(orfanato.getCif()));
			ps.setString(2, orfanato.getNombre());
			ps.setString(3, orfanato.getDireccion());
			ps.setInt(4, Integer.parseInt(orfanato.getCod_barrio()));
			
			iRes = ps.executeUpdate();
			
		} catch (SQLException sqlex) {
			System.out.println("Error: "+sqlex.getMessage());
			sqlex.printStackTrace();
		}
		return iRes;
	}
	
	/**
	 * INSERTAR NUEVA INFORMACIÓN DENTRO DE LA TABLA DE NIÑOS
	 * @param nino
	 * @return
	 */
	public int insertarNinos(Ninos nino) {
		int iRes = 0;
		
		/** CONSULTA */
		String sInsert = "Insert into ninos (id, nombre, apellido, regalo, codigo_evento, orfanato_cif) "
				+ "values (?, ?, ?, ?, ?, ?) ";
		try {
			System.out.println("Ejecutando "+sInsert);
			System.out.println("Datos"+nino);
			
			/** PARA INSERTAR DATOS */
			PreparedStatement ps = conexion.prepareStatement(sInsert);
			
			/** SUSTITUIMOS LAS '?' POR LOS DATOS */
			ps.setString(1, nino.getId());
			ps.setString(2, nino.getNombre());
			ps.setString(3, nino.getApellido());
			ps.setString(4, nino.getRegalo());
			ps.setInt(5, Integer.parseInt(nino.getCodigo_evento()));
			ps.setInt(6, Integer.parseInt(nino.getOrfanato_cif()));
			
			iRes = ps.executeUpdate();
			
		} catch (SQLException sqlex) {
			System.out.println("Error: "+sqlex.getMessage());
			sqlex.printStackTrace();
		}
		return iRes;
	}
	
	/**
	 * INSERTAR NUEVA INFORMACIÓN DENTRO DE LA TABLA DE BARRIOS
	 * @param barrio
	 * @return
	 */
	public int insertarBarrio(Barrios barrio) {
		int iRes = 0;
		
		/** CONSULTA */
		String sInsert = "Insert into barrio (codigo, nombre, zona) "
				+ "values (?, ?, ?) ";
		try {
			System.out.println("Ejecutando "+sInsert);
			System.out.println("Datos"+barrio);
			
			/** PARA INSERTAR DATOS */
			PreparedStatement ps = conexion.prepareStatement(sInsert);
			
			/** SUSTITUIMOS LAS '?' POR LOS DATOS */
			ps.setInt(1, Integer.parseInt(barrio.getCodigo()));
			ps.setString(2, barrio.getNombre());
			ps.setObject(3, barrio.getZona());

			iRes = ps.executeUpdate();
			
		} catch (SQLException sqlex) {
			System.out.println("Error: "+sqlex.getMessage());
			sqlex.printStackTrace();
		}
		return iRes;
	}
	
	/**
	 * INSERTAR NUEVA INFORMACIÓN DENTRO DE LA TABLA DE GRUPO DE VECINOS
	 * @param grupo
	 * @return
	 */
	public int insertarGrupo(Grupo_vecinos grupo) {
		int iRes = 0;
		
		/** CONSULTA */
		String sInsert = "Insert into grupo_vecinos (cod_grupo, nombre, cod_barrio) "
				+ "values (?, ?, ?) ";
		try {
			System.out.println("Ejecutando "+sInsert);
			System.out.println("Datos"+grupo);
			
			/** PARA INSERTAR DATOS */
			PreparedStatement ps = conexion.prepareStatement(sInsert);
			
			/** SUSTITUIMOS LAS '?' POR LOS DATOS */
			ps.setInt(1, Integer.parseInt(grupo.getCod_grupo()));
			ps.setString(2, grupo.getNombre());
			ps.setInt(3, Integer.parseInt(grupo.getCod_barrio()));

			iRes = ps.executeUpdate();
			
		} catch (SQLException sqlex) {
			System.out.println("Error: "+sqlex.getMessage());
			sqlex.printStackTrace();
		}
		return iRes;
	}
	
	/**
	 * INSERTAR NUEVA INFORMACIÓN DENTRO DE LA TABLA DE VECINOS
	 * @param vecino
	 * @return
	 */
	public int insertarVecinos(Vecinos vecino) {
		int iRes=0;
		
		/** CONSULTA */
		String sInsert ="insert into vecinos (dni, nombre, apellido,rey_mago,cod_barrio,dni_vecino,grupo_vecino ) "
				+ "values (?, ?, ?, ?, ?, ?, ?)";
		try {
		System.out.println("Ejecutando: " + sInsert);
		System.out.println("datos: " + vecino);
		
		/** PARA INSERTAR DATOS */
		PreparedStatement prepStatement = conexion.prepareStatement(sInsert);
		
		/** SUSTITUIMOS LAS '?' POR LOS DATOS */
		prepStatement.setString(1, vecino.getDni());
		prepStatement.setString(2,vecino.getNombre());
		prepStatement.setString(3,vecino.getApellido());
		prepStatement.setString(4, vecino.getRey_mago() );
		prepStatement.setInt(5, Integer.parseInt(vecino.getCod_barrio()));
		prepStatement.setString(6, vecino.getDni_vecino());
		prepStatement.setInt(7,Integer.parseInt(vecino.getGrupo_vecino()));
		
		iRes = prepStatement.executeUpdate();
		
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		}
		return iRes;
	}
	
	/**
	 * INSERTAR NUEVA INFORMACIÓN DENTRO DE LA TABLA DE EVENTOS
	 * @param evento
	 * @return
	 */
	public int insertarEventos(Eventos evento) {
		int iRes=0;
		
		/** CONSULTA */
		String sInsert ="insert into eventos (codigo_evento, ubicacion, fecha, hora, cod_grupo ) "
				+ "values (?, ?, ?, ?, ?)";
		try {
		System.out.println("Ejecutando: " + sInsert);
		System.out.println("datos: " + evento);
		
		/** PARA INSERTAR DATOS */
		PreparedStatement prepStatement = conexion.prepareStatement(sInsert);
		
		/** SUSTITUIMOS LAS '?' POR LOS DATOS */
		prepStatement.setInt(1, Integer.parseInt(evento.getCodigo_evento()));
		prepStatement.setString(2, evento.getUbicacion());
		prepStatement.setDate(3, Date.valueOf(evento.getFecha()));
		prepStatement.setTime(4, Time.valueOf(evento.getHora()));
		prepStatement.setInt(5, Integer.parseInt(evento.getCod_grupo()));
		
		iRes = prepStatement.executeUpdate();
		
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		}
		return iRes;
	}

}
