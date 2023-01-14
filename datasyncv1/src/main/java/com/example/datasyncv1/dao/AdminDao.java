package com.example.datasyncv1.dao;

import com.example.datasyncv1.connex.Connexion;
import com.example.datasyncv1.models.Admin;

import java.sql.ResultSet;

public class AdminDao {

    public Admin login(String user,String mdp) throws Exception {
        Admin admin;
        try {
            String requete = "select * from Admin where email='" + user + "' and mdp='" + mdp + "' ";
            Connexion c = new Connexion(requete, "");
            ResultSet res = c.getResultset();
            c.getResultset().next();
            int idadmin = c.getResultset().getInt(1);
            String email = c.getResultset().getString(2);
            String motdepasse = c.getResultset().getString(3);
            admin = new Admin(idadmin,email,motdepasse);
        } catch (Exception e) {
            return null;
        }
        return admin;
    }

    public void ValidationRechargement(int idclient)
    {
        try {
            String requete ="update rechargementcompte set estvalider=1 where idutilisateur='"+idclient+"' ";
            Connexion con = new Connexion(requete);

        } catch (Exception exc) {
            throw exc;
        } finally {

        }
    }

}
