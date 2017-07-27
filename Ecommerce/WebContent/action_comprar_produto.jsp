<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*,
    		database.*,
    		java.sql.Connection,
    		java.sql.SQLException"%>

<%
	//Abre Conexão
	Connection connection = new ConnectionFactory().getConnection();
	

	//Cria o pedido
	/*
	Pedido pedido = new Pedido();
	pedido.setId_usuario((Integer)session.getAttribute("id")); //A partir do id do usuário
	PedidoDAO pedidoDao = new PedidoDAO(connection);
	pedidoDao.Create(pedido);
	System.out.println("ID Pedido criado: " + pedido.getId());
	*/
	
	//Identifica o produto a ser adicionado
	int searchingId = Integer.parseInt(request.getParameter("id_produto"));  
	Produto produto = new Produto();
	produto.setId(searchingId);
	ProdutoDAO produtoDao = new ProdutoDAO(connection);
	produto = produtoDao.FindByID(produto);
	produto.setEstoque(produto.getEstoque()-1);
	produtoDao.Update(produto);
	/*
	//Vincula o produto ao pedido
	PedidoProduto pedidoProduto = new PedidoProduto();
	pedidoProduto.set
	PedidoProdutoDAO pedidoProdutoDao = new PedidoProdutoDAO(connection);
	pedidoProdutoDao.Create(pedidoProduto);

		*/
	
	response.sendRedirect("http://localhost:9090/Ecommerce/#");
	
%>
