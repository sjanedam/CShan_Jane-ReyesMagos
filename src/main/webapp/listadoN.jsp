<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.Ninos"%>
<%@ page import="com.ies.baroja.Controller"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="es" dir="ltr">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Niños</title>
<!-- BOOSTRAP -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<!--  JavaScript: jQuery, Popper.js, Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	<!-- TOP -->
	<br>
	<div class="sticky-content" align="center">
		<button type="btn btn-primary" style="background-color: #FFC023; border-color: #FFC023; border-radius: 10px; padding-left: 5px; padding-right: 5px; padding-bottom: 5px;">
			<a href="principal.jsp"> <svg xmlns="http://www.w3.org/2000/svg"
					width="25" height="25" fill="white" class="bi bi-house-fill"
					viewBox="0 0 16 16">
          <path fill-rule="evenodd"
						d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
          <path fill-rule="evenodd"
						d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
        </svg>
			</a>
		</button>
	</div>

	<div class="container mt-3">
	<!-- BUSCADOR -->
	<div class="d-flex flex-row-reverse">
		<div class="p-2">
			<!-- BUSCADOR -->
			<button type="button" class="btn btn-warning" data-toggle="modal"
				data-target=".buscarNinos">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
		  									<path
						d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
										</svg>
			</button>
			<div class="modal fade buscarNinos" tabindex="-1" role="dialog"
				aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
	
						<!-- FORMULARIO PARA BUSCAR A LOS NIÑOS -->
						<div class="container formulario">
							<h1>Buscador</h1>
							<form action="ServletForm" method="post">
								<div class="mb-3 mt-3">
									<label for="buscarNino">Nombre del niño: </label> <input
										type="text" class="form-control" id="buscarNino"
										placeholder="Introduce el nombre del niño" name="buscarNino"
										required pattern="[a-zA-ZáÁéÉíÍóÓúÚñÑ\s]{2,20}">
								</div>
								<button type="submit" class="btn btn-warning">Buscar</button>
							</form>
						</div>
	
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- TABLA -->
		<h3 style='color: #215F78;'>¡Conoce a los niños!</h3>
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
				LinkedList<Ninos> lista = Controller.getNinos();
				for (int i = 0; i < lista.size(); i++) {
					/*if (i % 2 == 0) {
						out.println("<tr class='table-primary'>");
					} else {
						out.println("<tr class='table-success'>");
					}*/
					out.println("<td>" + lista.get(i).getId() + "</td>");
					out.println("<td style='font-weight: bold;'>" + lista.get(i).getNombre() + "</td>");
					out.println("<td style='font-weight: bold;'>" + lista.get(i).getApellido() + "</td>");
					out.println("<td>" + lista.get(i).getRegalo() + "</td>");
					out.println("<td>" + lista.get(i).getCodigo_evento() + "</td>");
					out.println("<td>" + lista.get(i).getOrfanato_cif() + "</td>");
					out.println("</tr>");
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
