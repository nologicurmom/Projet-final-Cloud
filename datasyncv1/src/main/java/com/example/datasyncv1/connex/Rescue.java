package com.example.datasyncv1.connex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Rescue {

    static String url="jdbc:postgresql://localhost:5432/cloudfinal";
    static String user="cloudfinal";
    static String password="cloudfinal";

    public static Connection connectToDatabase(){
        try{
            Connection c = null;
            Statement stmt ;
            c = DriverManager.getConnection(url,user,password);
            return c;
        }catch(Exception e){
            return null;
        }
    }
}
