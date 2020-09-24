<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ page import="java.util.*,br.edu.insper.*" %>

<!DOCTYPE html>
<html>
	<head>
		<link href="assets/css/edit-todo.css" rel="stylesheet"/>
		<title>Editar Tarefa</title>
	</head>
<body>
	<form action="updateTodo" method="post">
		<h2>Edite sua tarefa</h2>
		<p>Nome:</p>
		<input type='text' name='nome' value="${param.nome}" class="input-text">
		<p>Data:</p>
		<input type='date' name='data' value="${param.data}" class="input-text">
		<p>Tarefa:</p>
		<input type='text' name='tarefa' value="${param.tarefa}" class="input-text">
		<p>Categoria:</p>
		<input type='text' name='categoria' value="${param.categoria}" class="input-text">
		<input type="hidden" name="id" value="${param.id}" />
		<button class="buttons edit-button" type="submit" value="updateTodo">Editar</button>
	</form>
</body>
