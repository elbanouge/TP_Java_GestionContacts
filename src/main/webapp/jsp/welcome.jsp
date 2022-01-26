<%@page import="estm.dsic.jee.dal.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@page import="estm.dsic.jee.dal.ContactDao"%>
<%@page import="estm.dsic.jee.dal.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
ContactDao conDao = new ContactDao(DBConnection.getConnection());
ArrayList<Contact> conList = null;

String val = request.getParameter("value");
System.out.println(val);
String userName = (String) session.getAttribute("userName");
if (userName == null) {
	System.out.println("Error !!!!!!");
	response.sendRedirect("index.jsp");
}

if (val != null) {
	conList = conDao.getContacts(val);
	request.setAttribute("BOOKS_LIST", conList);

} else {
	conList = conDao.getContacts(null);
	request.setAttribute("BOOKS_LIST", conList);

}
%>


<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<title>CRUD Application</title>

<style>
.inner {
	margin: 15px 0;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-light">
			<a class="navbar-brand">Book Store</a>
			<h1>
				Welcome :
				<%=userName%></h1>
			<a href="../LogoutServlet">Logout</a><b></b>
			<form action="../SearchBooksServlet" method="post"
				class="form-inline">
				<input name="ValS" class="form-control mr-sm-2" type="search"
					placeholder="Search" value="" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</nav>
	</div>
	<div class="container">
		<div class="inner">
			<div class="row">
				<div class="col-md-3">
					<h3>Input Book Information</h3>
					<form action="../AddBooksServlet" method="post">
						<div class="form-group">
							<label>Book Name</label> <input class="form-control"
								name="bkname" placeholder="Book Name" required>
						</div>
						<div class="form-group">
							<label>Description</label> <input class="form-control"
								name="bkdes" placeholder="Book Name" required>
						</div>
						<div class="form-group">
							<label>Author Name</label> <input class="form-control"
								name="authname" placeholder="Book Name" required>
						</div>
						<div class="form-group">
							<label>Category</label> <select id="inputState"
								class="form-control" name="category" required>
								<option selected disabled>Choose Category</option>
								<option value="Novel">Novel</option>
								<option value="Science Fiction">Science Fiction</option>
								<option value="Drama">Drama</option>
								<option value="Programming & Development">Programming et
									Development</option>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
						<button type="reset" class="btn btn-primary">Reset</button>
					</form>
				</div>
				<div class="col-md-9">
					<h3>Book Information From Database</h3>
					<table class="table">
						<thead class="bg-light">
							<tr>
								<th scope="col">Book Name</th>
								<th scope="col">Description</th>
								<th scope="col">Author</th>
								<th scope="col">Category</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tempBook" items="${BOOKS_LIST}">
								<tr>
									<td>${tempBook.nom }</td>
									<td>${tempBook.adresse }</td>
									<td>${tempBook.email }</td>
									<td>${tempBook.tel}</td>
									<td><a href="edit.jsp?id=${tempBook.idC }">Edit</a> <a
										href="../DeleteBooksServlet?id=${tempBook.idC}">Delete</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>