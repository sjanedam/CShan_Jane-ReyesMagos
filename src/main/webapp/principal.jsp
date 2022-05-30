<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es" dir="ltr">
<head>
<meta charset="utf-8">
<title>Página principal</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/principal.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<!-- CABECERA -->
	<div class="container">
		<div class="d-flex justify-content-between">
			<div class="p-2">
				<div class="container">
					<!-- ROL -->
					<div class="p-3 p-md-4 rounded-3 icon-demo-examples">
						<div class="fs-2 mb-3">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-person-circle"
								viewBox="0 0 16 16">
							<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
							<path fill-rule="evenodd"
									d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
						</svg>
							&nbsp;¡Bienvenido/a a la base de datos de Reyes Magos,
							${sessionScope.usuario}!
							<p style="font-size: 20px !important;">Usuario</p>
							<% HttpSession misesion = request.getSession();
							String usuario = (String)misesion.getAttribute("usuario");
							%>
						</div>
					</div>
				</div>
			</div>
			<div class="p-2">
				<div class="container p-3 p-md-4">
				
					<!-- BUTTON HOME -->
					<button type="btn btn-primary" style="border-radius: 50px;">
						<a href="index.html" style="padding: 10px;">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="black" class="bi bi-house-fill" viewBox="0 0 16 16">
	    						<path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
	    						<path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
	    					</svg>
						</a>
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- INFORMACION -->
	<div class="contenido">
		<h3>Bienvenido a Wonder Eventoland</h3>
		<!-- TABLAS -->
		<!-- NIÑOS  -->
		<div class="card-group border border-primary rounded">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="imagenes/niños.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Conoce a los niños</h5>
					<p>Conoce los gustos de los niños y personaliza tu regalo.</p>
					<button type="button" class="btn btn-primary">
						<a href="listadoN.jsp" style="color: white !important; text-decoration: none !important;">¡Entra aquí!</a>
					</button>
				</div>
			</div>
			<!-- VECINOS ------------------------------------------------------------------------------------------------------->
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="imagenes/vecinos.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Conoce a los vecinos</h5>
					<p>Conoce a los vecinos que se encargan de los eventos.</p>
					<button type="button" class="btn btn-primary">
						<a href="listado.jsp" style="color: white !important; text-decoration: none !important;">¡Entra aquí!</a>
					</button>
				</div>
			</div>
			<!-- EVENTOS -------------------------------------------------------------------------------------------------------->
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="imagenes/evento.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Planificación de eventos</h5>
					<p>¿Quieres participar en la planificación de los nuevos
						eventos?</p>
					<button type="button" class="btn btn-primary">
						<a href="listadoE.jsp" style="color: white !important; text-decoration: none !important;">¡Entra aquí!</a>
					</button>
				</div>
			</div>
		</div>
		<br>
	<div class="card-group border border-primary rounded">
	<!-- ORFANATO ------------------------------------------------------------------------------------------------------------>
		<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="imagenes/orphanage.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Información del orfanato</h5>
					<p>Para saber más información acerca del orfanato. </p>
					<button type="button" class="btn btn-primary">
						<a href="ListaOrfanato.jsp" style="color: white !important; text-decoration: none !important;">¡Entra aquí!</a>
					</button>
				</div>
			</div>
		<!-- GRUPO DE VECINOS --------------------------------------------------------------------------------------------------->
		<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="imagenes/grupo.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Conoce a los grupos de vecinos</h5>
					<p>Conoce a los grupos de vecinos que se encargan de los eventos.</p>
					<button type="button" class="btn btn-primary">
						<a href="ListaGrupo.jsp" style="color: white !important; text-decoration: none !important;">¡Entra aquí!</a>
					</button>
				</div>
			</div>
			<!-- BARRIOS ------------------------------------------------------------------------------------------------------->	
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="imagenes/barrio.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Barrios afiliados</h5>
					<p>Conoce los barrios en donde suelen estar los grupos de vecinos.</p>
					<button type="button" class="btn btn-primary">
						<a href="ListadoBarrio.jsp" style="color: white !important; text-decoration: none !important;">¡Entra aquí!</a>
					</button>
				</div>
			</div>
	</div>
	
	
</body>

</html>