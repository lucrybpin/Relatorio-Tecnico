<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*,
    		database.*,
    		java.sql.Connection,
    		java.sql.SQLException"%>

<!DOCTYPE HTML>
<!--
	Verti by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>E-Commerce</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body class="homepage">
	<%
	//Abre Conexão
	Connection connection = new ConnectionFactory().getConnection();
			
	//Captura parâmetros
	String nome = request.getParameter("nome");  
	String resumo = request.getParameter("resumo");
	String descricao = request.getParameter("descricao");
	String categoria = request.getParameter("categoria");
	Float preco = (request.getParameter("preco") != null) ? Float.parseFloat(request.getParameter("preco")) : null;
	Integer estoque = (request.getParameter("estoque") != null) ? Integer.parseInt(request.getParameter("estoque")) : null;
	String imagem = request.getParameter("imagem");
	
	//Realiza cadastro
	if (nome != null && resumo != null && descricao != null &&
		categoria != null && preco != null && estoque != null && imagem != null) {
		Produto produto = new Produto();
		ProdutoDAO produtoDao = new ProdutoDAO(connection);
		produto.setNome(nome);
		produto.setResumo(resumo);
		produto.setDescricao(descricao);
		produto.setCategoria(categoria);
		produto.setPreco(preco);
		produto.setEstoque(estoque);
		produto.setImagem(imagem);
		produtoDao.Create(produto);
		response.sendRedirect("http://localhost:9090/Ecommerce/#");
	}	
	%>
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a href="http://localhost:9090/Ecommerce/#">eCommerce</a></h1>
								<span>by HTML5 UP</span>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li class="current"><a href="http://localhost:9090/Ecommerce/#">Home</a></li>
									<%	
									
										//Não logado
										//if(usuario_logado == "") {
										//	out.println("<li><a href=\"http://localhost:9090/Ecommerce/cadastrar_usuario.jsp\">Cadastrar</a></li>");
										//	out.println("<li><a href=\"http://localhost:9090/Ecommerce/acessar_usuario.jsp\">Acessar</a></li>");
										//} else {
										//	out.println("<li><a href=\"http://localhost:9090/Ecommerce/deslogar.jsp\">Sair</a></li>");
										//	if((Integer)session.getAttribute("id") == 1) {
										//		out.println("<li><a href=\"http://localhost:9090/Ecommerce/cadastrar_produto.jsp\">Cadastrar Produto</a></li>");
										//	}
										//}
									%>
									
								</ul>
							</nav>

					</header>
				</div>

			<!-- Features -->
			<form action="http://localhost:9090/Ecommerce/cadastrar_produto.jsp" method="get">
				<div class="row">
					<div class="12u">
						<div id="copyright">
							<ul class="menu">
								<li>Nome</li><li><input type="text" name="nome"></input></li>
							</ul>
							<ul class="menu">
								<li>Resumo</li><li><input type="text" name="resumo"></input></li>
							</ul>
							<ul class="menu">
								<li>Descricao</li><li><input type="text" name="descricao"></input></li>
							</ul>
							<ul class="menu">
								<li>Categoria</li><li><input type="text" name="categoria"></input></li>
							</ul>
							<ul class="menu">
								<li>Preço</li><li><input type="number" name="preco"></input></li>
							</ul>
							<ul class="menu">
								<li>Estoque</li><li><input type="text" name="estoque"></input></li>
							</ul>
							<ul class="menu">
								<li>Imagem</li><li><input type="text" name="imagem"></input></li>
							</ul>
							<ul class="menu">
								<li><input type="submit" value="Acessar"></input></li>
							</ul>
						</div>
					</div>
				</div>
			</form>

			<!-- Footer -->
				<div id="footer-wrapper">
					<footer id="footer" class="container">
						<div class="row">
							<div class="3u 6u(medium) 12u$(small)">

								<!-- Links -->
									<section class="widget links">
										<h3>Random Stuff</h3>
										<ul class="style2">
											<li><a href="#">Etiam feugiat condimentum</a></li>
											<li><a href="#">Aliquam imperdiet suscipit odio</a></li>
											<li><a href="#">Sed porttitor cras in erat nec</a></li>
											<li><a href="#">Felis varius pellentesque potenti</a></li>
											<li><a href="#">Nullam scelerisque blandit leo</a></li>
										</ul>
									</section>

							</div>
							<div class="3u 6u$(medium) 12u$(small)">

								<!-- Links -->
									<section class="widget links">
										<h3>Random Stuff</h3>
										<ul class="style2">
											<li><a href="#">Etiam feugiat condimentum</a></li>
											<li><a href="#">Aliquam imperdiet suscipit odio</a></li>
											<li><a href="#">Sed porttitor cras in erat nec</a></li>
											<li><a href="#">Felis varius pellentesque potenti</a></li>
											<li><a href="#">Nullam scelerisque blandit leo</a></li>
										</ul>
									</section>

							</div>
							<div class="3u 6u(medium) 12u$(small)">

								<!-- Links -->
									<section class="widget links">
										<h3>Random Stuff</h3>
										<ul class="style2">
											<li><a href="#">Etiam feugiat condimentum</a></li>
											<li><a href="#">Aliquam imperdiet suscipit odio</a></li>
											<li><a href="#">Sed porttitor cras in erat nec</a></li>
											<li><a href="#">Felis varius pellentesque potenti</a></li>
											<li><a href="#">Nullam scelerisque blandit leo</a></li>
										</ul>
									</section>

							</div>
							<div class="3u 6u$(medium) 12u$(small)">

								<!-- Contact -->
									<section class="widget contact last">
										<h3>Contact Us</h3>
										<ul>
											<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
											<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
											<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
											<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
											<li><a href="#" class="icon fa-pinterest"><span class="label">Pinterest</span></a></li>
										</ul>
										<p>1234 Fictional Road<br />
										Nashville, TN 00000<br />
										(800) 555-0000</p>
									</section>

							</div>
						</div>
						<div class="row">
							<div class="12u">
								<div id="copyright">
									<ul class="menu">
										<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
									</ul>
								</div>
							</div>
						</div>
					</footer>
				</div>

			</div>
		<!-- Scripts -->

			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	
	</body>
	
</html>