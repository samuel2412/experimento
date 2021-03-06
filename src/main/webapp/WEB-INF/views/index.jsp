<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<c:url value="/" var="contextPath" />


<link rel="stylesheet" type="text/css"
	href="${contextPath}resources/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>


<title>Projeto Financiamento de Experimentos</title>

</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
			role="navigation">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor01" aria-controls="navbarColor01"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>


			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href='<c:url value="/" />'>Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/ex/registro" />'>Registro</a></li>
					<li class="nav-item "><a class="nav-link"
						href='<c:url value="/ex" />'>Consultar </a></li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/relatorio" />'>Escolhidos
							(${relatorio.quantidade})</a></li>
				</ul>

			</div>
		</nav>
	</header>
	<p>
	<div class="jumbotron">
		<h1 class="display-3">Bem vindo!</h1>

		<p class="lead">Este é um projeto construído usando SpringMVC,
			Hibernate, Java, JPA, JSP, Bootstrap, etc..</p>
		<hr class="my-4">
		<p>Trata-se de uma aplicação que permite o cadastro de
			"experimentos" e o financiamento dos "experimentos" que o usuário se
			interessar.</p>
		<p>
			Atráves de uma conexão a uma api
			(http://book-payment.herokuapp.com/payment) fornecida pela Alura em
			seu <a
				href="https://cursos.alura.com.br/course/spring-mvc-1-criando-aplicacoes-web">curso
				de SpringMVC</a>, é simulado uma autorização de pagamento.
		</p>
		<p>Vale lembrar que todas as operações realizadas aqui são para
			propósitos acadêmicos.
		<p>
			O código fonte desta aplicação encontra-se <a
				href="https://github.com/samuel2412/experimento"> aqui</a>.
		<p>Autor: Samuel Alves de Almeida.
	</div>
</html>