<%@page import="java.util.List"%>
<%@page import="com.example.datasyncv1.models.Admin"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
String token = (String)request.getSession().getAttribute("token");
Admin admin = (Admin) request.getSession().getAttribute("admin");
float chiffreAffaire = (float) request.getAttribute("chiffreAffaire");
List<Object[]> liste = (List<Object[]>) request.getAttribute("listeRechargementCompte");

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

 <h1>Liste des rechargements des comptes </h1>
 <table border="1">
      <thead>
        <tr>
          <th>nom</th>
          <th>prenom</th>
          <th>montant</th>
          <th>DateHeureRechargement</th>
        </tr>
      </thead>
      <tbody>
             <% for(int i=0;i<liste.size();i++) { %>
        <tr>
            <td><%= liste.get(i)[2]  %></td>
            <td><%= liste.get(i)[3]  %></td>
            <td><%= liste.get(i)[4]  %></td>
            <td><%= liste.get(i)[5] %></td>
            <td><a href="/Validation/<%= liste.get(i)[0] %>/<%= liste.get(i)[1] %>/<%= liste.get(i)[4] %>">Valider</a></td>
        </tr>
        <% } %>
      </tbody>
      </table>
 <a href="/Statistique">
