<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%
List<Object[]> liste = (List<Object[]>) request.getAttribute("graphe");
List<Object[]> NombreTotalProduitVendu = (List<Object[]>) request.getAttribute("NombreTotalProduitVendu");
List<Object[]> StatMembre = (List<Object[]>) request.getAttribute("StatMembre");
List<Object[]> StatEnchere = (List<Object[]>) request.getAttribute("StatEnchere");

int annee = (int) request.getAttribute("annee");
int annee_actuelle=LocalDate.now().getYear();
%>
<!DOCTYPE html>
<html>
<head>
<title>Graphique de l'évolution du chiffre d'affaires</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
<h1>Evolution chiffre d`affaire <%= annee %></h1>
<canvas id="myChart"></canvas>

<script>
  <% if (liste != null && !liste.isEmpty()) {
   for(int i=0;i<liste.size();i++) { %>
var salesData = [
  { month: <%= liste.get(i)[0]  %>, sales: <%= liste.get(i)[2]  %> }
];
 <% } %>
 <% } else { %>
var salesData = [
  { month: "Janvier", sales: 0 },
  { month: "Février", sales: 0 },
  { month: "Mars", sales: 0 },
  { month: "Avril", sales: 0 },
  { month: "Mai", sales: 0 },
  { month: "Juin", sales: 0 }
];
 <% } %>

var months = salesData.map(function(data) {
  return data.month;
});

var sales = salesData.map(function(data) {
  return data.sales;
});

var ctx = document.getElementById("myChart").getContext("2d");
var myChart = new Chart(ctx, {
  type: "line",
  data: {
    labels: months,
    datasets: [
      {
        label: "Chiffre d'affaires",
        data: sales,
        backgroundColor: "rgba(255, 99, 132, 0.2)",
        borderColor: "rgba(255, 99, 132, 1)",
        borderWidth: 1
      }
    ]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});
</script>

<h1>Choisir Année:</h1>
<h3><a href="/graphe/<%= annee-1 %>"> <input type="submit" value="-" ></a>
    <%= annee %>
<a href="/graphe/<%= annee+1 %>"> <input type="submit" value="+" ></a>
</h3>

<h1>Nombre total des produits vendus par catégorie:</h1>

<table border="1">
      <thead>
        <tr>
          <th>Catégorie Produit</th>
          <th>Nombre produit vendu</th>
        </tr>
      </thead>
      <tbody>
             <% for(int i=0;i<NombreTotalProduitVendu.size();i++) { %>
        <tr>
            <td><%= NombreTotalProduitVendu.get(i)[1]  %></td>
            <td><%= NombreTotalProduitVendu.get(i)[2]  %></td>
        </tr>
        <% } %>
      </tbody>
      </table>


<h1>Statistiques sur les membres : </h1>

<table border="1">
      <thead>
        <tr>
          <th>année</th>
          <th>mois</th>
          <th>nombre total inscrit</th>
        </tr>
      </thead>
      <tbody>
             <% for(int i=0;i<StatMembre.size();i++) { %>
        <tr>
            <td><%= StatMembre.get(i)[1]  %></td>
            <td><%= StatMembre.get(i)[2]  %></td>
            <td><%= StatMembre.get(i)[0]  %></td>
        </tr>
        <% } %>
      </tbody>
</table>

<h1>Statistiques sur les enchères:</h1>

<table border="1">
      <thead>
        <tr>
          <th>année</th>
          <th>mois</th>
          <th>nombre total enchères effectués</th>
        </tr>
      </thead>
      <tbody>
             <% for(int i=0;i<StatEnchere.size();i++) { %>
        <tr>
            <td><%= StatEnchere.get(i)[1]  %></td>
            <td><%= StatEnchere.get(i)[2]  %></td>
            <td><%= StatEnchere.get(i)[0]  %></td>
        </tr>
        <% } %>
      </tbody>
</table>

</body>
</html>
