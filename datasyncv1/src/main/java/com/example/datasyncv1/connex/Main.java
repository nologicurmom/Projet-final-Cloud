package com.example.datasyncv1.connex;

import com.example.datasyncv1.dao.ProduitDao;
import com.example.datasyncv1.dao.UtilisateurDao;
import com.example.datasyncv1.models.ProduitCategorie;
import com.example.datasyncv1.models.Utilisateur;

import java.sql.Connection;
import java.util.List;

public class Main {

    public static void main(String[] args) throws Exception{

        ProduitDao pd = new ProduitDao();
        Connection con = objectBdd.ManipDb.pgConnect("postgres","cloudfinal","hardi");
        List<ProduitCategorie> list = pd.getListProduct(con);
        for (ProduitCategorie p : list){
            System.out.println(p.getTypeCategorie());
        }
    }
}
