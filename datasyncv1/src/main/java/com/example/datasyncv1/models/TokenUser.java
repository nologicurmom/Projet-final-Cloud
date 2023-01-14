package com.example.datasyncv1.models;

public class TokenUser {
    public int idtokenuser;
    public int idUtilisateur;
    public String token;
    public String datecreation;
    public String dateexpiration;
    public String role;

    public int getIdtokenuser() {
        return idtokenuser;
    }

    public void setIdtokenuser(int idtokenuser) {
        this.idtokenuser = idtokenuser;
    }

    public int getIdUtilisateur() {
        return idUtilisateur;
    }

    public void setIdUtilisateur(int idUtilisateur) {
        this.idUtilisateur = idUtilisateur;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getDatecreation() {
        return datecreation;
    }

    public void setDatecreation(String datecreation) {
        this.datecreation = datecreation;
    }

    public String getDateexpiration() {
        return dateexpiration;
    }

    public void setDateexpiration(String dateexpiration) {
        this.dateexpiration = dateexpiration;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
