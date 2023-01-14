package com.example.datasyncv1.connex;

import java.sql.*;

public class Connexion2 {
    public static void main(String[] args) {
        // Chargement du driver JDBC pour SQL Server
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver JDBC non trouvé");
            e.printStackTrace();
            return;
        }
        // Connexion à la base de données
        Connection connection = null;
        try {
            // Remplacez "your-server-name" par le nom de votre serveur SQL Server
            String url = "jdbc:sqlserver://DESKTOP-0IS54LA;databaseName=synchro;integratedSecurity=true\n";
            connection = DriverManager.getConnection(url);
        } catch (SQLException e) {
            System.out.println("misy erreur");
            e.printStackTrace();
            return;
        }
        if (connection != null) {
            System.out.println("Connecté à la  base de données");
        } else {
            System.out.println("Connexion échouée");
        }
    }
}
