<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

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
					<li class="nav-item "><a class="nav-link"
						href='<c:url value="/ex" />'>Consultar </a></li>
					<li class="nav-item active"><a class="nav-link"
						href='<c:url value="/relatorio" />'>Escolhidos
							(${relatorio.quantidade}) <span class="sr-only">(current)</span>
					</a></li>
				</ul>
				
			</div>
		</nav>
	</header>
	<p>
	<div class="container">
	<h2>Escolhidos</h2>
		<table class="table table-hover">
			<thead>
				<tr class="table-dark">
					<th width="20%">Nome</th>
					<th width="50%">Descrição</th>
					<th width="10%">Duração (dias)</th>

					<c:forEach items="${tipos}" var="tipoCusto" varStatus="status">
						<th width="10%">${tipoCusto}</th>
					</c:forEach>

					<th width="10%">Total</th>
					<th width="5%"></th>
				</tr>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${relatorio.itens}" var="item">
					<tr>
						<td class="item-title">${item.experimento.nome}</td>
						<td class="item-title">${item.experimento.descricao}</td>
						<td class="numeric-cell">${item.experimento.duracao}</td>

						<c:forEach items="${item.experimento.custos}" var="custo">
							<td class="numeric-cell">${custo.valor}</td>
						</c:forEach>

						<td class="numeric-cell">${relatorio.getTotal(item)}</td>

						<td class="remove-item">
							<form
								action="${s:mvcUrl('RC#remover').arg(0, item.experimento.id).arg(1, item.tipoCusto).build()}"
								method="POST">
								<input type="image"
									src="${contextPath}/resources/imagens/excluir.png"
									alt="Excluir" title="Excluir" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">

						<form action="${s:mvcUrl('FC#finalizar').build()}" method="post">
							<button type="submit" class="btn btn-outline-success">Financiar
								Escolhidos</button>
						</form>
					</td>
					<td class="numeric-cell">${relatorio.getTotal() }</td>

				</tr>
			</tfoot>
		</table>
	</div>


	<!-- 
	<section class="container middle">
		<h2 id="cart-title">Seu carrinho de compras</h2>


		<table id="cart-table">
			<colgroup>
				<col class="item-col" />
				<col class="item-price-col" />
				<col class="item-quantity-col" />
				<col class="line-price-col" />
				<col class="delete-col" />
			</colgroup>
			<thead>
				<tr>
					<th width="20%">Nome</th>
					<th width="50%">Descrição</th>
					<th width="10%">Duração (dias)</th>

					<c:forEach items="${tipos}" var="tipoCusto" varStatus="status">
						<th width="10%">${tipoCusto}</th>
					</c:forEach>

					<th width="10%">Total</th>
					<th width="5%"></th>
				</tr>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${relatorio.itens}" var="item">
					<tr>
						<td class="item-title">${item.experimento.nome}</td>
						<td class="item-title">${item.experimento.descricao}</td>
						<td class="numeric-cell">${item.experimento.duracao}</td>

						<c:forEach items="${item.experimento.custos}" var="custo">
							<td class="numeric-cell">${custo.valor}</td>
						</c:forEach>

						<td class="numeric-cell">${relatorio.getTotal(item)}</td>

						<td class="remove-item">
							<form
								action="${s:mvcUrl('RC#remover').arg(0, item.experimento.id).arg(1, item.tipoCusto).build()}"
								method="POST">
								<input type="image"
									src="${contextPath}/resources/imagens/excluir.png"
									alt="Excluir" title="Excluir" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<form action="${s:mvcUrl('FC#finalizar').build()}" method="post">
							<input type="submit" class="checkout" name="checkout"
								value=" Financiar Experimentos " />
						</form>
					<td class="numeric-cell">${relatorio.getTotal() }</td>
					<td></td>
				</tr>
			</tfoot>
		</table>
 -->
 
 <script type="text/javascript"
	src="${contextPath}resources/js/bootstrap.min.css"></script>
</body>
</html>