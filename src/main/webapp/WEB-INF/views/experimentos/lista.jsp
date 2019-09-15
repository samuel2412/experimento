<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Livros de Java, Android, iPhone, PHP, Ruby e muito mais -
	Casa do Código</title>
</head>
<body>
	<h1>Lista de Experimentos</h1>
	<b>
		<div>${status}</div>
	</b>
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
</body>
</html>