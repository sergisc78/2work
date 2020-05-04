/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package towork.repository;

import java.util.List;
import towork.domain.Candidatura;

/**
 *
 * @author gonem
 */
public interface CandidaturaRepository {
    List<Candidatura> getAllCandidatures();
    List<Candidatura> getCandidaturesPerOferta(Integer codiOferta);
    List<Candidatura> getCandidaturesPerCandidat(Integer codiCandidat);
}
