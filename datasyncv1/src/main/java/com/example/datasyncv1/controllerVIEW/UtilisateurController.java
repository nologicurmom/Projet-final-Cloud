package com.example.datasyncv1.controllerVIEW;

import com.example.datasyncv1.dao.UtilisateurDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;

@Controller
@RequestMapping("/utilisateur")
public class UtilisateurController {

    @GetMapping("/")
    public String IndexUtilisateur(Model model) {
       // model.addAttribute("email", "hardi@gmail.com");
       // model.addAttribute("mdp","hardi");
        //return "logutilisateur";
        return "indexutilisateur";
    }

    @GetMapping("/Inscription")
    public String pageInscription()
    {
        return "Inscription";
    }

}
