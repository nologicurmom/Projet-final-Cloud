package com.example.datasyncv1.models;

public class Enchere extends objectBdd.Mere {

    private int idUtilisateur;
    private  String description;
    private float prixMinimumVente;
    private int durreEnchere;
    private String dateheureenchere;

    public Enchere()
    {

    }

    public Enchere(int idUtilisateur, String description, float prixMinimumVente, int durreEnchere) {
        this.idUtilisateur = idUtilisateur;
        this.description = description;
        this.prixMinimumVente = prixMinimumVente;
        this.durreEnchere = durreEnchere;
    }

    public int getIdUtilisateur() {
        return idUtilisateur;
    }

    public void setIdUtilisateur(int idUtilisateur) {
        this.idUtilisateur = idUtilisateur;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrixMinimumVente() {
        return prixMinimumVente;
    }

    public void setPrixMinimumVente(float prixMinimumVente) {
        this.prixMinimumVente = prixMinimumVente;
    }

    public int getDurreEnchere() {
        return durreEnchere;
    }

    public void setDurreEnchere(int durreEnchere) {
        this.durreEnchere = durreEnchere;
    }

    public String getDateheureenchere() {
        return dateheureenchere;
    }

    public void setDateheureenchere(String dateheureenchere) {
        this.dateheureenchere = dateheureenchere;
    }
}
