package br.edu.insper;

import java.util.Calendar;

public class Tarefas {
	private Integer id;
	private String tarefa;
	private Calendar data;
	private String nome;
	private String categoria;
	
	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getTarefa() {
		return this.tarefa;
	}
	
	public void setTarefa(String tarefa) {
		this.tarefa = tarefa;
	}
	
	public String getNome() {
		return this.nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public Calendar getData() {
		return this.data;
	}
	
	public void setData(Calendar data) {
		this.data = data;
	}
	
	public String getCategoria() {
		return this.categoria;
	}
	
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
}
