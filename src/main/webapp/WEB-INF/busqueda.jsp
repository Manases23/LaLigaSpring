<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

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
<br><br><br>
<header>
<div class="text-center">
<img alt=""  width="200" src="http://files.laliga.es/seccion_logos/laliga-v-600x600.png">
</div>
</header>
<br><br>
<div class = text-center>

<h1>Buscador de LaLiga</h1>
<br>
<a href="${path}/index" class= "btn btn-default" >Pagina de inicio</a>
<br><br>
	<form method="post">
		<input type="text" name ="busqueda">
		
		<input id="csrf" name="_csrf" type="hidden" value="${_csrf.token}">
		
		<input type="submit" name="buscar" id="mostrarformulario" value="buscar">
	
	</form>
</div>
<br><br><br>


<c:if test="${not empty tituloEqui}">

<div class = "text-center">
<h1> ${tituloFed} </h1>
	<table
		class="table table-hover table-condensed table-striped table-bordered">
		<thead>
			<tr>
				<td style="width: 10%">#</td>
				<td style="width: 10%">Nombre</td>
				<td style="width: 10%">País</td>
				<td style="width: 10%">Logo</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${federaciones}" var="federacion">
				<tr data-id="${federacion.id}">
					<td>${federacion.id}</td>
					<td>${federacion.nombre}</td>
					<td>${federacion.pais}</td>
					<td> <img alt="" src="${federacion.imagen}" width="50px"> </td>				
				</tr>
			</c:forEach>
		</tbody>
</div>
</c:if>


<c:if test="${not empty tituloEqui}">
<div class = text-center>
		
	<table
		class="table table-hover table-condensed table-striped table-bordered">
		<h1> ${tituloEqui} </h1>
		<thead>
			<tr>
				<td style="width: 10%">#</td>
				<td style="width: 10%">Nombre</td>
				<td style="width: 10%">Escudo</td>
				<td style="width: 10%">Estadio</td>
				<td style="width: 10%">Presupuesto</td>
				<td style="width: 10%">Division</td>
				<td style="width: 10%"><a href="<c:url value="/federaciones" />">Federacion</a></td>
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
				</tr>
			</c:forEach>
		</tbody>
</div>
</c:if>





<c:if test="${not empty tituloJug}">
			
<div class="text-center">
	<table
		class="table table-hover table-condensed table-striped table-bordered">
		<h1> ${tituloJug} </h1>
		<thead>
			<tr>
				<td style="width: 10%">#</td>
				<td style="width: 10%">Nombre</td>
				<td style="width: 10%">Foto</td>
				<td style="width: 10%">Edad</td>
				<td style="width: 10%">Goles</td>
				<td style="width: 10%"><a href="<c:url value="/equipos" />">Equipo</a></td>
				<td style="width: 10%">Posicion</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${jugadores}" var="jugador">
				<tr data-id="${jugador.id}">
					<td>${jugador.id}</td>
					<td><a href="<c:url value="/jugadores/detalle/${jugador.id}" />">${jugador.nombre}</a></td>
					<td> <img alt="" src="${jugador.foto}" width="50px"></td>
					<td>${jugador.edad}</td>
					<td>${jugador.goles}</td>
					<td>${jugador.equipo.nombre}</td>
					<td>${jugador.posicion}</td>	
				</tr>
			</c:forEach>
		</tbody>

</div>
</c:if>


		


</body>

</html>



