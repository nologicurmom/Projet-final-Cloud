package com.example.datasyncv1.dao;

import com.example.datasyncv1.connex.Connexion;
import com.example.datasyncv1.models.Utilisateur;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;

public class UtilisateurDao {
    Utilisateur user = new Utilisateur();
    public String login(String user,String mdp) throws Exception {
        String idUser = "";
        try {
            String requete = "select idUtilisateur from Utilisateur where email='" + user + "' and mdp='" + mdp + "' ";
            Connexion c = new Connexion(requete, "");
            ResultSet res = c.getResultset();
            c.getResultset().next();
            idUser = res.getString(1);
        } catch (Exception e) {
            idUser = "null";
        }
        return idUser;
    }

    public void Inscription(Connection con,String nom,String prenom,String email,String mdp) throws Exception {
        Utilisateur u = new Utilisateur(nom,prenom,email,mdp);
        u.insert(con);
    }

    public float getCompteUser(int idclient,Connexion con) throws Exception {
        String requete = "select compte from utilisateur  where idutilisateur='"+idclient+"' ";
        con = new Connexion(requete);
        con.getResultset().next();
        float result = con.getResultset().getFloat(1);
        return result;
    }

    public float setCompteUser(int idclient,float montant,Connexion con) throws Exception
    {
        float soldeUser = this.getCompteUser(idclient,con)+montant;
        return soldeUser;
    }

}
