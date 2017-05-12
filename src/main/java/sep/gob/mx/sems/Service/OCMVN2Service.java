/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sep.gob.mx.sems.Service;

import java.util.List;
import sep.gob.mx.sems.Model.Destinos_viat_nac;
import sep.gob.mx.sems.Model.Viaticos_nacionales;

/**
 *
 * @author brayan.padilla
 */
public interface OCMVN2Service {
    
    public List<Destinos_viat_nac> listDestViatNac()throws Exception;
    public Destinos_viat_nac getDestViatNacById(Integer idDestViatNac)throws Exception;
    public Destinos_viat_nac getDestViatNacByIdOMVI(Integer idViatDestIdDestino)throws Exception;
    public Destinos_viat_nac updateDestViatNac(Destinos_viat_nac destViatNac)throws Exception;
    public String saveDestViatNac(Destinos_viat_nac destViatNac)throws Exception;
    public String deleteDestViatNac(Integer idDestViatNac)throws Exception;
    
    public List<Viaticos_nacionales> listViaticosNacionales()throws Exception;
    public Viaticos_nacionales getViaticos_nacionalesById(Integer idViatNac)throws Exception;
    public Viaticos_nacionales getViatNacByIdOMVI(Integer idOMVI)throws Exception;
    public Viaticos_nacionales updateViaticos_nacionales(Viaticos_nacionales viatNac)throws Exception;
    public String saveViaticos_nacionales(Viaticos_nacionales viatNac)throws Exception;
    public String deleteViaticos_nacionales(Integer idViatNac)throws Exception;
    
    
    
}
