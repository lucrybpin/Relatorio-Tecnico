<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*,
    		database.*,
    		java.sql.Connection,
    		java.sql.SQLException"%>

<%
	//Abre Conexão
	Connection connection = new ConnectionFactory().getConnection();
	session.removeAttribute("login");
	session.removeAttribute("usuario");
	System.out.println("teste");
	response.sendRedirect("http://localhost:9090/Ecommerce/#");
%>
