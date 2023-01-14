<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>bienvenue</title>
</head>
<body>
   <h1>Bienvenue sur le site vente aux enchères </h1>

   <a href="Inscription/">Inscription</a>

   <a href="">Mettre un produit aux enchères</a>

   <h1>Liste des enchères</h1>

   <h1>Rechercher</h1>
   <form action="" method="POST">
     <input type="date" name="dateEnchere">
     <select name="categorie">
            <option value="">choisir catégorie</option>
     </select>
     <input type="number" name="prixMinimum">
     <input type="number" name="prixMaximum">
     <select name="statut">
           <option value="">Choisir statut</option>
           <option value="0">Enchère à venir</option>
           <option value="1">En cours</option>
           <option value="2">Terminé</option>
           <option value="3">Annulé</option>
     </select>
     <input type="submit" value="Rechercher">
   </form>
   <table border="1">
               <tr>
                   <td>Vendeur</td>
                   <td>Produit</td>
                   <td>Catégorie</td>
                   <td>Description</td>
                   <td>Etat du produit</td>
                   <td>DateSortie</td>
                   <td>Provenance</td>
                   <td>Date début de l`enchère</td>
                   <td>Heure début de l`enchère</td>
                   <td>Durrée de l`enchère (en heures)</td>
                   <td>Statut</td>
               </tr>
               <tr>
                   <td></td>
                   <td></td>
                   <td></td>
                   <td></td>
                   <td></td>
                   <td></td>
                   <td></td>
                   <td></td>
                   <td></td>
                   <td></td>
                   <td></td>
                   <td>Enchérir</td>
               </tr>
           </table>
</body>
</html>
