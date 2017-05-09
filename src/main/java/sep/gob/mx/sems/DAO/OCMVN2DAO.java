package sep.gob.mx.sems.DAO;

import java.util.List;
import sep.gob.mx.sems.Model.Destinos_viat_nac;
import sep.gob.mx.sems.Model.ViaticosDestinos;
import sep.gob.mx.sems.Model.Viaticos_nacionales;
/**
 *
 * @author brayan.padilla
 */
public interface OCMVN2DAO {
    
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
    
    public ViaticosDestinos getViaticosDestinosById (Integer IdViatDest)throws Exception;
    public ViaticosDestinos getViaticosDestinosByIdOMVI (Integer IdOMVI)throws Exception;
    public ViaticosDestinos updateViaticosDestinos(ViaticosDestinos viatDest)throws Exception;
    public String saveViaticosDestinos(ViaticosDestinos viatDest)throws Exception;
    public String deleteViaticosDestinos(Integer idViatDest)throws Exception;
    
}
