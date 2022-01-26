<%@page import="estm.dsic.jee.dal.Contact"%>
<%@page import="estm.dsic.jee.dal.ContactDao"%>
<%@page import="estm.dsic.jee.dal.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
int id = Integer.parseInt(request.getParameter("id"));
ContactDao conDao = new ContactDao(DBConnection.getConnection());
Contact bk = conDao.getContactByID(id);
request.setAttribute("edit_books", bk);
%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<title>Edit Book Data</title>
<style>
.inner {
	position: relative;
	margin: 0 auto;
	width: 650px;
	display: block;
	padding: 50px 0;
}

h3 {
	text-align: center;
	border-bottom: 2px solid midnightblue;
	margin-bottom: 20px;
}

nav li a {
	font-size: 25px;
	font-weight: 500;
}

a {
	color: #fff;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-light">
			<a class="navbar-brand">Book Store</a>
			<ul class="navbar-nav ml-auto mt-3 mx-5">
				<li class="nav-item"><a class="nav-link active"
					href="index.jsp">Home</a></li>
			</ul>
		</nav>
	</div>
	<div class="inner">
		<div class=" container">
			<div class="row">
				<div class="col-12">
					<h3>Edit Book Details</h3>
					<form action="../EditBooksServlet" method="post">
						<div class="form-group">
							<label>Book ID</label> <input class="form-control" name="bkid"
								value="${edit_books.idC }" required>
						</div>
						<div class="form-group">
							<label>Book Name</label> <input class="form-control"
								name="bkname" value="${edit_books.nom }" required>
						</div>
						<div class="form-group">
							<label>Description</label> <input class="form-control"
								name="bkdes" value="${edit_books.adresse}" required>
						</div>
						<div class="form-group">
							<label>Author Name</label> <input class="form-control"
								name="authname" value="${edit_books.email}" required>
						</div>
						<div class="form-group">

							<label>Category</label> <select id="inputState"
								class="form-control" name="category" required>
								<option selected disabled>Choose Category</option>
								<option value="Novel">Novel</option>
								<option value="Science Fiction">Science Fiction</option>
								<option value="Drama">Drama</option>
								<option value="Programming & Development">Programming
									et Development</option>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
						<a class="btn btn-primary" href="welcome.jsp">Cancel</a>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</body>
</html>

