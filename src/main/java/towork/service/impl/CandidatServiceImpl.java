/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package towork.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import towork.domain.Candidat;
import towork.repository.CandidatRepository;
import towork.service.CandidatService;

@Service
public class CandidatServiceImpl implements CandidatService {

    @Autowired
    private CandidatRepository candidatRepository;

    @Override
    public List<Candidat> getAllCandidats() {
        return candidatRepository.getAllCandidats();
    }

    @Override
    public void addCandidat(Candidat candidat) {
        candidatRepository.addCandidat(candidat);
    }

    @Override
    public List<Candidat> selectCandidat() {
        return candidatRepository.selectCandidat();
    }

    @Override
    public boolean updateCandidat(Integer codi, Candidat candidat) {
        return candidatRepository.updateCandidat(codi, candidat);

    }

    @Override
    public void deletePerfil(Candidat candidat) {
        candidatRepository.deletePerfil(candidat);
    }

    @Override
    public int getCodiByEmail(String email) {
        return candidatRepository.getCodiByEmail(email);
    }

    @Override
    public void deleteByCodi(Integer codi) {
        candidatRepository.deleteByCodi(codi);
    }
    @Override
    public Candidat getCandidatByCodi(Integer codi){
        return candidatRepository.getCandidatByCodi(codi);
        
    }

}
