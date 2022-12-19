<%@page import="com.factory.FactoryProvider"%>
<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="js_css.jsp"%>
<title>edit note</title>
</head>
<body>
<div class="container">
		<div>
			<%@include file="Navbar.jsp"%>
		</div>
	</div>
	<%
	int id=Integer.parseInt(request.getParameter("note_id"));
	Session s=FactoryProvider.getSessionFactory().openSession();
	s.beginTransaction();
	
	Note note=s.get(Note.class, id);
	s.close();
	%>
	<div class="container">
	<h3>edit note details</h3>
		<form action="UpdateServlet" method="post">
		<input value="<%=note.getId() %>" name="note_id" type="hidden">
			<div class="form-group">
				<label for="exampleInputEmail1">Title</label> <input type="text"
					class="form-control" id="title" aria-describedby="emailHelp"
					placeholder="Enter title here" required name="title" value="<%=note.getTitle()%>"/>
			</div>
			<div class="form-group">
				<label for="content">Content</label>
				<textarea " required id="content" name="content" placeholder="Enter content here"
				class="form-control" style="height: 150px"
				><%=note.getContent()%></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-primary">update</button>
			</div>
		</form>
	</div>

</body>
</html>