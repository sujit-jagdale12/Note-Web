<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add notes</title>
<%@include file="js_css.jsp"%>
<title>Add notes</title>
</head>
<body>
	<div class="container">
		<div>
			<%@include file="Navbar.jsp"%>
		</div>
	</div>

	<div class="container">
	<h3>Fill your note details</h3>
		<form action="SaveNotes" method="post">
			<div class="form-group">
				<label for="exampleInputEmail1">Title</label> <input type="text"
					class="form-control" id="title" aria-describedby="emailHelp"
					placeholder="Enter title here" required name="title" />
			</div>
			<div class="form-group">
				<label for="content">Content</label>
				<textarea required id="content" name="content" placeholder="Enter content here"
				class="form-control" style="height: 150px"
				></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-primary">add</button>
			</div>
		</form>
	</div>
</body>
</html>