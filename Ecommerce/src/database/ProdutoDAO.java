package database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ProdutoDAO {
	
	private Connection conexao;
	
	public ProdutoDAO(Connection con) {
		this.conexao = con;
	}
	
	//CRUD
	//create
	public void Create(Produto produto) throws SQLException {
		PreparedStatement stmt = conexao.prepareStatement("INSERT INTO produto (nome, resumo, descricao, categoria, preco, estoque, imagem) VALUES (?, ?, ?, ?, ?, ?, ?)");
		stmt.setString(1,  produto.getNome());
		stmt.setString(2, produto.getResumo());
		stmt.setString(3, produto.getDescricao());
		stmt.setString(4, produto.getCategoria());
		stmt.setFloat(5, produto.getPreco());
		stmt.setInt(6, produto.getEstoque());
		stmt.setString(7, produto.getImagem());

		stmt.execute();
		stmt.close();
	}
	
	//read
	public List<Produto> listarTodos() {
		List <Produto> produtos = new ArrayList<Produto>();
		try {
			PreparedStatement p = conexao.prepareStatement("SELECT * FROM produto");
			ResultSet rs = p.executeQuery();
			while(rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setNome(rs.getString("nome"));
				produto.setResumo(rs.getString("resumo"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setCategoria(rs.getString("categoria"));
				produto.setPreco(rs.getFloat("preco"));
				produto.setEstoque(rs.getInt("estoque"));
				produto.setImagem(rs.getString("imagem"));
				produtos.add(produto);
			}
			rs.close();
			p.close();
			return produtos;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return produtos;
	}
	
	//update
	public void Update(Produto produto) {
		try {
			PreparedStatement stmt = conexao.prepareStatement("UPDATE produto SET nome = ?, resumo = ?, descricao = ?, preco = ?, estoque = ?, categoria = ?, imagem = ? WHERE id = ? ");
			stmt.setString(1, produto.getNome());
			stmt.setString(2, produto.getResumo());
			stmt.setString(3, produto.getDescricao());
			stmt.setFloat(4, produto.getPreco());
			stmt.setInt(5, produto.getEstoque());
			stmt.setString(6, produto.getCategoria());
			stmt.setString(7, produto.getImagem());
			stmt.setInt(8, produto.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//delete
	public void Delete(Produto produto) {
		try {
			PreparedStatement stmt = conexao.prepareStatement("DELETE FROM produto WHERE id = ?");
			stmt.setInt(1, produto.getId());
			stmt.executeUpdate();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//Find
	public Produto FindByID(Produto produto){
		Produto produtoEncontrado = new Produto();
		try {
			PreparedStatement stmt = conexao.prepareStatement("SELECT * FROM ecommerce.produto WHERE id=?");
			stmt.setInt(1, produto.getId());
			ResultSet rs = stmt.executeQuery();
			rs.next();
				produtoEncontrado.setId(rs.getInt("id"));
				produtoEncontrado.setNome(rs.getString("nome"));
				produtoEncontrado.setResumo(rs.getString("resumo"));
				produtoEncontrado.setDescricao(rs.getString("descricao"));
				produtoEncontrado.setCategoria(rs.getString("categoria"));
				produtoEncontrado.setPreco(rs.getFloat("preco"));
				produtoEncontrado.setEstoque(rs.getInt("estoque"));
				produtoEncontrado.setImagem(rs.getString("imagem"));
			
			rs.close();
			stmt.close();
			return produtoEncontrado;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return produtoEncontrado;
	}
	
	//print
	public void Print() {
		System.out.println("- - - - - - - Produto - - - - - - -");
		List<Produto> produtos = this.listarTodos();
		for(int i = 0; i<produtos.size(); i++) {
			System.out.println("ID: " + produtos.get(i).getId());
			System.out.println("Nome: " + produtos.get(i).getNome());
			System.out.println("Resumo: " + produtos.get(i).getResumo());
			System.out.println("Descricao: " + produtos.get(i).getDescricao());
			System.out.println("Categoria: " + produtos.get(i).getCategoria());
			System.out.println("Preço: " + produtos.get(i).getPreco());
			System.out.println("Estoque: : " + produtos.get(i).getEstoque());
			System.out.println("Imagem: : " + produtos.get(i).getImagem());
			System.out.println("");
		}
	}
	
}
