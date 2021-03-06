<%@page import="estm.dsic.jee.dal.User"%>
<%@page import="estm.dsic.jee.dal.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@page import="estm.dsic.jee.dal.DBConnection"%>
<%@page import="estm.dsic.jee.dal.ContactDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
ContactDao contactDao = new ContactDao(DBConnection.getConnection());
ArrayList<Contact> conList = null;

String val = request.getParameter("value");
User user = (User) session.getAttribute("user");

if (user == null) {
	System.out.println("Erreur !!!!!!");
	response.sendRedirect("index.jsp");
} else {
	conList = contactDao.getContacts(null, user.getId());
}

if (val == null) {
	session.setAttribute("CONTACT_LIST", conList);
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
<link rel="stylesheet" href="../css/bootstrap.min.css">

<title>Gestion des contacts</title>

<style>
.inner {
	margin: 15px 0;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-light">
			<h1>Gestion des contacts</h1>

			<form action="../SearchContactsServlet" method="post"
				class="form-inline">
				<label>&nbsp; Bienvenu(e) : &nbsp; <%=user.getName()%>  &nbsp; &nbsp; &nbsp;</label> <input
					style="width: 280px;" name="ValS" class="form-control mr-sm-2"
					type="search" placeholder="saisir la valeur de recherche" value=""
					aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Chercher</button>
				<a style="text-decoration: none;" href="../LogoutServlet">&nbsp;&nbsp;
					Se déconnecter &nbsp;</a> <b></b>
			</form>
		</nav>
	</div>
	<div style="max-width: 1500px" class="container">
		<div class="inner">
			<div class="row">
				<div class="col-md-3">
					<h3>Saisir les informations du contact</h3>
					<form action="../AddContactsServlet" method="post">
						<div class="form-group">
							<label>Nom de contact</label> <input class="form-control"
								name="conName" placeholder="Nom" required>
						</div>
						<div class="form-group">
							<label>Adresse de contact</label> <input class="form-control"
								name="conAdr" placeholder="Adresse" required>
						</div>
						<div class="form-group">
							<label>Email de contact</label> <input class="form-control"
								name="conEmail" placeholder="Email" required>
						</div>
						<div class="form-group">
							<label>Téléphone de contact</label> <input class="form-control"
								name="conTel" placeholder="Telephone" required>
						</div>
						<div class="form-group">
							<label>Nom de user</label> <input class="form-control"
								name="nomUser" value="<%=user.getName()%>" readonly="readonly">
						</div>
						<button type="submit" class="btn btn-primary">Ajouter</button>
						<button type="reset" class="btn btn-primary">Réinitialiser</button>
					</form>
				</div>
				<div class="col-md-9">
					<h3>Informations sur les contacts à partir de la base de
						données</h3>
					<table class="table">
						<thead class="bg-light">
							<tr>
								<th scope="col">Nom</th>
								<th scope="col">Adresse</th>
								<th scope="col">Email</th>
								<th scope="col">Telephone</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="CONTACT" items="${CONTACT_LIST}">
								<tr>
									<td>${CONTACT.nom }</td>
									<td>${CONTACT.adresse }</td>
									<td>${CONTACT.email }</td>
									<td>${CONTACT.tel}</td>
									<td><a href="edit.jsp?id=${CONTACT.id_contact }">Modifier</a>
										<a href="../DeleteContactsServlet?id=${CONTACT.id_contact}">Supprimer</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/script.js" type="text/javascript"></script>
</body>
</html>