<%@page import="java.util.List"%>
<%@page import="com.entities.Note"%>
<%@page import="com.factory.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="js_css.jsp"%>
<title>all saved notes</title>
</head>
<body>
	<div class="container">
		<div>
			<%@include file="Navbar.jsp"%>
			<br>
			<h2>
				<i>Getting all notes</i>
			</h2>
		</div>
		<div class="row"></div>
		<div class="col-12"></div>
		<%
		Session s = FactoryProvider.getSessionFactory().openSession();
		List<Note> list = s.createQuery("from Note").list();

		for (Note note : list) {
		%>
		<div class="card" >
			<img class="card-img-top m-10 " style="max-width: 35px" src="img/notepad.png" alt="Card image cap">
			<div class="card-body px-5">
			    <h5 class="card-text:right"><%=note.getDate() %></h5>
				<h5 class="card-title"><%=note.getTitle() %></h5>
				<p class="card-text"><%=note.getContent() %></p>
				<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">delete</a>
				<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-success">edit</a>
			</div>
		</div>
		<%
		}
		s.close();
		%>
	</div>
</body>
</html>