package br.edu.insper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class DAO {
	private Connection connection = null;
	
	public DAO() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projeto1?serverTimezone=UTC",
				"antoniofuziy", "12345");
	}
	
	public List<Tarefas> getTarefas() throws SQLException {
		List<Tarefas> tarefas = new ArrayList<Tarefas>();
		
		PreparedStatement stmt = connection.prepareStatement("SELECT * FROM TarefasB ORDER BY data ASC");
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
			Tarefas tarefa = new Tarefas();
			tarefa.setId(rs.getInt("id"));
			tarefa.setNome(rs.getNString("nome"));
			Calendar data = Calendar.getInstance();
			data.setTime(rs.getDate("data"));
			tarefa.setData(data);
			tarefa.setTarefa(rs.getNString("tarefa"));
			tarefa.setCategoria(rs.getNString("categoria"));
			tarefas.add(tarefa);
		}
		rs.close();
		stmt.close();
		
		return tarefas;
	}
	
	public void addTodo(Tarefas tarefa) throws SQLException{
		String sql = "INSERT INTO TarefasB (nome, data, tarefa, categoria) VALUES (?, ?, ?, ?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, tarefa.getNome());
		stmt.setDate(2, new java.sql.Date(tarefa.getData().getTimeInMillis()));
		stmt.setString(3, tarefa.getTarefa());
		stmt.setString(4, tarefa.getCategoria());
		stmt.execute();
		stmt.close();
	}
	
	public void updateTodo(Tarefas tarefa) throws SQLException{
		String sql = "UPDATE TarefasB SET nome=?, data=?, tarefa=?, categoria=?  WHERE id=?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, tarefa.getNome());
		stmt.setDate(2, new java.sql.Date(tarefa.getData().getTimeInMillis()));
		stmt.setString(3, tarefa.getTarefa());
		stmt.setString(4, tarefa.getCategoria());
		stmt.setInt(5, tarefa.getId());
		stmt.execute();
		stmt.close();
	}
	
	public void removeTodo(Integer id) throws SQLException{
		String sql = "DELETE FROM TarefasB WHERE id=?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setInt(1, id);
		stmt.execute();
		stmt.close();
	}
	
	public void login() {
		
	}
	
	public void close() throws SQLException{
		connection.close();
	}
}
