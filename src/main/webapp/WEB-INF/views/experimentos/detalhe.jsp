<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<c:url value="/" var="contextPath" />
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />


<title>Projeto Financiamento de Experimentos</title>


<link rel="stylesheet" type="text/css"
	href="${contextPath}resources/css/bootstrap.min.css">

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
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/ex" />'>Consultar </a></li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/relatorio" />'>Escolhidos
							(${relatorio.quantidade})</a></li>
				</ul>
				
			</div>
		</nav>
	</header>
	<p>
	
	
	<div class="card mb-3">
		<form action="<c:url value="/relatorio/add" />" method="post"
			class="container">
			<input type="hidden" value="${experimento.id} " name="experimentoId">
			<h3 class="card-header">${experimento.nome }</h3>
			<div class="card-body">
				<h5 class="card-title"></h5>
				<h6 class="card-subtitle text-muted"></h6>
			</div>
			<img style="height: 200px; width: 100%; display: block;"
				src="resources/imagens/projeto.svg" alt="Card image">
				
				src="public/img/PennUnitedWebsite.png"
			<div class="card-body">
				<p class="card-text">Descricão: ${experimento.descricao }</p>
			</div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><b>Duraçao:</b>
					${experimento.duracao } dias</li>
				<c:forEach items="${experimento.custos }" var="custo">
					<li class="list-group-item"><input type="hidden"
						name="tipoCusto" id="tipo" value="${custo.tipo }"
						checked="checked" /> <label class="variant-label"><b>Custo
								com ${custo.tipo }</b> em reais: ${custo.valor }</label></li>
				</c:forEach>
				<li class="list-group-item"><b>Data de início: <fmt:formatDate
							pattern="dd/MM/yyyy" value="${experimento.dataInicio.time}" />
				</b>
				<li class="list-group-item">
					<div class="float-right">
						<a href="<c:url value="/ex" />">
							<button type="button" class="btn btn-outline-danger">Voltar</button>
						</a>
						<button type="submit" class="btn btn-outline-success">Adicionar
							aos Escolhidos</button>
					</div>

				</li>
			</ul>

			<div class="card-footer text-muted">
				<br>
			</div>
		</form>
	</div>
	<script type="text/javascript"
	src="${contextPath}resources/js/bootstrap.min.css"></script>
</body>
</html>