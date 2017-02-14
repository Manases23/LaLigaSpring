<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${titulo}</title>
<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


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

<div class= "text-center">
			<h1>${equipo.nombre}</h1>
			<img alt="" src="${equipo.imagen}" width="150px">
			<h4>Juega en el estadio ${equipo.estadio}</h4>
			<h4>De la ${equipo.division} división de ${equipo.federacion.pais}.</h4>
			<h4>Cuenta con un presupuesto de ${equipo.presupuesto} euros.</h4>
			<br><br>
			
			<h2>Listado de jugadores del ${equipo.nombre}:</h2>
			
			<br>
			
			<table class="table table-hover table-condensed table-striped table-bordered text-center">
		<thead>
			<tr>
				<td style="width: 20%">#</td>
				<td style="width: 20%">Nombre</td>
				<td style="width: 20%">Edad</td>
				<td style="width: 20%">Goles</td>
				<td style="width: 20%">Posicion</td>
			</tr>
		</thead>
					<tbody>
			<c:forEach items="${equipo.jugadores}" var="jugador">
				<tr>	
					<td>${jugador.id}</td>
					<td><a href="<c:url value="/jugadores/detalle/${jugador.id}" />">${jugador.nombre}</td>
					<td>${jugador.edad}</td>
					<td>${jugador.goles}</td>
					<td>${jugador.posicion}</td>
				</tr>
			</c:forEach>
		</tbody>
		
	</table>

</div>

		<a href="${path}/index" class= "btn btn-default" >Página de inicio</a>








</body>