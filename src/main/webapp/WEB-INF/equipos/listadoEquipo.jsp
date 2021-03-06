<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${titulo}</title>
<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script src="${path}/static/js/miscriptequipo.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	</head>
<body>
	<h1>Listado de equipos</h1>

	${titulo}

	<table
		class="table table-hover table-condensed table-striped table-bordered">
		<thead>
			<tr>
				<td style="width: 10%">#</td>
				<td style="width: 10%">Nombre</td>
				<td style="width: 10%">Escudo</td>
				<td style="width: 10%">Estadio</td>
				<td style="width: 10%">Presupuesto</td>
				<td style="width: 10%">Division</td>
				<td style="width: 10%"><a href="<c:url value="/federaciones" />">Federacion</a></td>
			<sec:authorize access="hasRole('ADMIN')">
				<td style="width: 10%">Editar</td>
				<td style="width: 10%">Borrar</td>
			</sec:authorize>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${equipos}" var="equipo">
				<tr data-id="${equipo.id}">
					<td>${equipo.id}</td>
					<td><a href="<c:url value="/equipos/detalle/${equipo.id}" />">${equipo.nombre}</td>
					<td><img alt="" src="${equipo.imagen}" width="50px"></td>
					<td>${equipo.estadio}</td>
					<td>${equipo.presupuesto}</td>
					<td>${equipo.division}</td>
					<td>${equipo.federacion.nombre}</td>
				<sec:authorize access="hasRole('ADMIN')">
					<td><button type="button" class="btn btn-warning btn-editar">Editar</button></td>
					<td><button type="button" class="btn btn-danger btn-borrar-mostrar-modal">Borrar</button></td>
				</sec:authorize>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">Equipos registrados: <span
					id="cantidad-equipos">${equipos.size()}</span></td>
			</tr>
			<tr>
			<sec:authorize access="hasRole('ADMIN')">
				<td colspan="5">
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#modal-equipos">Registrar Equipos</button>
				</td>
			</sec:authorize>
			</tr>
		</tfoot>
	</table>


	<div class="modal fade" id="modal-equipos" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="form-equipos" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Informacion de Equipos</h4>
					</div>
					<div class="modal-body">
						<label for="nombre">Nombre: </label> <input id="nombre" name="nombre"
							class="form-control"> 
							
						<label for="nombre">Escudo: </label> <input id="imagen" name="imagen"
							class="form-control"> 
							
						<label for="nombre">Estadio: </label> <input id="estadio" name="estadio"
							class="form-control"> 

						<label for="nombre">Presupuesto: </label> <input id="presupuesto" name="presupuesto"
							class="form-control"> 
							
						<label for="division">Division:
						</label> <select id="division" name="division" class="form-control">
							<c:forEach items="${divisiones}" var="division">
								<option value="${division}">${division}</option>
							</c:forEach></select>
							
						<label for="federacion">Federacion:
						</label> <select id="federacion" name="federacion" class="form-control">
							<c:forEach items="${federacion}" var="fede">
								<option value="${fede.id}">${fede.nombre}</option>
							</c:forEach>
							
						</select> <input id="id" name="id" type="hidden"> <input id="csrf"
							name="_csrf" type="hidden" value="${_csrf.token}">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
						<button id="btn-salvar" type="submit" class="btn btn-primary">Guardar
							Informacion</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="modal-equiposborrar" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="form-equiposborrar" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Borrar equipo</h4>
					</div>
					<div class="modal-body">
							
						</select> 
						
						<input id="idborrar" name="id" type="hidden">
						<input id="csrf" name="_csrf" type="hidden" value="${_csrf.token}">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
						<button id="btn-borrar" type="button" class="btn btn-primary">Borrar
							equipo</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	<a href="${path}/index" class= "btn btn-default" >P�gina de inicio</a>
	
	
	<script type="text/javascript">
	
	
	</script>
	
	
	
	
	

</body>
</html>