/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package towork.service;

import java.util.List;
import towork.domain.Candidat;
import towork.domain.Empresa;
import towork.domain.Oferta;

public interface AdminService {

    Candidat getCandidatByDniNif(String dniNIf);

    Empresa getEmpresaByDniNif(String dniNIf);

    Oferta getOfertaByCodi(int codiOferta);

    List<Candidat> getCandidats();

    List<Empresa> getEmpreses();

    List<Oferta> getOfertes();

    void deleteOferta(Oferta oferta);

    void deleteCandidat(Candidat candidat);

    void deleteEmpresa(Empresa empresa);

}
