package sep.gob.mx.sems.DAO;

import java.util.List;
import sep.gob.mx.sems.Model.Destinos_viat_nac;
import sep.gob.mx.sems.Model.Viaticos_nacionales;
import sep.gob.mx.sems.Model.Viaticos_Destinos_Nacionales;

/**
 *
 * @author brayan.padilla
 */
public interface OCMVN2DAO {
    
    public List<Destinos_viat_nac> listDestViatNac()throws Exception;
    public Destinos_viat_nac getDestViatNacById(Integer idDestViatNac)throws Exception;
    public Destinos_viat_nac getDestViatNacByIdOMVI(Integer idViatDestIdDestino)throws Exception;
    public List<Destinos_viat_nac> getListDestViatNacByIdOMVI(Integer idOMVI)throws Exception;
    public Destinos_viat_nac updateDestViatNac(Destinos_viat_nac destViatNac)throws Exception;
    public String saveDestViatNac(Destinos_viat_nac destViatNac)throws Exception;
    public String deleteDestViatNac(Integer idDestViatNac)throws Exception;
    
    public List<Viaticos_nacionales> listViaticosNacionales()throws Exception;
    public Viaticos_nacionales getViaticos_nacionalesById(Integer idViatNac)throws Exception;
    public Viaticos_nacionales getViatNacByIdOMVI(Integer idOMVI)throws Exception;
    public Viaticos_nacionales updateViaticos_nacionales(Viaticos_nacionales viatNac)throws Exception;
    public String saveViaticos_nacionales(Viaticos_nacionales viatNac)throws Exception;
    public String deleteViaticos_nacionales(Integer idViatNac)throws Exception;
    
    public List<Viaticos_Destinos_Nacionales> listViaticos_Destinos_Nacionales()throws Exception;
    public Viaticos_Destinos_Nacionales getViaticos_Destinos_NacionalesById(Integer idViatDestNac)throws Exception;
    public Viaticos_Destinos_Nacionales getViaticos_Destinos_NacionalesByIdOMVI(Integer idOMVI)throws Exception;
    public List<Viaticos_Destinos_Nacionales> getListViaticos_Destinos_NacionalesByIdOMVI(Integer idOMVI)throws Exception;
    public Viaticos_Destinos_Nacionales updateViaticos_Destinos_Nacionales(Viaticos_Destinos_Nacionales viaticos_Destinos_Nacionales)throws Exception;
    public String saveViaticos_Destinos_Nacionales(Viaticos_Destinos_Nacionales viaticos_Destinos_Nacionales)throws Exception;
    public String deleteViaticos_Destinos_Nacionales(Integer idViatDestNac)throws Exception;
    
}
