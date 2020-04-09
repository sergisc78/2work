/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package towork.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import towork.domain.Candidat;
import towork.domain.Empresa;

/**
 *
 * @author SERGI
 */
@Controller
public class HomeController {

      @RequestMapping(value = "/", method = RequestMethod.GET)
      public ModelAndView homeRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
            // Llegim l'atribut login de la sessió
            
            HttpSession session = request.getSession();
            boolean login = false;
            
            if (session.getAttribute("login") != null){
                  login = (Boolean) session.getAttribute("login");
            }
            
            
            // Creem el modelview
            ModelAndView modelview = new ModelAndView("home");
            
            // Creem les opcions que aniràn a la barra de navegació
            List<Map<String, String>> opcions = new ArrayList<>();
            
            if (!login) {
                  // Si no hi  ha un usuari logat 
                  // Opció Administrador a la barra de navegació
                  HashMap<String, String> admin = new HashMap<>();
                  admin.put("paraula","Administrador");
                  admin.put("url","/loginAdmin");
        
                  // Opció Candidat a la barra de navegació
                  HashMap<String, String> candidat = new HashMap<>();
                  candidat.put("paraula","Candidat");
                  candidat.put("url","/loginCandidat");
        
                  // Opció Empresa a la barra de navegació
                  HashMap<String, String> empresa = new HashMap<>();
                  empresa.put("paraula","Empresa");
                  empresa.put("url","/loginEmpresa");
                  
                  // Afegim les opcions a l'array
                  opcions.add(admin);
                  opcions.add(candidat);
                  opcions.add(empresa);
                  
            } else {
                  // Si hi ha algun usuari logat
                  // Opció Logout a la barra de navegació
                  HashMap<String, String> logout = new HashMap<>();
                  logout.put("paraula","Logout");
                  logout.put("url","/logout");
                  
                  opcions.add(logout);
            }
            
            modelview.getModelMap().addAttribute("ubicacio", "La teva web de cerca de feina");
            modelview.getModelMap().addAttribute("opcions", opcions);
            return modelview;
      }

      
      @RequestMapping(value = "/altaCandidat", method = RequestMethod.GET)
      public ModelAndView addcandidatRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            ModelAndView modelview = new ModelAndView("altaCandidat");
        
            // Opció Inici a la barra de navegació
            HashMap<String, String> inici = new HashMap<>();
            inici.put("paraula","Inici");
            inici.put("url","/");
        
            // Hashmap que contindrà les opcions que hi haurà a la barra de navegació
            HashMap[] opcions = new HashMap[]{inici};
            
            // Formulari d'alta candidat 
            Candidat formCandidat = new Candidat();
            //modelview.getModelMap().addAttribute("act", "candidat/add");
            modelview.getModelMap().addAttribute("formCandidat", formCandidat);
            
            modelview.getModelMap().addAttribute("ubicacio", "Alta de candidat");
            modelview.getModelMap().addAttribute("opcions", opcions);
            return modelview;
    }
    /*
     FORM DE Candidat POST
     */
    /*@RequestMapping(value = "/candidat/add", method = RequestMethod.POST)
    public String processAddForm(@ModelAttribute("formCandidat") Candidat formCandidat, BindingResult result) {
        CandidatService.addCandidat(formCandidat);
        return "redirect:/all"; //return "redirect:/";
    }*/
      
      
    @RequestMapping(value = "/altaEmpresa", method = RequestMethod.GET)
    public ModelAndView addempresaRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ModelAndView modelview = new ModelAndView("altaEmpresa");
        modelview.getModelMap().addAttribute("banner", "2work");
        
        //Formulari d'alta empresa 
        Empresa formEmpresa = new Empresa();
        //modelview.getModelMap().addAttribute("act", "empresa/add");
        modelview.getModelMap().addAttribute("formEmpresa", formEmpresa);
        
        modelview.getModelMap().addAttribute("tagline", "La teva web de cerca de feina");
        return modelview;
    }
    
    /*
     FORM D'empresa POST
     */
    /*@RequestMapping(value = "/empresa/add", method = RequestMethod.POST)
    public String processAddForm(@ModelAttribute("formEmpresa") Empresa formEmpresa, BindingResult result) {
        EmpresaService.addEmpresa(formEmpresa);
        return "redirect:/all"; //return "redirect:/";
    }*/
     
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public ModelAndView infoRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ModelAndView modelview = new ModelAndView("info");
        return modelview;
    }
}
