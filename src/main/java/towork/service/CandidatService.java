/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package towork.service;

import java.util.List;
import towork.domain.Candidat;

/**
 *
 * @author Sergi
 */
public interface CandidatService {
    
    List<Candidat> getAllCandidats();
    public void addCandidat (Candidat candidat);
    List <Candidat> selectCandidat();
    Candidat getCandidatByCodi(Integer codi);
    boolean updateCandidat(Integer codi,Candidat candidat);
    void deletePerfil (Candidat candidat);
    int getCodiByEmail(String email);
    void deleteByCodi (Integer codi);
  
}
