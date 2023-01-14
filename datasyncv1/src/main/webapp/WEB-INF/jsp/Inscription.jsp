<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Inscription</title>
</head>
<body>
     <form action="traitementInscription/" method="POST">

  <input type="text" name="nom" placeholder="votre nom">
  <input type="text" name="prenom" placeholder="votre prenom">
  <input type="text" name="email" placeholder="votre email">
  <input type="password" name="mdp" placeholder="votre mot de passe">
  <input type="password" name="confirm" placeholder="confirmer mot de passe">
  <input type="submit" value="S inscrire">

     </form>
</body>
</html>
