<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*,
    		database.*,
    		java.sql.Connection,
    		java.sql.SQLException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-commerce: Index</title>
</head>
<body>
<%
	Connection connection = new ConnectionFactory().getConnection();
	Produto produto = new Produto();
	produto.setId(6);
	produto.setNome("abcd");
	produto.setResumo("arroz");
	produto.setDescricao("arroz");
	produto.setPreco(0.00f);
	produto.setEstoque(0);
	produto.setCategoria("arroz");
	produto.setImagem("arroz");
	ProdutoDAO produtoDao = new ProdutoDAO(connection);
	//produtoDao.Create(produto);
	//produtoDao.Update(produto);
	//produtoDao.Delete(produto);
	
	List <Produto> produtos = new ArrayList<Produto>();
	produtos = produtoDao.listarTodos();
	
	out.println("<div style=\"border:1px solid black\">");
	System.out.println("funcionou");
	out.println("<b>"+produtos.get(0).getNome() +"</b><br />");
	out.println(produtos.get(0).getResumo() 	+ "<br />");
	out.println(produtos.get(0).getDescricao()	+ "<br />");
	out.println(produtos.get(0).getPreco() 		+ "<br />");
	out.println(produtos.get(0).getEstoque() 	+ "<br />");
	out.println(produtos.get(0).getCategoria() 	+ "<br />");
	//WebContent\images\nome_imagem.jpg = src="images\nome_imagem.jpg"
	out.println("<img src=\"images\\" +produtos.get(0).getImagem()+".jpg \" width=\"100px\" height=\"100px\" >");
	out.println("</div>");
%>
</body>
</html>