<%@page import="estm.dsic.jee.dal.Contact"%>
<%@page import="estm.dsic.jee.dal.ContactDao"%>
<%@page import="estm.dsic.jee.dal.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
int id = Integer.parseInt(request.getParameter("id"));
ContactDao conDao = new ContactDao(DBConnection.getConnection());
Contact con = conDao.getContactByID(id);
request.setAttribute("edit_contact", con);
%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<title>Modifier les données du contact</title>
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
			<h1>Gestion des contacts</h1>
			<ul class="navbar-nav ml-auto mt-3 mx-5">
				<li class="nav-item"><a class="nav-link active"
					href="welcome.jsp">Accueil</a></li>
			</ul>
		</nav>
	</div>
	<div class="inner">
		<div class=" container">
			<div class="row">
				<div class="col-12">
					<h3>Modifier les détails du contact</h3>
					<form action="../EditContactServlet" method="post">
						<div class="form-group">
							<label>ID de contact</label> <input class="form-control"
								name="conID" value="${edit_contact.id_contact}"
								readonly="readonly" required>
						</div>
						<div class="form-group">
							<label>Nom de contact</label> <input class="form-control"
								name="conName" value="${edit_contact.nom }" required>
						</div>
						<div class="form-group">
							<label>Adresse de contact</label> <input class="form-control"
								name="conAdr" value="${edit_contact.adresse}" required>
						</div>
						<div class="form-group">
							<label>Email de contact</label> <input class="form-control"
								name="conEmail" value="${edit_contact.email}" required>
						</div>
						<div class="form-group">
							<label>Télephone de contact</label> <input class="form-control"
								name="conTel" value="${edit_contact.tel}" required>
						</div>
						<button type="submit" class="btn btn-primary">Modifier</button>
						<a class="btn btn-primary" href="welcome.jsp">Annuler</a>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/script.js" type="text/javascript"></script>
</body>
</html>

