package com.example.datasyncv1.controllerVIEW;

import com.example.datasyncv1.dao.AdminDao;
import com.example.datasyncv1.dao.TokenDao;
import com.example.datasyncv1.models.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class AdministrateurController {


    @GetMapping("/")
    public String logadmin(Model model) {
        model.addAttribute("email", "admin@gmail.com");
        model.addAttribute("mdp","admin");
        return "logadmin";
    }



    @PostMapping("/login")
    public String traitementLogin(HttpServletRequest request) throws Exception{
        HttpSession session = request.getSession(true);
        String id = request.getParameter("email");
        String mdp = request.getParameter("mdp");
        AdminDao dao = new AdminDao();
        TokenDao tokendao= new TokenDao();
        if(dao.login(id,mdp)!=null){
            Admin admin = dao.login(id,mdp);
            String token_admin = tokendao.insertTokenAdmin(admin);
            session.setAttribute("admin", admin);
            session.setAttribute("token",token_admin);
            return "redirect:/backOffice";
        }else{
            return "redirect:/?error=1";
        }
    }

    @RequestMapping("/backOffice")
    public String backOffice(HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("admin")!=null){
            return "backOffice";
        }else {
            return "/";
        }
    }

    @RequestMapping("/logout")
    public String deconnexion(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        TokenDao dao = new TokenDao();
        dao.deleteTokenAdmin((String) session.getAttribute("token"), admin.getIdadmin());
        session.invalidate();
        return "redirect:/";
    }
}

