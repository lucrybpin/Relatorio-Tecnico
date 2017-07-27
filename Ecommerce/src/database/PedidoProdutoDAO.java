package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PedidoProdutoDAO {

	private Connection conexao;
	
	public PedidoProdutoDAO(Connection con) {
		this.conexao = con;
	}
	
	//CRUD
	//create
	public void Create(PedidoProduto pedidoProduto) {
		try {
			PreparedStatement stmt = conexao.prepareStatement("INSERT INTO pedido_produto (id_pedido, id_produto) VALUES (?, ?)");
			stmt.setInt(1,  pedidoProduto.getId_pedido());
			stmt.setInt(2,  pedidoProduto.getId_produto());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//read
	public List <PedidoProduto> ListarTodos() {
		List <PedidoProduto> pedidoProdutos = new ArrayList<PedidoProduto>();
		try {
			PreparedStatement stmt = conexao.prepareStatement("SELECT * FROM pedido_produto");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				PedidoProduto pedidoProduto = new PedidoProduto();
				pedidoProduto.setId_pedido(rs.getInt("id_pedido"));
				pedidoProduto.setId_produto(rs.getInt("id_produto"));
				pedidoProdutos.add(pedidoProduto);
			}
			rs.close();
			stmt.close();
			return pedidoProdutos;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pedidoProdutos;
	}

	//update
	public void Update(PedidoProduto pedidoProduto) {
		try {
			PreparedStatement stmt = conexao.prepareStatement("UPDATE pedido_produto SET id_produto = ? WHERE id_pedido = ? ");
			stmt.setInt(1, pedidoProduto.getId_produto());
			stmt.setInt(2, pedidoProduto.getId_pedido());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	//delete
	public void Delete(PedidoProduto pedidoProduto) {
		try {
			PreparedStatement stmt = conexao.prepareStatement("DELETE FROM pedido_produto WHERE id_pedido = ?");
			stmt.setInt(1, pedidoProduto.getId_pedido());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//print
	public void Print() {
		System.out.println("- - - - - - - Pedido x Produto - - - - - - -");
		List<PedidoProduto> pedidos = this.ListarTodos();
		for(int i = 0; i<pedidos.size(); i++) {
			System.out.println("id_pedido: " + pedidos.get(i).getId_pedido());
			System.out.println("id_produto: " + pedidos.get(i).getId_produto());
			System.out.println("");
		}
	}
}
