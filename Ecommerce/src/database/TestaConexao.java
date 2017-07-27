package database;
import java.sql.Connection;
import java.sql.SQLException;


public class TestaConexao {

	public static void main(String[] args) throws SQLException {
		Connection connection = new ConnectionFactory().getConnection();
		System.out.println("Conexao aberta");
		
		//Usuario
		/*
		Usuario usuario = new Usuario();
		UsuarioDAO usuarioDao = new UsuarioDAO(connection);
		usuario.setLogin("teste");
		usuario.setSenha("teste");
		usuario.setNome("teste");
		usuarioDao.Create(usuario);
		usuario.setId(2);
		usuario.setLogin("alteração");
		usuario.setSenha("alteração");
		usuario.setNome("alteração");
		usuarioDao.Update(usuario);
		usuarioDao.Delete(usuario);
		*/
		
		Usuario usuario = new Usuario();
		UsuarioDAO usuarioDao = new UsuarioDAO(connection);
		usuario.setId(1);
		usuario.setLogin("Danie");
		usuario.setSenha("Daniel");
		Usuario usuarioRetorno = usuarioDao.Access(usuario);
		System.out.println(usuarioRetorno);
		System.out.println(usuarioRetorno.getId());
		System.out.println(usuarioRetorno.getSenha());
		System.out.println(usuarioRetorno.getNome());
		
		/*
		Produto produto = new Produto();
		produto.setId(3);
		Produto produtoFound = new Produto();
		ProdutoDAO produtoDao = new ProdutoDAO(connection);
		produtoFound = produtoDao.FindByID(produto);
		System.out.println(produtoFound.getNome());
		*/
		
		//PedidoProdutoDAO
		
		/*
		PedidoProduto pedidoProduto = new PedidoProduto();
		pedidoProduto.setId_pedido(1);
		pedidoProduto.setId_produto(3);
		PedidoProdutoDAO pedidoProdutoDao = new PedidoProdutoDAO(connection);
		//pedidoProdutoDao.Create(pedidoProduto);
		pedidoProdutoDao.Print();
		*/
		
		/*
		Pedido pedido = new Pedido();
		pedido.setId(1);
		pedido.setId_usuario(3);
		PedidoDAO pedidoDao = new PedidoDAO(connection);
		//pedidoDao.Update(pedido);
		pedidoDao.Print();
		*/
		
		
		
		connection.close();
		System.out.println("Fim da execução");

	}
}
