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
		<title>Verti by HTML5 UP</title>
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
	ProdutoDAO produtoDao = new ProdutoDAO(connection);
	
	//Pega lista de produtos 
	List <Produto> produtos = new ArrayList<Produto>();
	produtos = produtoDao.listarTodos();
	String usuario_logado = "";
	
	int searchingId = Integer.parseInt(request.getParameter("id_produto"));  
	Produto produto = new Produto();
	produto.setId(searchingId);
	produto = produtoDao.FindByID(produto);
	
	if(session.getAttribute("usuario") != null) {
		System.out.println(session.getAttribute("usuario"));
		usuario_logado = (String)session.getAttribute("usuario");
	}
	%>
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a href="http://localhost:9090/Ecommerce/#">eCommerce</a></h1>
								<span><%= usuario_logado %></span>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a href="http://localhost:9090/Ecommerce/#">Home</a></li>
									<%	//Não logado
										if(usuario_logado == "") {
										out.println("<li><a href=\"http://localhost:9090/Ecommerce/cadastrar_usuario.jsp\">Cadastrar</a></li>");
										out.println("<li><a href=\"http://localhost:9090/Ecommerce/acessar_usuario.jsp\">Acessar</a></li>");
										} else {
										out.println("<li><a href=\"http://localhost:9090/Ecommerce/action_deslogar.jsp\">Sair</a></li>");
										}
									%>
								</ul>
							</nav>
					</header>
				</div>

			<!-- Features -->
				<div id="features-wrapper">
					<div class="container">
						<div class="row">
						</div>
					</div>
				</div>

			<!-- Main -->
				<div id="main-wrapper">
					<div class="container">
						<div class="row 200%">
							<div class="4u 12u(medium)">

								<!-- Sidebar -->
									<div id="sidebar">
										<section class="widget thumbnails">
											<div class="grid">
												<div class="row 50%">
													<div class="12u"><a href="#" class="image fit"><img src="images/<%out.println(produtos.get(0).getImagem());%>.jpg" alt="" /></a></div>
												</div>
												<div class="row 50%">
													<div class="6u"><p>Estoque</p></div>
													<div class="6u"><% out.println(produto.getEstoque()); %></div>
												</div>
											</div>
										</section>
									</div>

							</div>
							<div class="8u 12u(medium) important(medium)">

								<!-- Content -->
									<div id="content">
										<section class="last">
											<h2><% out.println(produto.getNome()); %></h2>
											<h3>[ <% out.println(produto.getCategoria()); %> ] </h3>
											<p><%  out.println(produto.getDescricao()); %></p>
											<a href="
												<% if(usuario_logado == "")
													out.println("http://localhost:9090/Ecommerce/acessar_usuario.jsp");
												else 
													out.println("http://localhost:9090/Ecommerce/action_comprar_produto.jsp?id_produto="+produto.getId());
											%>" class="button icon fa-arrow-circle-right" style="float: right;">R$<% out.println(produto.getPreco()); %></a>
										</section>
									</div>

							</div>
						</div>
					</div>
				</div>

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
			
			<%
	//Pega Produto
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

		<!-- Scripts -->

			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	
	</body>
	
</html>