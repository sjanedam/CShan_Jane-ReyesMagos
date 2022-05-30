<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.*" %>
<%@ page import="com.ies.baroja.Controller"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>Buscador</title>
</head>
<body>
	<div class="container p-3 d-flex justify-content-center">
		<!-- BOTÓM ATRÁS -->
		<a href="Javascript:history.go(-1)" class="btn btn-warning b1" style="margin-right: 10px;">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-left" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M14.5 1.5a.5.5 0 0 1 .5.5v4.8a2.5 2.5 0 0 1-2.5 2.5H2.707l3.347 3.346a.5.5 0 0 1-.708.708l-4.2-4.2a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 8.3H12.5A1.5 1.5 0 0 0 14 6.8V2a.5.5 0 0 1 .5-.5z"/>
			</svg>
		</a>
		<!-- BOTÓM HOME -->
		<a href="index.html" class="btn btn-warning b1" style="margin-left: 10px;">
	   		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
	   			<path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
	   			<path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
	   		</svg>
	    </a>
	</div>
			<%
				HttpSession misesion = request.getSession();
			Ninos nino = (Ninos) misesion.getAttribute("nino");
				
				// NINO //
			  if (nino != null){
				out.println("<div class='container mt-3'>");
					out.println("<h1 style='color: #215F78;'>Información del niño:</h1>");
					out.println("<table class='table'>");
						out.println("<thead style='color: #FFC023;'>");
							out.println("<tr>");
								out.println("<th scope='col'>ID</th>");
								out.println("<th scope='col'>Nombre</th>");
								out.println("<th scope='col'>Apellido</th>");
								out.println("<th scope='col'>Regalo</th>");
								out.println("<th scope='col'>Código evento</th>");
								out.println("<th scope='col'>Orfanato CIF</th>");
							out.println("</tr>");
						out.println("</thead>");
						
						out.println("<tbody>");
							out.println("<tr>");
								out.println("<td>" + nino.getId() + "</td>");
								out.println("<td style='font-weight: bold;'>" + nino.getNombre() + "</td>");
								out.println("<td style='font-weight: bold;'>" + nino.getApellido() + "</td>");
								out.println("<td>" + nino.getRegalo() + "</td>");
								out.println("<td>" + nino.getCodigo_evento() + "</td>");
								out.println("<td>" + nino.getOrfanato_cif() + "</td>");
							out.println("</tr>");
						out.println("</tbody>");
					out.println("</table>");
				out.println("</div>");
			  }
				
				%>

</body>
</html>