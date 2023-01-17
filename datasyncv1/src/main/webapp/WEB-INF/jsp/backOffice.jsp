<%@page import="java.util.List"%>
<%@page import="com.example.datasyncv1.models.Admin"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
String token = (String)request.getSession().getAttribute("token");
Admin admin = (Admin) request.getSession().getAttribute("admin");
float chiffreAffaire = (float) request.getAttribute("chiffreAffaire");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>backOffice</title>
</head>
<body>
 <h1>Back Office Administrateur</h1>

 <h1>Chiffre d`affaire :  <%= chiffreAffaire  %> </h1>

  <form action="/newCategorie" method="POST">
  <input type="text" name="typeCategorie" placeholder="type categorie">
  <input type="submit" value="enregistrer">
  </form>

 <a href="/ListeRechargementCompte">Voir la liste des demandes de rechargement de compte</a>
 <a href="/Statistique">Voir Statistique</a>
 <a href="/logout">Se déconnecter</a>
</body>
</html>