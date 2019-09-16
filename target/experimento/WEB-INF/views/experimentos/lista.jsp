<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<title>Projeto Financiamento de Experimentos</title>

<link rel="stylesheet" type="text/css"
	href="${contextPath}resources/css/bootstrap.min.css">
<script type="text/javascript"
	src="${contextPath}resources/js/bootstrap.min.css"></script>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor01" aria-controls="navbarColor01"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/" />'>Home </a></li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/ex/registro" />'>Registro</a></li>
					<li class="nav-item active"><a class="nav-link"
						href='<c:url value="/ex" />'>Consultar <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/relatorio" />'>Escolhidos
							(${relatorio.quantidade})</a></li>
				</ul>

			</div>
		</nav>
	</header>


	<div class="container">

		<p>
		<h2>Lista de Experimentos</h2>
		<p class="text-success">${sucesso }</p>
		<p class="text-danger">${falha}</p>

		<table class="table table-hover">
			<thead>
				<tr class="table-dark">
					<th width="5%"></th>
					<th width="20%">Nome</th>
					<th width="50%">Descrição</th>
					<th width="10%">Data de Início</th>
					<th width="10%">Duração (dias)</th>
					<th width="10%"></th>

					<th width="5%"></th>
				</tr>

			</thead>

			<tbody>
				<c:forEach items="${experimentos}" var="experimento">
					<tr
						onClick="${s:mvcUrl('EC#detalhe').arg(0,experimento.id).build()}">

						<td></td>
						<td>${experimento.nome}</td>


						<td>${experimento.descricao}</td>
						<td><fmt:formatDate pattern="dd/MM/yyyy"
								value="${experimento.dataInicio.time}" /></td>
						<td>${experimento.duracao}</td>
						<td><a
							href="${s:mvcUrl('EC#detalhe').arg(0,experimento.id).build()}">
								<button type="button" class="btn btn-outline-success">Detalhes</button>
						</a></td>
						<td></td>

					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
	</div>
	<!--  

		<table border="1">
			<tr>

				<td>Nome</td>
				<td>Descrição</td>
				<td>Duração</td>
			</tr>
			<c:forEach items="${experimentos}" var="experimento">
				<tr>

					<td><a
						href="${s:mvcUrl('EC#detalhe').arg(0,experimento.id).build()}">
							${experimento.nome} </a></td>


					<td>${experimento.descricao}</td>
					<td>${experimento.duracao}</td>
				</tr>
			</c:forEach>
		</table>
		-->
</body>
</html>