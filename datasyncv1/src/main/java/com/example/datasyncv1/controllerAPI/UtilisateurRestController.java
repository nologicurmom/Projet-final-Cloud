package com.example.datasyncv1.controllerAPI;


import com.example.datasyncv1.dao.UtilisateurDao;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;

@RestController
@CrossOrigin
public class UtilisateurRestController {


    Connection con;
    {
        try {
            con = objectBdd.ManipDb.pgConnect("postgres","cloudfinal","hardi");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @PostMapping("/traitementInscription")
    public ResponseEntity<String> traitementInscription(@RequestParam(name="nom") String nom, @RequestParam(name="prenom") String prenom, @RequestParam(name="email") String email, @RequestParam(name="mdp") String mdp, @RequestParam(name="confirm") String confirm) throws Exception
    {
        if(mdp.equals(confirm))
        {
            UtilisateurDao ud = new UtilisateurDao();
            ud.Inscription(con,nom,prenom,email,mdp);
            return new ResponseEntity<>("vos données ont été bien inséré", HttpStatus.ACCEPTED);
        }
        else{
            return new ResponseEntity<>("Veuillez bien verifier votre mot de passe", HttpStatus.EXPECTATION_FAILED);
        }

    }
}

