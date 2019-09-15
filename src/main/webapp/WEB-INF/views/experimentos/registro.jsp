<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Livros de Java, Android, iPhone, PHP, Ruby e muito mais -
	Casa do Código</title>
</head>
<body>

	<!--  <form action='<c:url value="/ex/salvar" />' method="POST">	 -->
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
</body>
</html>