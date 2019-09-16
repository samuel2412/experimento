<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />


<title>Projeto Financiamento de Experimentos</title>


<c:url value="/" var="contextPath" />
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
					<li class="nav-item active"><a class="nav-link"
						href='<c:url value="/ex/registro" />'>Registro <span
							class="sr-only">(current)</span>
					</a></li>
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
	<div class="container">
		<h2>Cadastro</h2>

		<form:form action="${s:mvcUrl('EC#salvar').build() }" method="post"
			commandName="experimento" enctype="multipart/form-data">
			<fieldset>

				<div class="form-group">
					<label>Nome:</label>
					<form:errors path="nome" />
					<form:textarea class="form-control" path="nome" rows="1"></form:textarea>


					<label>Descrição:</label>
					<form:errors path="descricao" />
					<form:textarea class="form-control" path="descricao" rows="3"></form:textarea>


					<label>Data de Início:</label>
					<form:errors path="dataInicio" />
					<form:textarea class="form-control" path="dataInicio" rows="1"></form:textarea>


					<label>Duração (dias):</label>
					<form:errors path="duracao" />
					<form:textarea class="form-control" path="duracao" rows="1"></form:textarea>

					<label>Custos</label>
					<div class="conteiner">
						<c:forEach items="${tipos}" var="tipoCusto" varStatus="status">

							<label>${tipoCusto}</label>

							<form:textarea class="form-control"
								path="custos[${status.index}].valor" rows="1"></form:textarea>
							<input type="hidden" name="custos[${status.index}].tipo"
								value="${tipoCusto}">

						</c:forEach>
					</div>

				</div>

<!--  
				<div class="form-group">
					<label for="exampleInputFile">Anexo: </label> <input type="file"
						class="form-control-file" id="anexo" name="anexo"
						aria-describedby="fileHelp"> <small id="fileHelp"
						class="form-text text-muted">Você pode anexar um arquivo
						que julgar relevante.</small>
				</div>
-->

				<button type="submit" class="btn btn-outline-success">Salvar</button>
			</fieldset>
		</form:form>
	</div>

	<!--  <form action='<c:url value="/ex/salvar" />' method="POST">	 -->

	<!--  
	<form:form action="${s:mvcUrl('EC#salvar').build() }" method="post"
		commandName="experimento" enctype="multipart/form-data">
		<div>
			<label>Nome</label>
			<form:input path="nome" />
			<form:errors path="nome" />
		</div>
		<div>
			<label>Descrição</label>
			<form:textarea path="descricao" rows="10" cols="20" />
			<form:errors path="descricao" />
		</div>
		<div>
			<label>Data de Início</label>
			<form:input path="dataInicio" />
			<form:errors path="dataInicio" />
		</div>
		<div>
			<label>Duração (dias)</label>
			<form:input path="duracao" />
			<form:errors path="duracao" />
		</div>
		<label><b>Custos</b></label>
		<c:forEach items="${tipos}" var="tipoCusto" varStatus="status">
			<div>
				<label>${tipoCusto}</label> <input type="text"
					name="custos[${status.index}].valor"> <input type="hidden"
					name="custos[${status.index}].tipo" value="${tipoCusto}">
			</div>
		</c:forEach>

		<div>
			<label>Anexos:</label> <input name="anexo" type="file" />
		</div>

		<button type="submit">Cadastrar</button>
	</form:form>
	-->
	<script type="text/javascript"
	src="${contextPath}resources/js/bootstrap.min.css"></script>
</body>
</html>