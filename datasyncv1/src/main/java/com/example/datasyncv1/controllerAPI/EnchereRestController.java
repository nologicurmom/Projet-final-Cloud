package com.example.datasyncv1.controllerAPI;

import com.example.datasyncv1.connex.Connexion;
import com.example.datasyncv1.dao.EnchereDao;
import com.example.datasyncv1.dao.PrelevementEnchereDao;
import com.example.datasyncv1.dao.TokenUserDao;
import com.example.datasyncv1.models.Enchere;
import com.example.datasyncv1.models.Response;
import com.example.datasyncv1.models.TokenUser;
import com.example.datasyncv1.models.Utilisateur;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Connection;
import java.util.List;

@RestController
@RequestMapping("/api/enchere")
@CrossOrigin
public class EnchereRestController {

    EnchereDao ed = new EnchereDao();
    PrelevementEnchereDao ped = new PrelevementEnchereDao();
  Connexion con1 = new Connexion();
    Connection con;
    {
        try {
            con = objectBdd.ManipDb.pgConnect("postgres","cloudfinal","hardi");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("listeEnchere")
    public ResponseEntity<List<Enchere>> getListeEnchere(){
        try{
                return new ResponseEntity<List<Enchere>>(new EnchereDao().getListEnchere(con), HttpStatus.OK);
        }catch(Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("ficheEnchere/{idEnchere}")
    public ResponseEntity<List<Enchere>> getFicheEnchere(@PathVariable int idEnchere){
        try{
            return new ResponseEntity<List<Enchere>>(new EnchereDao().getFicheEnchere(con,idEnchere), HttpStatus.OK);
        }catch(Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("ReEncherir")
    public Response ReEncherir(@RequestHeader("token")String token) throws Exception {
        Response response = new Response();
        TokenUserDao tud = new TokenUserDao();
        if(tud.validTokenUser(token)!=0)
        {
                response.setMessage("votre offre a été bien prise en compte");
        }
        else{
            response.setMessage("veuillez dabord vous authentifier");
        }
        return response;
    }

    @GetMapping("ListeEnchereUser")
    public ResponseEntity<List<Enchere>> ListeEnchereUser(@RequestHeader("token") String token){
        TokenUserDao tud = new TokenUserDao();
        TokenUser tu = null;
        try{
            if(tud.validTokenUser(token)!=0)
            {
                tu = tud.getTokenUser(token);
                return new ResponseEntity<List<Enchere>>(new EnchereDao().getListeEnchereUser(con,tu.getIdUtilisateur()), HttpStatus.OK);
            }
            else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }

        }catch(Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("AjoutEnchere/{id}")
    public Response AjoutEnchere(@PathVariable int id,@RequestParam("description") String description,@RequestParam("prixminimumvente") float prixminimumvente,@RequestParam("durreenchere") int durreenchere) throws Exception {
        Response response = new Response();
        TokenUserDao tud = new TokenUserDao();
        TokenUser tu = new TokenUser();
     //   if(tud.validTokenUser(token)!=0)
       // {
         //   tu = tud.getTokenUser(token);
          int result = ed.AjouterEncher(con1,id,description,prixminimumvente,durreenchere);

            //commission
         ped.Inserer(con1,result,ed.MontantPrelevee(result));

            response.setMessage("votre vente a été bien prise en compte");
       // }
       // else{
       //     response.setMessage("veuillez dabord vous authentifier");
       // }
        return response;
    }

}
