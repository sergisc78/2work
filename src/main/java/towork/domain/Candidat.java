
package towork.domain;


import java.io.Serializable;
import static java.time.temporal.WeekFields.ISO;
import java.util.ArrayList;
import java.sql.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class Candidat extends Usuari{
    
    protected String cognoms;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    protected Date dataNaix;
    protected Integer formacio;
    protected Integer ocupacio;
    
    protected ArrayList<Integer> habilitats = new ArrayList();
    protected ArrayList<Experiencia> experiencies = new ArrayList();


    public Candidat (Integer codi,String nom,String cognoms, String dniNif,Date dataNaix,String adreca, String poblacio,String provincia,String telefon, String email, String observacions, String pass, String cPass,  Integer formacio,Integer ocupacio) {
        super(codi,nom,dniNif,adreca,poblacio,provincia,telefon,email,observacions,pass,cPass);
        this.cognoms = cognoms;
        this.dataNaix = dataNaix;
        this.formacio = formacio;
        this.ocupacio=ocupacio;   
        this.habilitats= new ArrayList<Integer>();
        this.experiencies= new ArrayList<Experiencia>();
    }
    
    public Candidat() {
    }

    public String getCognoms() {
        return cognoms;
    }

    public Date getDataNaix() {
        return dataNaix;
    }

    public Integer getFormacio() {
        return formacio;
    }

    public Integer getOcupacio() {
        return ocupacio;
    } 

    public ArrayList<Integer> getHabilitats() {
        return habilitats;
    }

    public ArrayList<Experiencia> getExperiencies() {
        return experiencies;
    }

    public void setCognoms(String cognoms) {
        this.cognoms = cognoms;
    }

    public void setDataNaix(Date dataNaix) {
        this.dataNaix = dataNaix;
    }

    public void setFormacio(Integer codiFormacio) {
        this.formacio = codiFormacio;
    }

    public void setOcupacio(Integer ocupacio) {
        this.ocupacio = ocupacio;
    }

    public void setHabilitats(ArrayList<Integer> habilitats) {
        this.habilitats = habilitats;
    }

    public void setExperiencies(ArrayList<Experiencia> experiencies) {
        this.experiencies = experiencies;
    }

        
}
