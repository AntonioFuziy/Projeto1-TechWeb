<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ page import="java.util.*,br.edu.insper.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="assets/css/todo-list.css" rel="stylesheet"/>
	<title>Listagem</title>
</head>
<body>
	<div class="container">
		<h2>Criar Tarefa</h2>
		<form action="addTodo" method="post" class="add-form">
			<p>Nome:</p>
			<input type='text' name='nome' class="input-text">
			<p>Data:</p>
			<input type='date' name='data' value="<fmt:formatDate value="" pattern="dd/MM/yyyy"/>" class="input-text">
			<p>Tarefa:</p>
			<input type='text' name='tarefa' class="input-text">
			<p>Categoria:</p>
			<input type='text' name='categoria' class="input-text">
			<button class="buttons add-button" type="submit">Add</button>
		</form>
		<ul class="listagem">
			<c:forEach var="tarefa" items="${tarefas}">
				<li class="items">
					<p class="nome">${tarefa.nome}</p>
					<br>
					<p class="data"><fmt:formatDate value="${tarefa.data.time}" pattern="dd/MM/yyyy"/></p>
					<br>
					<p class="tarefa">${tarefa.tarefa}</p>
					<br>
					<p class="categoria">${tarefa.categoria}</p>
					<br>
					<form action="updateTodo" method="get">
						<input type="hidden" name="id" value="${tarefa.id}" />
						<input type="hidden" name="nome" value="${tarefa.nome}" />
						<input type="hidden" name="data" value="<fmt:formatDate value="${tarefa.data.time}" pattern="dd/MM/yyyy"/>" />
						<input type="hidden" name="tarefa" value="${tarefa.tarefa}" />
						<input type="hidden" name="categoria" value="${tarefa.categoria}" />
						<button class="buttons edit-button" name="tarefa" value="${tarefa.tarefa}" id="${tarefa.id}">Editar</button>
					</form>
					<form action="removeTodo" method="post">
						<input type="hidden" name="id" value="${tarefa.id}" />
						<button class="buttons delete-button" type="submit" name="id" value="${tarefa.id}" id="${tarefa.tarefa}">Deletar</button>
					</form>
				</li>
				
			</c:forEach>
		</ul>
	</div>
</body>
</html>