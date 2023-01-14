package com.example.datasyncv1.models;

import javax.persistence.*;


public class Categorie extends objectBdd.Mere {

    public Integer IdCategorieProduit;
    public String typeCategorie;

    public Integer getIdCategorieProduit() {
        return IdCategorieProduit;
    }

    public void setIdCategorieProduit(Integer idCategorieProduit) {
        IdCategorieProduit = idCategorieProduit;
    }

    public String getTypeCategorie() {
        return typeCategorie;
    }

    public void setTypeCategorie(String typeCategorie) {
        this.typeCategorie = typeCategorie;
    }
}
