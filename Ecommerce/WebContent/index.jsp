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
	ProdutoDAO produtoDao = new ProdutoDAO(connection);
	String usuario_logado = "";
			
	//Pega lista de produtos 
	List <Produto> produtos = new ArrayList<Produto>();
	produtos = produtoDao.listarTodos();
	
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
									<li class="current"><a href="http://localhost:9090/Ecommerce/#">Home</a></li>
									<%	
										//Não logado
										if(usuario_logado == "") {
											out.println("<li><a href=\"http://localhost:9090/Ecommerce/cadastrar_usuario.jsp\">Cadastrar</a></li>");
											out.println("<li><a href=\"http://localhost:9090/Ecommerce/acessar_usuario.jsp\">Acessar</a></li>");
										} else {
											out.println("<li><a href=\"http://localhost:9090/Ecommerce/action_deslogar.jsp\">Sair</a></li>");
											if((Integer)session.getAttribute("id") == 1) {
												out.println("<li><a href=\"http://localhost:9090/Ecommerce/cadastrar_produto.jsp\">Cadastrar Produto</a></li>");
											}
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
						
						<%
						for(int i=0; i<produtos.size(); i++) {
							out.println("<div class=\"4u 12u(medium)\" style=\"height:500px\">");
								out.println("<section class=\"box feature\">");
									if(usuario_logado == ""){
										out.println("<a href=\"http://localhost:9090/Ecommerce/ver_produto.jsp?id_produto="+ produtos.get(i).getId()+"\" class=\"image featured\"><img src=\"images/"+produtos.get(i).getImagem()+".jpg\" alt=\"\" width=\"384px\" height=\"304px\"></a>");
									}else {
											
											if((Integer)session.getAttribute("id") == 1){
												out.println("<a href=\"http://localhost:9090/Ecommerce/editar_produto.jsp?id_produto="+ produtos.get(i).getId()+"\" class=\"image featured\"><img src=\"images/"+produtos.get(i).getImagem()+".jpg\" alt=\"\" width=\"384px\" height=\"304px\"></a>");
											}else {
												out.println("<a href=\"http://localhost:9090/Ecommerce/ver_produto.jsp?id_produto="+ produtos.get(i).getId()+"\" class=\"image featured\"><img src=\"images/"+produtos.get(i).getImagem()+".jpg\" alt=\"\" width=\"384px\" height=\"304px\"></a>");	
											}
									}
									out.println("<div class=\"inner\">");
										out.println("<header>");
											out.println("<h2>"+produtos.get(i).getNome()+"</h2>");
											out.println("<p style=\"float: right;\">R$ "+ produtos.get(i).getPreco() +"</p>");
										out.println("</header>");
									out.println("</div>");
								out.println("</section>");
							out.println("</div>");
						}
						%>
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
			
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
	
	</body>
	
</html>