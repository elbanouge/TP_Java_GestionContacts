<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rejoignez-nous</title>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei"
	rel="stylesheet">
<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">
		<div class="box">
			<img class="avatar" src="../img/user.png">
			<h1>Compte de connexion</h1>
			<form action="../LoginServlet" method="post">
				<p>Courriel</p>
				<input type="text" placeholder="Courriel de l'utilisateur"
					name="email" required>
				<p>Mot de passe</p>
				<input type="password" placeholder="Mot de passe de l'utilisateur"
					name="password" required> <input type="submit"
					value="Connexion"> <a href="#">Mot de passe oublié?</a><br>
				<a href="registration.jsp">Créer un nouveau compte</a>
			</form>
		</div>
	</div>
</body>
</html>