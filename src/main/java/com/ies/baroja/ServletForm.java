package com.ies.baroja;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Barrios;
import com.model.Eventos;
import com.model.Grupo_vecinos;
import com.model.Ninos;
import com.model.Orfanatos;
import com.model.Vecinos;

/**
 * Servlet implementation class ServletForm
 * @author Jane & Cristina
 *
 */
@WebServlet("/ServletForm")
public class ServletForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			
			/** INICIO DE SESIÓN */
			if (request.getParameter("usuario") != null) {
				loginUsuario(request, response);
				
				/** BUSCAR */
			} else if (request.getParameter("buscarOrfanato") != null) {
				buscarOrfanato(request, response);
			} else if (request.getParameter("buscarNino") != null) {
				buscarNino(request, response);
			} else if (request.getParameter("buscarBarrio") != null) {
				buscarBarrio(request, response);
			} else if (request.getParameter("buscarGrupoVecino") != null) {
				buscarGrupo(request, response);
			} else if (request.getParameter("buscarVecino") != null) {
				buscarVecino(request, response);
			} else if (request.getParameter("buscarEvento") != null) {
				buscarEvento(request, response);
			
				
				/** INSERTAR */
			} else if (request.getParameter("nombreOrfanato") != null) {
				insertarOrfanato(request, response);
			} else if (request.getParameter("nombreNino") != null) {
				insertarNino(request, response);
			} else if (request.getParameter("nombreBarrio") != null) {
				insertarBarrio(request, response);
			} else if (request.getParameter("nombreGrupo") != null) {
				insertarGrupo(request, response);
			} else if (request.getParameter("nombreVecino") != null) {
				insertarVecino(request, response);
			} else if (request.getParameter("cod_eventoEvento") != null) {
				insertarEvento(request, response);
				
				/** BORRAR */
			} else if (request.getParameter("borrarOrfanato") != null) {
				borrarOrfanato(request, response);
			} else if (request.getParameter("borrarNino") != null) {
				borrarNino(request, response);
			} else if (request.getParameter("borrarBarrio") != null) {
				borrarBarrio(request, response);
			} else if (request.getParameter("borrarGrupo") != null) {
				borrarGrupo(request, response);
			} else if (request.getParameter("borrarVecino") != null) {
				borrarVecino(request, response);
			} else if (request.getParameter("borrarEvento") != null) {
				borrarEvento(request, response);
				
				/** ERROR */
			} else {
				System.out.println("Error, opción no válida");
			}
			
		} catch (Exception ex) {
			System.out.println("Error en servlet");
			ex.printStackTrace();
			mostrarError(response, "Error en servlet");
		}
	}
	
	/**
	 * INICIO DE SESIÓN
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void loginUsuario (HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession sesion = request.getSession();
		String sUsuario = request.getParameter("usuario");
		String sContra = request.getParameter("contrasena");
		//
		sesion.setAttribute("usuario", null);
		if (sUsuario.equalsIgnoreCase("Lola") && sContra.equals("lola") && sesion.getAttribute("usuario")== null) {
			sesion.setAttribute("usuario", sUsuario);
			response.sendRedirect("listadoAdmin.jsp");
		} else if (sUsuario.equalsIgnoreCase("LauraGon") && sContra.equals("Glau") && sesion.getAttribute("usuario") == null) {
			sesion.setAttribute("usuario", sUsuario);
			response.sendRedirect("principal.jsp");
		} else {
			mostrarError(response, "[401-403] Error en el login del  usuario. "+sUsuario+" no está autorizado a entrar a la base de datos.");
		}
	}
	
	/**
	 * BUSCADOR DE ORFANATOS POR CIF
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void buscarOrfanato(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/** RECOGEMOS LOS DATOS DE LA PÁGINA */
		String Nombre = request.getParameter("buscarOrfanato");
		
		int sNombre = Integer.parseInt(Nombre);
		
		/** BUSCAMOS EL ORFANATO EN LA BBDD */
		Orfanatos orfanato = Controller.getOrfanato(sNombre);
		
		/** DEVOLVEMOS RESULTADO A LA PÁGINA */
		if (orfanato != null) {
			HttpSession sesion = request.getSession();
			sesion.setAttribute("orfanato", orfanato);
			response.sendRedirect("buscadorOrfanato.jsp");
		} else {
			mostrarError(response, "[404] El orfanato con CIF "+ sNombre +" que está buscando no se encuentra en nuestra base de datos.");
		}
	}
	
	/**
	 * BUSCADOR DE NIÑOS POR NOMBRE
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void buscarNino(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/** RECOGEMOS LOS DATOS DE LA PÁGINA */
		String sNombre = request.getParameter("buscarNino");
		
		/** BUSCAMOS NIÑO EN LA BBDD */
		Ninos nino = Controller.getNino(sNombre);
		
		/** DEVOLVEMOS RESULTADO A LA PÁGINA */
		if (nino != null) {
			HttpSession sesion = request.getSession();
			sesion.setAttribute("nino", nino);
			response.sendRedirect("buscadorNino.jsp");
		} else {
			mostrarError(response, "[404] El niño con nombre "+ sNombre+" que está buscando no se encuentra en nuestra base de datos.");
		}
	}
	
	/**
	 * BUSCAR BARRIO POR NOMBRE
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void buscarBarrio(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/** RECOGEMOS LOS DATOS DE LA PÁGINA */
		String sNombre = request.getParameter("buscarBarrio");
		
		/** BUSCAMOS NIÑO EN LA BBDD */
		Barrios barrio = Controller.getBarrio(sNombre);
		
		/** DEVOLVEMOS RESULTADO A LA PÁGINA */
		if (barrio != null) {
			HttpSession sesion = request.getSession();
			sesion.setAttribute("barrio", barrio);
			response.sendRedirect("buscadorBarrio.jsp");
		} else {
			mostrarError(response, "[404] El barrio con nombre "+ sNombre+" que está buscando no se encuentra en nuestra base de datos.");
		}
	}
	
	/**
	 * BUSCAR GRUPO DE VECINOS POR NOMBRE
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void buscarGrupo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/** RECOGEMOS LOS DATOS DE LA PÁGINA */
		String sNombre = request.getParameter("buscarGrupoVecino");
		
		/** BUSCAMOS NIÑO EN LA BBDD */
		Grupo_vecinos grupo = Controller.getGrupo(sNombre);
		
		/** DEVOLVEMOS RESULTADO A LA PÁGINA */
		if (grupo != null) {
			HttpSession sesion = request.getSession();
			sesion.setAttribute("grupo", grupo);
			response.sendRedirect("buscadorGrupo.jsp");
		} else {
			mostrarError(response, "[404] El grupo de vecinos con nombre "+ sNombre+" que está buscando no se encuentra en nuestra base de datos.");
		}
	}
	
	/**
	 * BUSCADOR DE VECINOS POR NOMBRE
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void buscarVecino(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/** RECOGEMOS LOS DATOS DE LA PÁGINA */
		String sNombre = request.getParameter("buscarVecino");
		
		/** BUSCAMOS NIÑO EN LA BBDD */
		Vecinos vecino = Controller.getVecino(sNombre);
		
		/** DEVOLVEMOS RESULTADO A LA PÁGINA */
		if (vecino != null) {
			HttpSession sesion = request.getSession();
			sesion.setAttribute("vecino", vecino);
			response.sendRedirect("buscadorVecino.jsp");
		} else {
			mostrarError(response, "[404] El vecino con nombre "+ sNombre+" que está buscando no se encuentra en nuestra base de datos.");
		}
	}
	
	/**
	 * BUSCADOR DE EVENTOS POR CODIGO
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void buscarEvento(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/** RECOGEMOS LOS DATOS DE LA PÁGINA */
		String sNombre = request.getParameter("buscarEvento");
		
		/** BUSCAMOS NIÑO EN LA BBDD */
		Eventos evento = Controller.getEvento(sNombre);
		
		/** DEVOLVEMOS RESULTADO A LA PÁGINA */
		if (evento != null) {
			HttpSession sesion = request.getSession();
			sesion.setAttribute("evento", evento);
			response.sendRedirect("buscadorEvento.jsp");
		} else {
			mostrarError(response, "[404] El evento con código " +sNombre+" que está buscando no se encuentra en nuestra base de datos.");
		}
	}
	
	// ------------------------------------------------------------------  INSERTAR  ---------------------------------------------------------------------------- //
	
	/**
	 * INSERTAR INFORMACIÓN DE ORFANATO
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void insertarOrfanato(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/** RECOGEMOS LOS DATOS */
		Orfanatos orfanato = new Orfanatos(
				request.getParameter("cifOrfanato"),
				request.getParameter("nombreOrfanato"),
				request.getParameter("direccionOrfanato"),
				request.getParameter("cod_barrioOrfanato")
				);
		
		/** INSERTAR ORFANATO EN LA BASE DE DATOS */
		boolean bRes = Controller.insertarOrfanato(orfanato);
		
		/** MOSTRAR RESULTADO POR PANTALLA */
		if (bRes) {
			response.sendRedirect("exito.html");
		} else {
			mostrarError(response, "[400] Error al insertar datos del orfanato.");
		}
	}
	
	/**
	 * INSERTAR INFORMACIÓN DE NINO
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void insertarNino(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/** RECOGEMOS LOS DATOS */
		
		Ninos nino = new Ninos(request.getParameter("idNino"),
				request.getParameter("nombreNino"),
				request.getParameter("apellidoNino"),
				request.getParameter("regaloNino"),
				request.getParameter("codigo_eventoNino"),
				request.getParameter("orfanato_cifNino")
				);
		
		/** INSERTAR NINO EN LA BASE DE DATOS */
		boolean bRes = Controller.insertarNino(nino);
		
		/** MOSTRAR RESULTADO POR PANTALLA */
		if (bRes) {
			response.sendRedirect("exito.html");
		} else {
			mostrarError(response, "[400] Error al insertar datos del niño.");
		}
	}
	
	/**
	 * INSERTAR INFORMACIÓN DE BARRIO
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void insertarBarrio(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/** RECOGEMOS LOS DATOS */
		
		Barrios barrio = new Barrios (
				request.getParameter("codigoBarrio"),
				request.getParameter("nombreBarrio"),
				request.getParameter("zonaBarrio")
				);
		
		/** INSERTAR BARRIO EN LA BASE DE DATOS */
		boolean bRes = Controller.insertarBarrio(barrio);
		
		/** MOSTRAR RESULTADO POR PANTALLA */
		if (bRes) {
			response.sendRedirect("exito.html");
		} else {
			mostrarError(response, "[400] Error al insertar datos del barrio.");
		}
	}
	
	/**
	 * INSERTAR INFORMACIÓN DE GRUPO DE VECINOS
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void insertarGrupo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/** RECOGEMOS LOS DATOS */
		
		Grupo_vecinos grupo = new Grupo_vecinos (
				request.getParameter("codigoGrupo"),
				request.getParameter("nombreGrupo"),
				request.getParameter("cod_barrioGrupo")
				);
		
		/** INSERTAR GRUPO DE VECINOS EN LA BASE DE DATOS */
		boolean bRes = Controller.insertarGrupo(grupo);
		
		/** MOSTRAR RESULTADO POR PANTALLA */
		if (bRes) {
			response.sendRedirect("exito.html");
		} else {
			mostrarError(response, "[400] Error al insertar datos del grupo de vecinos.");
		}
	}
	
	/**
	 * INSERTAR INFORMACIÓN DE VECINOS
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void insertarVecino(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/** RECOGEMOS LOS DATOS */
		
		Vecinos vecino = new Vecinos (
				request.getParameter("DNI_vecino"),
				request.getParameter("nombreVecino"),
				request.getParameter("apellidoVecino"),
				request.getParameter("reyMagoVecino"),
				request.getParameter("cod_barrioVecino"),
				request.getParameter("dni_vecinoCaptador"),
				request.getParameter("grupo_vecinoVecino")
				);
		
		/** INSERTAR VECINO EN LA BASE DE DATOS */
		boolean bRes = Controller.insertarVecino(vecino);
		
		/** MOSTRAR RESULTADO POR PANTALLA */
		if (bRes) {
			response.sendRedirect("exito.html");
		} else {
			mostrarError(response, "[400] Error al insertar datos del vecino.");
		}
	}
	
	/**
	 * INSERTAR INFORMACIÓN DE EVENTOS
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void insertarEvento(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/** RECOGEMOS LOS DATOS */
		
		Eventos evento = new Eventos (
			request.getParameter("cod_eventoEvento"),
			request.getParameter("ubicaciónEvento"),
			request.getParameter("fechaEventos"),
			request.getParameter("horaEventos"),
			request.getParameter("cod_grupoEventos")
				);
		
		/** INSERTAR EVENTO EN LA BASE DE DATOS */
		boolean bRes = Controller.insertarEvento(evento);
		
		/** MOSTRAR RESULTADO POR PANTALLA */
		if (bRes) {
			response.sendRedirect("exito.html");
		} else {
			mostrarError(response, "[400] Error al insertar datos del evento");
		}
	}
	
	/**
	 * BORRAR ORFANATO
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private static void borrarOrfanato (HttpServletRequest request, HttpServletResponse response) throws IOException {
		/** RECOGEMOS LOS DATOS DE LA PÁGINA */
		String sBorrar = request.getParameter("borrarOrfanato");
		
		/** BUSCAMOS NIÑO EN LA BBDD */
		Orfanatos orfanato = Controller.borrarOrfanato(sBorrar);
		
		/** DEVOLVEMOS RESULTADO A LA PÁGINA */
		if (orfanato == null) {
			response.sendRedirect("exito.html");
		} else {
			mostrarError(response, "[400] El orfanato con CIF " + sBorrar + " no se ha podido eliminar de nuestra base de datos.");
		}
	}
	
	/**
	 * BORRAR NIÑO
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private static void borrarNino (HttpServletRequest request, HttpServletResponse response) throws IOException {
		/** RECOGEMOS LOS DATOS DE LA PÁGINA */
		String sBorrar = request.getParameter("borrarNino");
		
		/** BUSCAMOS NIÑO EN LA BBDD */
		Ninos nino = Controller.borrarNino(sBorrar);
		
		/** DEVOLVEMOS RESULTADO A LA PÁGINA */
		if (nino == null) {
			response.sendRedirect("exito.html");
		} else {
			mostrarError(response, "[400] El niño con nombre " + sBorrar + " no se ha podido eliminar de nuestra base de datos.");
		}
	}
	
	/**
	 * BORRAR BARRIO
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private static void borrarBarrio (HttpServletRequest request, HttpServletResponse response) throws IOException {
		/** RECOGEMOS LOS DATOS DE LA PÁGINA */
		String sBorrar = request.getParameter("borrarBarrio");
		
		/** BUSCAMOS NIÑO EN LA BBDD */
		Barrios barrio = Controller.borrarBarrio(sBorrar);
		
		/** DEVOLVEMOS RESULTADO A LA PÁGINA */
		if (barrio == null) {
			response.sendRedirect("exito.html");
		} else {
			mostrarError(response, "[400] El niño con nombre " + sBorrar + " no se ha podido eliminar de nuestra base de datos.");
		}
	}
	
	/**
	 * BORRAR GRUPO
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private static void borrarGrupo (HttpServletRequest request, HttpServletResponse response) throws IOException {
		/** RECOGEMOS LOS DATOS DE LA PÁGINA */
		String sBorrar = request.getParameter("borrarGrupo");
		
		/** BUSCAMOS NIÑO EN LA BBDD */
		Grupo_vecinos grupo = Controller.borrarGrupo(sBorrar);
		
		/** DEVOLVEMOS RESULTADO A LA PÁGINA */
		if (grupo == null) {
			response.sendRedirect("exito.html");
		} else {
			mostrarError(response, "[400] El niño con nombre " + sBorrar + " no se ha podido eliminar de nuestra base de datos.");
		}
	}
	
	/**
	 * BORRAR VECINO
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private static void borrarVecino (HttpServletRequest request, HttpServletResponse response) throws IOException {
		/** RECOGEMOS LOS DATOS DE LA PÁGINA */
		String sBorrar = request.getParameter("borrarVecino");
		
		/** BUSCAMOS NIÑO EN LA BBDD */
		Vecinos vecino = Controller.borrarVecino(sBorrar);
		
		/** DEVOLVEMOS RESULTADO A LA PÁGINA */
		if (vecino == null) {
			response.sendRedirect("exito.html");
		} else {
			mostrarError(response, "[400] El niño con nombre " + sBorrar + " no se ha podido eliminar de nuestra base de datos.");
		}
	}
	
	/**
	 * BORRAR EVENTO
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private static void borrarEvento (HttpServletRequest request, HttpServletResponse response) throws IOException {
		/** RECOGEMOS LOS DATOS DE LA PÁGINA */
		String sBorrar = request.getParameter("borrarEvento");
		
		/** BUSCAMOS NIÑO EN LA BBDD */
		Eventos evento = Controller.borrarEvento(sBorrar);
		
		/** DEVOLVEMOS RESULTADO A LA PÁGINA */
		if (evento == null) {
			response.sendRedirect("exito.html");
		} else {
			mostrarError(response, "[400] El niño con nombre " + sBorrar + " no se ha podido eliminar de nuestra base de datos.");
		}
	}
	
	/**
	 * 
	 * @param response
	 * @param sMensaje
	 * @throws IOException
	 */
	public static void mostrarError(HttpServletResponse response, String sMensaje) throws IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<HTML lang=\"es\" dir=\"ltr\" >\n" 
		        + "<HEAD><TITLE>Éxito</TITLE>" 
				+ "  <meta charset=\"utf-8\">\r\n"
				+ "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n"
				+ "  <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n"
				+ "  <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\"></script>\r\n"
				+ "</HEAD>\n" 
				+ "<BODY>\n" 
				+ "</div>"
				+ "<div class=\"card\" style=\"margin-left:auto; margin-right:auto; margin-top:250px; padding:15px; width:550px; text-aling:center; border-style:groove; border-width:10px; border-color:#C50711\">"
				+ "<h1 class=\"text-danger\">¡Error interno!</h1>"
				+ "<h2 class=\"text-danger\">"
				+ sMensaje
				+ "</h2>"
				+ "<button type=\"btn\" class=\"btn btn-outline-danger\">Volver átras"
				+ "<a href=\"javascript: history.go(-1)\">"
				+ "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"30\" height=\"30\" fill=\"#C50711\" class=\"bi bi-arrow-clockwise\" viewBox=\"0 0 16 16\">\r\n"
				+ "  <path fill-rule=\"evenodd\" d=\"M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z\"/>\r\n"
				+ "  <path d=\"M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z\"/>\r\n"
				+ "</svg>"
				+ "</a>"
				+ "</button>"
				+ "</div>"
				+ "</BODY></HTML>");
		out.close();
		
	}
}
