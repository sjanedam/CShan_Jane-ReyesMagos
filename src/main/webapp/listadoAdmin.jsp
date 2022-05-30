<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.*"%>
<%@ page import="com.ies.baroja.Controller"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="es" dir="ltr">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/listadoAdmin.css" rel="stylesheet">
	<title>Wonder EventoLand</title>
</head>
<body>
	<!--  JavaScript: jQuery, Popper.js, Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<!-- CABECERA -->
	<div class="container">
		<div class="d-flex justify-content-between">
			<div class="p-2">
				<div class="container">
					<!-- ROL -->
					<div class="p-3 rounded-3 icon-demo-examples">
        				<div class="fs-2 mb-3">
        				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
							<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
        				&nbsp;¡Bienvenido/a a la base de datos de Reyes Magos, ${sessionScope.usuario}!
        				<p class="small">Administrador</p>
							<% HttpSession misesion = request.getSession();
							String usuario = (String)misesion.getAttribute("usuario");
							%>
        				</div>
        			</div>
				</div>
			</div>
			<div class="p-2">
				<div class="container p-3">
					<!-- BOTÓM HOME -->
					<a href="index.html" class="btn btn-warning b1">
	   					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
	   						<path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
	   						<path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
	   					</svg>
	    			</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- TABLAS -->
	<main>
		<!-- CONTENIDO DE LA PÁGINA -->
		<div class="container">
			<!-- TABS, PARA ABRIR O CAMBIAR DE TABLA -->
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="nav-item nav-link active" id="nav-orfanato-tab" data-toggle="tab" href="#nav-orfanato" role="tab" aria-controls="nav-orfanato" aria-selected="true">Orfanato</a> 
    				<a class="nav-item nav-link" id="nav-ninos-tab" data-toggle="tab" href="#nav-ninos" role="tab" aria-controls="nav-ninos" aria-selected="false">Niños</a>
    				<a class="nav-item nav-link" id="nav-barrio-tab" data-toggle="tab" href="#nav-barrio" role="tab" aria-controls="nav-barrio" aria-selected="false">Barrios</a>
    				<a class="nav-item nav-link" id="nav-grupoVecinos-tab" data-toggle="tab" href="#nav-grupoVecinos" role="tab" aria-controls="nav-grupoVecinos" aria-selected="false">Grupo de vecinos</a>
    				<a class="nav-item nav-link" id="nav-vecinos-tab" data-toggle="tab" href="#nav-vecinos" role="tab" aria-controls="nav-vecinos" aria-selected="false">Vecinos</a>
    				<a class="nav-item nav-link" id="nav-eventos-tab" data-toggle="tab" href="#nav-eventos" role="tab" aria-controls="nav-eventos" aria-selected="false">Eventos</a>
  				</div>
			</nav>
			
			<!-- TABLAS Y SU CONTENIDO -->
			<div class="tab-content" id="nav-tabContent">
				<!-- ORFANATO -->
				<div class="tab-pane fade show active" id="nav-orfanato" role="tabpanel" aria-labelledby="nav-orfanato-tab">
					<div class="container mt-3">
						
						<!-- BOTONES PARA INSERTAR, BORRAR, MODIFICAR o BUSCAR -->
						<div class="d-flex flex-row-reverse">
							<div class="p-2">
								<!-- INSERTAR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".insertarOrfanato">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
										<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
										<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
									</svg>
								</button>
								<div class="modal fade insertarOrfanato" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA INSERTAR ORFANATOS -->
	    									<div class="container formulario">
												<h1>Insertar información en la base de datos</h1>
												<form action="ServletForm" method="post">
													<div class="mb-3 mt-3">
															<!-- CIF -->
														<div class="form-group row">
															<label for="cifOrfanato" class="col-sm-2 col-form-label">CIF del orfanato:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="cifOrfanato" placeholder="CIF del orfanato (9 dígitos)" name="cifOrfanato" required pattern="[0-9]{9}"><br>
															</div>
														</div>
															<!-- NOMBRE -->
														<div class="form-group row">
															<label for="nombreOrfanato" class="col-sm-2 col-form-label">Nombre del orfanato:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="nombreOrfanato" placeholder="Nombre del orfanato" name="nombreOrfanato" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ0-9\s.,]{3,50}"><br>
															</div>
														</div>
															<!-- DIRECCION -->
														<div class="form-group row">
															<label for="direccionOrfanato" class="col-sm-2 col-form-label">Dirección del orfanato:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="direccionOrfanato" placeholder="Dirección del orfanato" name="direccionOrfanato" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ0-9\s.,]{3,50}"><br>
															</div>
														</div>
															<!-- CODIGO BARRIO -->
														<div class="form-group row">
															<label for="cod_barrioOrfanato" class="col-sm-2 col-form-label">Código del barrio:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="cod_barrioOrfanato" placeholder="Código del barrio al que pertenece" name="cod_barrioOrfanato" required pattern="[0-9]+"><br>
															</div>
														</div>
													</div>
													<button type="submit" class="btn btn-warning">Insertar datos</button>
												</form>
											</div>
	    									
									    </div>
									</div>
								</div>
							</div>
							
							<div class="p-2">
								<!-- BORRAR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".borrarOrfanato">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eraser-fill" viewBox="0 0 16 16">
										<path d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm.66 11.34L3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"/>
									</svg>
								</button>
								
								<!-- FORMULARIO PARA BORRAR ORFANATOS -->
								<div class="modal fade borrarOrfanato" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA BUSCAR A LOS NIÑOS -->
	    									<div class="container formulario">
												<br><br>
												<h1>Borrar orfanato por CIF</h1>
												<form action="ServletForm" method="post">	
													<div class="mb-3 mt-3">
														<label for="borrarOrfanato"></label>
														<input type="text" class="form-control" id="borrarOrfanato" placeholder="Introduce el CIF del Orfanato que quieres borrar" name="borrarOrfanato" required pattern="[0-9]{1,9}">
													</div>
													<button type="submit" class="btn btn-warning">Borrar orfanato</button>
												</form>
												<br><br>
											</div>
											
									    </div>
									</div>
								</div>
							</div>
							
							<div class="p-2">				
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".buscarOrfanato">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	  									<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
									</svg>
								</button>
								<div class="modal fade buscarOrfanato" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA BUSCAR A LOS NIÑOS -->
	    									<div class="container formulario">
												<br><br>
												<h1>Buscador</h1>
												<form action="ServletForm" method="post">
													<div class="mb-3 mt-3">
														<label for="buscarOrfanato">CIF del orfanato: </label>
														<input type="text" class="form-control" id="buscarOrfanato" placeholder="Introduce el CIF del Orfanato (9 dígitos)" name="buscarOrfanato" required pattern="[0-9]{1,9}">
													</div>
													<button type="submit" class="btn btn-warning">Buscar</button>
												</form>
												<br><br>
											</div>
											
									    </div>
									</div>
								</div>
							</div>
						</div>	
						
						<!-- DATOS DENTRO DE LA TABLA QUE SE COGEN DE LA BASE DE DATOS -->
						<h1 style='color: #215F78;'>Orfanatos</h1>
						<table class="table">
							<thead style='color: #FFC023;'>
								<tr>
									<th scope="col">CIF</th>
									<th scope="col">Nombre</th>
									<th scope="col">Dirección</th>
									<th scope="col">Código del barrio</th>
								</tr>
							</thead>
							<tbody>
								<%
								LinkedList<Orfanatos> listaOrfanato = Controller.getOrfanatos();
									out.println("<tr>");
								for (int i = 0; i < listaOrfanato.size(); i++) {
									out.println("<td>" + listaOrfanato.get(i).getCif() + "</td>");
									out.println("<td style='font-weight: bold;'>" + listaOrfanato.get(i).getNombre()+ "</td>");
									out.println("<td style='font-weight: bold;'>" + listaOrfanato.get(i).getDireccion() + "</td>");
									out.println("<td>" + listaOrfanato.get(i).getCod_barrio() + "</td>");
									out.println("</tr>");
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
					
				<!-- NIÑOS -->
  				<div class="tab-pane fade" id="nav-ninos" role="tabpanel" aria-labelledby="nav-ninos-tab">
					<div class="container mt-3 ">
						
						<!-- BOTONES PARA INSERTAR, BORRAR, MODIFICAR o BUSCAR -->
						<div class="d-flex flex-row-reverse">
							<div class="p-2">
								<!-- INSERTAR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".insertarNinos">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
										<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
										<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
									</svg>
								</button>
								<div class="modal fade insertarNinos" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA INSERTAR A LOS NIÑOS -->
	    									<div class="container formulario">
												<h1>Insertar información en la base de datos</h1>
												<form action="ServletForm" method="post">
													<div class="mb-3 mt-3">
															<!-- ID -->
														<div class="form-group row">
															<label for="idNino" class="col-sm-2 col-form-label">ID del niño:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="idNino" placeholder="ID del niño (1 letra y 8 números)" name="idNino" required pattern="[a-zA-Z0-9]{9}"><br>
															</div>
														</div>
															<!-- Nombre -->
														<div class="form-group row">
															<label for="nombreNino" class="col-sm-2 col-form-label">Nombre del niño:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="nombreNino" placeholder="Nombre del niño" name="nombreNino" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{2,20}"><br>
															</div>
														</div>
															<!-- Apellido -->
														<div class="form-group row">
															<label for="apellidoNino" class="col-sm-2 col-form-label">Apellido del niño:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="apellidoNino" placeholder="Apellido del niño" name="apellidoNino" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{4,20}"><br>
															</div>
														</div>
															<!-- Regalo -->
														<div class="form-group row">
															<label for="regaloNino" class="col-sm-2 col-form-label">Regalo:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="regaloNino" placeholder="Regalo" name="regaloNino" pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s.,]{0,20}"><br>
															</div>
														</div>
															<!-- Código evento -->
														<div class="form-group row">
															<label for="codigo_eventoNino" class="col-sm-2 col-form-label">Código evento:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="codigo_eventoNino" placeholder="Código del evento (5 dígitos)" name="codigo_eventoNino" required pattern="[0-9]{5}"><br>
															</div>
														</div>
															<!-- Orfanato CIF -->
														<div class="form-group row">
															<label for="orfanato_cifNino" class="col-sm-2 col-form-label">Orfanato CIF:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="orfanato_cifNino" placeholder="CIF del orfanato" name="orfanato_cifNino" required pattern="[0-9]{1,9}"><br>
															</div>
														</div>
													</div>
													<button type="submit" class="btn btn-warning">Insertar datos</button>
												</form>
											</div>
	    									
									    </div>
									</div>
								</div>
							</div>
							
							<div class="p-2">
								<!-- BORRAR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".borrarNino">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eraser-fill" viewBox="0 0 16 16">
										<path d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm.66 11.34L3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"/>
									</svg>
								</button>
								
								<!-- FORMULARIO PARA BORRAR NINOS -->
								<div class="modal fade borrarNino" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA BORRAR A LOS NIÑOS -->
	    									<div class="container formulario">
												<br><br>
												<h1>Borrar niño por nombre</h1>
												<form action="ServletForm" method="post">	
													<div class="mb-3 mt-3">
														<label for="borrarNino"></label>
														<input type="text" class="form-control" id="borrarNino" placeholder="Introduce el nombre del niño al que quieres borrar de la base de datos" name="borrarNino" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{2,20}">
													</div>
													<button type="submit" class="btn btn-warning">Borrar niño</button>
												</form>
												<br><br>
											</div>
											
									    </div>
									</div>
								</div>
							</div>
							
							<div class="p-2">
								<!-- BUSCADOR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".buscarNinos">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	  									<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
									</svg>
								</button>
								<div class="modal fade buscarNinos" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA BUSCAR A LOS NIÑOS -->
	    									<div class="container formulario">
												<h1>Buscador</h1>
												<form action="ServletForm" method="post">
													<div class="mb-3 mt-3">
														<label for="buscarNino">Nombre del niño: </label>
														<input type="text" class="form-control" id="buscarNino" placeholder="Introduce el nombre del niño" name="buscarNino" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{2,20}">
													</div>
													<button type="submit" class="btn btn-warning">Buscar</button>
												</form>
											</div>
											
									    </div>
									</div>
								</div>
							</div>
						</div>	
						
						<!-- DATOS DENTRO DE LA TABLA QUE SE COGEN DE LA BASE DE DATOS -->
						<h1 style='color: #215F78;'>Niños</h1>
						<table class="table">
							<thead style='color: #FFC023;'>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Nombre</th>
									<th scope="col">Apellido</th>
									<th scope="col">Regalo</th>
									<th scope="col">Código evento</th>
									<th scope="col">Orfanato cif</th>
								</tr>
							</thead>
							<tbody>
								<%
								LinkedList<Ninos> listaNinos = Controller.getNinos();
								out.println("<tr>");
								for (int i = 0; i < listaNinos.size(); i++) {
									out.println("<td>" + listaNinos.get(i).getId() + "</td>");
									out.println("<td style='font-weight: bold;'>" + listaNinos.get(i).getNombre() + "</td>");
									out.println("<td style='font-weight: bold;'>" + listaNinos.get(i).getApellido() + "</td>");
									out.println("<td>" + listaNinos.get(i).getRegalo() + "</td>");
									out.println("<td>" + listaNinos.get(i).getCodigo_evento() + "</td>");
									out.println("<td>" + listaNinos.get(i).getOrfanato_cif() + "</td>");
									out.println("</tr>");
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
				
				<!-- BARRIOS -->
				<div class="tab-pane fade" id="nav-barrio" role="tabpanel" aria-labelledby="nav-barrio-tab">
					<div class="container mt-3">
						
						<!-- BOTONES PARA INSERTAR, BORRAR, MODIFICAR o BUSCAR -->
						<div class="d-flex flex-row-reverse">
							<div class="p-2">
								<!-- INSERTAR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".insertarBarrio">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
										<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
										<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
									</svg>
								</button>
								<div class="modal fade insertarBarrio" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA INSERTAR BARRIOS -->
	    									<div class="container formulario">
												<h1>Insertar información en la base de datos</h1>
												<form action="ServletForm" method="post">
													<div class="mb-3 mt-3">
															<!-- Codigo -->
														<div class="form-group row">
															<label for="codigoBarrio" class="col-sm-2 col-form-label">Código del barrio:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="codigoBarrio" placeholder="Código del barrio" name="codigoBarrio" required pattern="[0-9]+"><br>
															</div>
														</div>
															<!-- Nombre -->
														<div class="form-group row">
															<label for="nombreBarrio" class="col-sm-2 col-form-label">Nombre del barrio:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="nombreBarrio" placeholder="Nombre del barrio" name="nombreBarrio" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{3,30}"><br>
															</div>
														</div>
															<!-- Zona -->
														<div class="form-group row">
															<label for="zonaBarrio" class="col-sm-2 col-form-label">Zona del barrio:</label>
															<div class="col-sm-10">
																<select type="text" class="form-control" name="zonaBarrio" id="zonaBarrio" required>
																	<option hidden disabled selected value="">Selecciona entre Norte, Sur o Centro</option>
																	<option value=" "> </option>
																	<option value="Norte">Norte</option>
																	<option value="Sur">Sur</option>
																	<option value="Centro">Centro</option>
																</select>
															</div>
														</div>
													</div>
													<button type="submit" class="btn btn-warning">Insertar datos</button>
												</form>
											</div>	
									    </div>
									</div>
								</div>
							</div>
							
							<div class="p-2">
								<!-- BORRAR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".borrarBarrio">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eraser-fill" viewBox="0 0 16 16">
										<path d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm.66 11.34L3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"/>
									</svg>
								</button>
								
								<!-- FORMULARIO PARA BORRAR BARRIOS -->
								<div class="modal fade borrarBarrio" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA BORRAR A LOS NIÑOS -->
	    									<div class="container formulario">
												<br><br>
												<h1>Borrar barrio por nombre</h1>
												<form action="ServletForm" method="post">	
													<div class="mb-3 mt-3">
														<label for="borrarNino"></label>
														<input type="text" class="form-control" id="borrarBarrio" placeholder="Introduce el nombre del barrio que quieres borrar de la base de datos" name="borrarBarrio" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{3,30}">
													</div>
													<button type="submit" class="btn btn-warning">Borrar barrio</button>
												</form>
												<br><br>
											</div>
											
									    </div>
									</div>
								</div>
							</div>
							
							<div class="p-2">
								<!-- BUSCADOR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".buscarBarrio">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	  									<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
									</svg>
								</button>
								<div class="modal fade buscarBarrio" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA BUSCAR A LOS NIÑOS -->
	    									<div class="container formulario">
												<br><br>
												<h1>Buscador</h1>
												<form action="ServletForm" method="post">
													<div class="mb-3 mt-3">
														<label for="buscarBarrio">Nombre del barrio: </label>
														<input type="text" class="form-control" id="buscarBarrio" placeholder="Introduce el nombre del barrio" name="buscarBarrio" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{3,30}">
													</div>
													<button type="submit" class="btn btn-warning">Buscar</button>
												</form>
												<br><br>
											</div>
									    </div>
									</div>
								</div>
							</div>
						</div>	
						
						<!-- DATOS DENTRO DE LA TABLA QUE SE COGEN DE LA BASE DE DATOS -->
						<h1 style='color: #215F78;'>Barrios</h1>
						<table class="table">
							<thead style='color: #FFC023;'>
								<tr>
									<th scope="col">Código</th>
									<th scope="col">Nombre</th>
									<th scope="col">Zona</th>
								</tr>
							</thead>
							<tbody>
								<%
								LinkedList<Barrios> lista = Controller.getBarrios();
								for (int i = 0; i < lista.size(); i++) {
									out.println("<td>" + lista.get(i).getCodigo() + "</td>");
									out.println("<td style='font-weight: bold;'>" + lista.get(i).getNombre() + "</td>");
									out.println("<td style='font-weight: bold;'>" + lista.get(i).getZona() + "</td>");
									out.println("</tr>");
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
				
				<!-- GRUPO DE VECINOS -->
				<div class="tab-pane fade" id="nav-grupoVecinos" role="tabpanel" aria-labelledby="nav-grupoVecinos-tab">
					<div class="container mt-3">
						
						<!-- BOTONES PARA INSERTAR, BORRAR, MODIFICAR o BUSCAR -->
						<div class="d-flex flex-row-reverse">
							<div class="p-2">
								<!-- INSERTAR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".insertarGrupoVecino">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
										<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
										<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
									</svg>
								</button>
								<div class="modal fade insertarGrupoVecino" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA INSERTAR GRUPOS DE VECINOS -->
	    									<div class="container formulario">
												<h1>Insertar información en la base de datos</h1>
												<form action="ServletForm" method="post">
													<div class="mb-3 mt-3">
															<!-- Codigo -->
														<div class="form-group row">
															<label for="codigoGrupo" class="col-sm-2 col-form-label">Código del grupo de vecinos:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="codigoGrupo" placeholder="Código del grupo de vecinos" name="codigoGrupo" required pattern="[0-9]+"><br>
															</div>
														</div>
															<!-- Nombre -->
														<div class="form-group row">
															<label for="nombreGrupo" class="col-sm-2 col-form-label">Nombre del grupo de vecinos:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="nombreGrupo" placeholder="Nombre del grupo de vecinos" name="nombreGrupo" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{3,25}"><br>
															</div>
														</div>
															<!-- Codigo barrio -->
														<div class="form-group row">
															<label for="cod_barrioGrupo" class="col-sm-2 col-form-label">Código del barrio:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="cod_barrioGrupo" placeholder="Código del barrio al que pertenecen" name="cod_barrioGrupo" required pattern="[0-9]+"><br>
															</div>
														</div>
													</div>
													<button type="submit" class="btn btn-warning">Insertar datos</button>
												</form>
											</div>
	    									
									    </div>
									</div>
								</div>
							</div>
							
							<div class="p-2">
								<!-- BORRAR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".borrarGrupo">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eraser-fill" viewBox="0 0 16 16">
										<path d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm.66 11.34L3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"/>
									</svg>
								</button>
								
								<!-- FORMULARIO PARA BORRAR GRUPO DE VECINOS -->
								<div class="modal fade borrarGrupo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA BORRAR A LOS GRUPOS DE VECINOS -->
	    									<div class="container formulario">
												<br><br>
												<h1>Borrar grupo de vecinos por nombre</h1>
												<form action="ServletForm" method="post">	
													<div class="mb-3 mt-3">
														<label for="borrarGrupo"></label>
														<input type="text" class="form-control" id="borrarGrupo" placeholder="Introduce el nombre del grupo de vecinos que quieres borrar de la base de datos" name="borrarGrupo" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{3,25}">
													</div>
													<button type="submit" class="btn btn-warning">Borrar grupo de vecinos</button>
												</form>
												<br><br>
											</div>
											
									    </div>
									</div>
								</div>
							</div>
							
							<div class="p-2">
								<!-- BUSCADOR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".buscarGrupoVecino">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	  									<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
									</svg>
								</button>
								<div class="modal fade buscarGrupoVecino" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA BUSCAR A LOS GRUPOS DE VECINOS -->
	    									<div class="container formulario">
												<br><br>
												<h1>Buscador</h1>
												<form action="ServletForm" method="post">
													<div class="mb-3 mt-3">
														<label for="buscarGrupoVecino">Nombre del grupo de vecinos: </label>
														<input type="text" class="form-control" id="buscarGrupoVecino" placeholder="Introduce el nombre del grupo de vecinos" name="buscarGrupoVecino" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ0-9\s.,]{3,25}">
													</div>
													<button type="submit" class="btn btn-warning">Buscar</button>
												</form>
												<br><br>
											</div>
											
									    </div>
									</div>
								</div>
							</div>
						</div>	
						
						<!-- DATOS DENTRO DE LA TABLA QUE SE COGEN DE LA BASE DE DATOS -->
						<h1 style='color: #215F78;'>Grupo de vecinos</h1>
						<table class="table">
							<thead style='color: #FFC023;'>
								<tr>
									<th scope="col">Código grupo de vecinos</th>
									<th scope="col">Nombre</th>
									<th scope="col">Código del barrio</th>
								</tr>
							</thead>
							<tbody>
								<%
								LinkedList<Grupo_vecinos> listaGrupo = Controller.getGrupo_vecinos();
									out.println("<tr>");
								for (int i = 0; i < listaGrupo.size(); i++) {
									out.println("<td>" + listaGrupo.get(i).getCod_grupo() + "</td>");
									out.println("<td style='font-weight: bold;'>" + listaGrupo.get(i).getNombre() + "</td>");
									out.println("<td>" + listaGrupo.get(i).getCod_barrio() + "</td>");
									out.println("</tr>");
								}
								%>
							</tbody>
						</table>
					</div>
				</div>

				<!-- VECINOS -->
				<div class="tab-pane fade" id="nav-vecinos" role="tabpanel" aria-labelledby="nav-vecinos-tab">
					<div class="container mt-3">
						
						<!-- BOTONES PARA INSERTAR, BORRAR, MODIFICAR o BUSCAR -->
						<div class="d-flex flex-row-reverse">
							<div class="p-2">
								<!-- INSERTAR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".insertarVecinos">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
										<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
										<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
									</svg>
								</button>
								<div class="modal fade insertarVecinos" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA INSERTAR A LOS VECINOS -->
	    									<div class="container formulario">
												<h1>Insertar información en la base de datos</h1>
												<form action="ServletForm" method="post">
													<div class="mb-3 mt-3">
															<!-- DNI -->
														<div class="form-group row">
															<label for="DNI_vecino" class="col-sm-3 col-form-label">DNI del vecino:</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="DNI_vecino" placeholder="DNI del vecino (8 dígitos y 1 letra)" name="DNI_vecino" required pattern="[0-9]{8}[a-zA-Z]{1}"><br>
															</div>
														</div>
															<!-- Nombre -->
														<div class="form-group row">
															<label for="nombreVecino" class="col-sm-3 col-form-label">Nombre del vecino:</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="nombreVecino" placeholder="Nombre del vecino" name="nombreVecino" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{2,20}"><br>
															</div>
														</div>
															<!-- Apellido -->
														<div class="form-group row">
															<label for="apellidoVecino" class="col-sm-3 col-form-label">Apellido del vecino:</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="apellidoVecino" placeholder="Apellido del vecino" name="apellidoVecino" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{2,20}"><br>
															</div>
														</div>
															<!-- Rey Mago -->
														<div class="form-group row">
															<label for="reyMagoVecino" class="col-sm-3 col-form-label">Nombre del Rey Mago al que interpreta el vecino:</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="reyMagoVecino" placeholder="Rey Mago (Melchor, Gaspar, Baltasar o ninguno)" name="reyMagoVecino" pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{0,8}"><br>
															</div>
														</div>
															<!-- Código barrio -->
														<div class="form-group row">
															<label for="cod_barrioVecino" class="col-sm-3 col-form-label">Código del barrio al que pertenece:</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="cod_barrioVecino" placeholder="Código del barrio" name="cod_barrioVecino" required pattern=[0-9]+><br>
															</div>
														</div>
															<!-- DNI Vecino captador  -->
														<div class="form-group row">
															<label for="dni_vecinoCaptador" class="col-sm-3 col-form-label">DNI del vecino captador: </label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="dni_vecinoCaptador" placeholder="DNI del vecino captador" name="dni_vecinoCaptador" pattern="[0-9]{8}[a-zA-Z]{1}"><br>
															</div>
														</div>
															<!-- Grupo vecino -->
														<div class="form-group row">
															<label for="grupo_vecinoVecino" class="col-sm-3 col-form-label">Código del grupo de vecinos al que pertenece:</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="grupo_vecinoVecino" placeholder="Código del grupo de vecinos" name="grupo_vecinoVecino" required pattern="[0-9]+"><br>
															</div>
														</div>
													</div>
													<button type="submit" class="btn btn-warning">Insertar datos</button>
												</form>
											</div>
									   </div>
									</div>
								</div>
							</div>
							
							<div class="p-2">
								<!-- BORRAR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".borrarVecino">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eraser-fill" viewBox="0 0 16 16">
										<path d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm.66 11.34L3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"/>
									</svg>
								</button>
								
								<!-- FORMULARIO PARA BORRAR VECINOS -->
								<div class="modal fade borrarVecino" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA BORRAR A LOS GRUPOS DE VECINOS -->
	    									<div class="container formulario">
												<br><br>
												<h1>Borrar vecinos por nombre</h1>
												<form action="ServletForm" method="post">	
													<div class="mb-3 mt-3">
														<label for="borrarVecino"></label>
														<input type="text" class="form-control" id="borrarVecino" placeholder="Introduce el nombre del vecino que quieres borrar de la base de datos" name="borrarVecino" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{2,20}">
													</div>
													<button type="submit" class="btn btn-warning">Borrar vecino</button>
												</form>
												<br><br>
											</div>
											
									    </div>
									</div>
								</div>
							</div>
							
							<div class="p-2">
								<!-- BUSCADOR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".buscarVecinos">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	  									<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
									</svg>
								</button>
								<div class="modal fade buscarVecinos" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA BUSCAR A LOS VECINOS -->
	    									<div class="container formulario">
												<h1>Buscador</h1>
												<form action="ServletForm" method="post">
													<div class="mb-3 mt-3">
														<label for="buscarVecino">Nombre del vecino: </label>
														<input type="text" class="form-control" id="buscarVecino" placeholder="Introduce el nombre del vecino" name="buscarVecino" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{2,20}">
													</div>
													<button type="submit" class="btn btn-warning">Buscar</button>
												</form>
											</div>
											
									    </div>
									</div>
								</div>
							</div>
						</div>	
						
						<!-- DATOS DENTRO DE LA TABLA QUE SE COGEN DE LA BASE DE DATOS -->
						<h1 style='color: #215F78;'>Vecinos</h1>
						<table class="table">
							<thead style='color: #FFC023;'>
								<tr>
									<th>DNI</th>
									<th>Nombre</th>
									<th>Apellido</th>
									<th>Rey Mago</th>
									<th>Código barrio</th>
									<th>DNI vecino</th>
									<th>Grupo Vecino</th>
								</tr>
							</thead>
							<tbody>
								<%
								LinkedList<Vecinos> listaVecinos = Controller.getVecinos();
								for (int i = 0; i < listaVecinos.size(); i++) {
									out.println("<td>" + listaVecinos.get(i).getDni() + "</td>");
									out.println("<td style='font-weight: bold;'>" + listaVecinos.get(i).getNombre() + "</td>");
									out.println("<td style='font-weight: bold;'>" + listaVecinos.get(i).getApellido() + "</td>");
									out.println("<td>" + listaVecinos.get(i).getRey_mago() + "</td>");
									out.println("<td>" + listaVecinos.get(i).getCod_barrio() + "</td>");
									out.println("<td>" + listaVecinos.get(i).getDni_vecino() + "</td>");
									out.println("<td>" + listaVecinos.get(i).getGrupo_vecino() + "</td>");
									out.println("</tr>");
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
				
				<!-- EVENTOS -->
				<div class="tab-pane fade" id="nav-eventos" role="tabpanel" aria-labelledby="nav-eventos-tab">
					<div class="container mt-3">
						
						<!-- BOTONES PARA INSERTAR, BORRAR, MODIFICAR o BUSCAR -->
						<div class="d-flex flex-row-reverse">
							<div class="p-2">
							
								<!-- INSERTAR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".insertarEventos">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
										<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
										<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
									</svg>
								</button>
								<div class="modal fade insertarEventos" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    								
	    									<!-- FORMULARIO PARA INSERTAR A LOS EVENTOS -->
	    									<div class="container formulario">
												<h1>Insertar información en la base de datos</h1>
												<form action="ServletForm" method="post">
													<div class="mb-3 mt-3">
															<!-- Código evento -->
														<div class="form-group row">
															<label for="cod_eventoEvento" class="col-sm-3 col-form-label">Código del evento:</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="cod_eventoEvento" placeholder="Código del evento" name="cod_eventoEvento" required pattern="[0-9]{5}"><br>
															</div>
														</div>
															<!-- Ubicación -->
														<div class="form-group row">
															<label for="ubicaciónEvento" class="col-sm-3 col-form-label">Ubicación del vecino:</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="ubicaciónEvento" placeholder="Ubicación del evento" name="ubicaciónEvento" required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ0-9\s,-.]{3,100}"><br>
															</div>
														</div>
															<!-- Fecha -->
														<div class="form-group row">
															<label for="fechaEventos" class="col-sm-3 col-form-label">Fecha del evento:</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="fechaEventos" placeholder="Fecha del evento (con formato 2000-05-05)" name="fechaEventos" required pattern=[0-9]{4}-[0-9]{2}-[0-9]{2}><br>
															</div>
														</div>
															<!-- Hora -->
														<div class="form-group row">
															<label for="horaEventos" class="col-sm-3 col-form-label">Hora del evento:</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="horaEventos" placeholder="Hora del evento (con formaro 00:00:00)" name="horaEventos" pattern="[0-9]{2}:[0-9]{2}:[0-9]{2}"><br>
															</div>
														</div>
															<!-- Código grupo de vecinos -->
														<div class="form-group row">
															<label for="cod_grupoEventos" class="col-sm-3 col-form-label">Código del grupo de vecinos que organiza el evento:</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="cod_grupoEventos" placeholder="Código del grupo de vecinos" name="cod_grupoEventos" required pattern="[0-9]+"><br>
															</div>
														</div>
													</div>
													<button type="submit" class="btn btn-warning">Insertar datos</button>
												</form>
											</div>
									    </div>
									</div>
								</div>
							</div>
							
							<div class="p-2">
								<!-- BORRAR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".borrarEvento">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eraser-fill" viewBox="0 0 16 16">
										<path d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm.66 11.34L3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"/>
									</svg>
								</button>
								
								<!-- FORMULARIO PARA BORRAR EVENTOS -->
								<div class="modal fade borrarEvento" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA BORRAR A LOS GRUPOS DE VECINOS -->
	    									<div class="container formulario">
												<br><br>
												<h1>Borrar evento por código</h1>
												<form action="ServletForm" method="post">	
													<div class="mb-3 mt-3">
														<label for="borrarEvento"></label>
														<input type="text" class="form-control" id="borrarEvento" placeholder="Introduce el código del evento (5 dígitos) que quieres borrar de la base de datos" name="borrarEvento" required pattern="[0-9]{5}">
													</div>
													<button type="submit" class="btn btn-warning">Borrar evento</button>
												</form>
												<br><br>
											</div>
											
									    </div>
									</div>
								</div>
							</div>
							
							<div class="p-2">
								<!-- BUSCADOR -->
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target=".buscarEventos">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	  									<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
									</svg>
								</button>
								<div class="modal fade buscarEventos" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  								<div class="modal-dialog modal-lg">
	    								<div class="modal-content">
	    									
	    									<!-- FORMULARIO PARA BUSCAR EVENTOS -->
	    									<div class="container formulario">
												<br><br>
												<h1>Buscador</h1>
												<form action="ServletForm" method="post">
													<div class="mb-3 mt-3">
														<label for="buscarEvento">Código del evento: </label>
														<input type="text" class="form-control" id="buscarEvento" placeholder="Introduce el código del evento (5 dígitos)" name="buscarEvento" required pattern="[0-9]{5}">
													</div>
													<button type="submit" class="btn btn-warning">Buscar</button>
												</form>
												<br><br>
											</div>
											
									    </div>
									</div>
								</div>
							</div>
						</div>	
						
						<!-- DATOS DENTRO DE LA TABLA QUE SE COGEN DE LA BASE DE DATOS -->
						<h1 style='color: #215F78;'>Eventos</h1>
						<table class="table">
							<thead style='color: #FFC023;'>
								<tr>
									<th scope="col">Código evento</th>
									<th scope="col">Ubicación</th>
									<th scope="col">Fecha</th>
									<th scope="col">Hora</th>
									<th scope="col">Código grupo</th>
									
								</tr>
							</thead>
							<tbody>
								<%
								LinkedList<Eventos> listaEventos = Controller.getEventos();
								for (int i = 0; i < listaEventos.size(); i++) {
									/*if (i % 2 == 0) {
										out.println("<tr class='table-primary'>");
									} else {
										out.println("<tr class='table-success'>");
									}*/
									out.println("<td>" + listaEventos.get(i).getCodigo_evento() + "</td>");
									out.println("<td style='font-weight: bold;'>" + listaEventos.get(i).getUbicacion() + "</td>");
									out.println("<td style='font-weight: bold;'>" + listaEventos.get(i).getFecha() + "</td>");
									out.println("<td>" + listaEventos.get(i).getHora() + "</td>");
									out.println("<td>" + listaEventos.get(i).getCod_grupo() + "</td>");
									out.println("</tr>");
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>
	
</body>
</html>
