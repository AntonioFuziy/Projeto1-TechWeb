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
			<select name="categoria" id="select">
			  <option value="Faculdade">Faculdade</option>
			  <option value="Pessoal">Pessoal</option>
			</select>
			<input type="hidden" name="categoria" value=categoria.value />
			<button class="buttons add-button" type="submit">Add</button>
		</form>
		<ul class="listagem">
			<h3 class="categoria-title">Pessoal</h3>
			<c:forEach var="pessoal" items="${pessoal}">
				<li class="items">
					<p class="nome">${pessoal.nome}</p>
					<br>
					<p class="data"><fmt:formatDate value="${pessoal.data.time}" pattern="dd/MM/yyyy"/></p>
					<br>
					<p class="tarefa">${pessoal.tarefa}</p>
					<br>
					<p class="categoria">${pessoal.categoria}</p>
					<br>
					<form action="updateTodo" method="get">
						<input type="hidden" name="id" value="${pessoal.id}" />
						<input type="hidden" name="nome" value="${pessoal.nome}" />
						<input type="hidden" name="data" value="<fmt:formatDate value="${pessoal.data.time}" pattern="dd/MM/yyyy"/>" />
						<input type="hidden" name="tarefa" value="${pessoal.tarefa}" />
						<input type="hidden" name="categoria" value="${tarefa.categoria}" />
						<button class="buttons edit-button" name="tarefa" value="${pessoal.tarefa}" id="${pessoal.id}">Editar</button>
					</form>
					<form action="removeTodo" method="post">
						<input type="hidden" name="id" value="${pessoal.id}" />
						<button class="buttons delete-button" type="submit" name="id" value="${pessoal.id}" id="${pessoal.tarefa}">Deletar</button>
					</form>
				</li>
				
			</c:forEach>
		</ul>
		<ul class="listagem">
			<h3 class="categoria-title">Faculdade</h3>
			<c:forEach var="faculdade" items="${faculdade}">
				<li class="items">
					<p class="nome">${faculdade.nome}</p>
					<br>
					<p class="data"><fmt:formatDate value="${faculdade.data.time}" pattern="dd/MM/yyyy"/></p>
					<br>
					<p class="tarefa">${faculdade.tarefa}</p>
					<br>
					<p class="categoria">${faculdade.categoria}</p>
					<br>
					<form action="updateTodo" method="get">
						<input type="hidden" name="id" value="${faculdade.id}" />
						<input type="hidden" name="nome" value="${faculdade.nome}" />
						<input type="hidden" name="data" value="<fmt:formatDate value="${faculdade.data.time}" pattern="dd/MM/yyyy"/>" />
						<input type="hidden" name="tarefa" value="${faculdade.tarefa}" />
						<input type="hidden" name="categoria" value="${faculdade.categoria}" />
						<button class="buttons edit-button" name="tarefa" value="${faculdade.tarefa}" id="${faculdade.id}">Editar</button>
					</form>
					<form action="removeTodo" method="post">
						<input type="hidden" name="id" value="${faculdade.id}" />
						<button class="buttons delete-button" type="submit" name="id" value="${faculdade.id}" id="${faculdade.tarefa}">Deletar</button>
					</form>
				</li>
				
			</c:forEach>
		</ul>
	</div>
</body>
</html>