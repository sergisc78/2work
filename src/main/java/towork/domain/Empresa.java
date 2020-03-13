
package towork.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name="empreses")
public class Empresa extends Usuari implements Serializable{
    
    private static final long serialVersionUID=1L;
    
    @NotNull
    @Column(name="codiEmp")
    protected String codiEmp;
    
    @NotNull
    @Size(max=100)
    @Column(name="web")
    protected String web;
    
    @Column(name="tamany")
    protected Integer tamany;
    
    public Empresa(String dniNif,String nom, String adreca, String telefon, String email, 
            String pass, String cPass, String sector,String codiEmp, String web,Integer tamany){
        super(dniNif,nom,adreca,telefon,email,pass,cPass,sector);
        this.codiEmp=codiEmp;
        this.web=web;
        this.tamany=tamany;
    }
    public Empresa(){
        super();
    }

    public String getCodiEmp() {
        return codiEmp;
    }

    public String getWeb() {
        return web;
    }

    public Integer getTamany() {
        return tamany;
    }

    public void setCodiEmp(String codiEmp) {
        this.codiEmp = codiEmp;
    }

    public void setWeb(String web) {
        this.web = web;
    }

    public void setTamany(Integer tamany) {
        this.tamany = tamany;
    }
    
}
