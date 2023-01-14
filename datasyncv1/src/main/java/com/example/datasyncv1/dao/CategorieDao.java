package com.example.datasyncv1.dao;

import com.example.datasyncv1.models.Categorie;
import com.example.datasyncv1.models.ProduitCategorie;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class CategorieDao {

    public List<Categorie> getListProduct(Connection con) throws Exception {
        List<Categorie> liste = new ArrayList<>();
        Categorie c = new Categorie();
        Object[] result = c.findAll(con,"");
        for(Object o:result)
        {
            liste.add((Categorie) o);
        }
        if(liste.size() != 0)
        {
            return liste;
        }
        else {
            return null;
        }
    }
}
