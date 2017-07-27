package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO {
	private Connection conexao;
	
	public PedidoDAO(Connection con) {
		this.conexao = con;
	}
	
	//CRUD
	//create
	public void Create(Pedido pedido) {
		try {
			PreparedStatement stmt = conexao.prepareStatement("INSERT INTO pedido (id_usuario) VALUES (?)", Statement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, pedido.getId_usuario());
			ResultSet idGerado = stmt.getGeneratedKeys();
			if(idGerado.next()) {
				pedido.setId(idGerado.getInt(1));
			}
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//read
	public List <Pedido> ListarTodos() {
		List <Pedido> pedidos = new ArrayList<Pedido>();
		try {
			PreparedStatement stmt = conexao.prepareStatement("SELECT * FROM pedido");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Pedido pedido = new Pedido();
				pedido.setId(rs.getInt("id"));
				pedido.setId_usuario(rs.getInt("id_usuario"));
				pedidos.add(pedido);
			}
			rs.close();
			stmt.close();
			return pedidos;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pedidos;
	}
	
	//update
	public void Update(Pedido pedido) {
		try {
			PreparedStatement stmt = conexao.prepareStatement("UPDATE pedido SET id_usuario = ? WHERE id = ? ");
			stmt.setInt(1, pedido.getId_usuario());
			stmt.setInt(2, pedido.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	//delete
	public void Delete(Pedido pedido) {
		try {
			PreparedStatement stmt = conexao.prepareStatement("DELETE FROM produto WHERE id = ?");
			stmt.setInt(1, pedido.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//print
	public void Print() {
		System.out.println("- - - - - - - Pedidos - - - - - - -");
		List<Pedido> pedidos = this.ListarTodos();
		for(int i = 0; i<pedidos.size(); i++) {
			System.out.println("ID: " + pedidos.get(i).getId());
			System.out.println("id_usuario: " + pedidos.get(i).getId_usuario());
			System.out.println("");
		}
	}
}
