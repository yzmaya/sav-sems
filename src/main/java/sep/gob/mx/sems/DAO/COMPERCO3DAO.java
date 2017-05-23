package sep.gob.mx.sems.DAO;

import java.util.List;
import sep.gob.mx.sems.Model.COMPERCO;
import sep.gob.mx.sems.Model.CompercoItinerario;
import sep.gob.mx.sems.Model.Itinerario;
/**
 *
 * @author brayan.padilla
 */
public interface COMPERCO3DAO {
    
    public List<Itinerario> listItinerario()throws Exception;
    public Itinerario getItinerarioById(Integer idItinerario)throws Exception;
    public Itinerario getItinerarioByIdOMVI(Integer idOMVI)throws Exception;
    public Itinerario updateItinerario(Itinerario itinerario)throws Exception;
    public String saveItinerario(Itinerario itinerario)throws Exception;
    public String deleteItinerario(Integer idItinerario)throws Exception;
    
    public List<COMPERCO> listCOMPERCO()throws Exception;
    public COMPERCO getCOMPERCOById(Integer idCOMPERCO)throws Exception;
    public COMPERCO getCOMPERCOByIdOMVI(Integer idOMVI)throws Exception;
    public COMPERCO updateCOMPERCO(COMPERCO comperco)throws Exception;
    public String saveCOMPERCO(COMPERCO comperco)throws Exception;
    public String deleteCOMPERCO(Integer idCOMPERCO)throws Exception;
    
    public CompercoItinerario getCompercoItinerarioById(Integer idCompItin)throws Exception;
    public List<CompercoItinerario> getListCompercoItinerarioByIdComperco(Integer idCOMPERCO)throws Exception;
    public List<CompercoItinerario> getCompercoItinerarioByIdOMVI(Integer idOMVI)throws Exception;
    public CompercoItinerario updateCompercoItinerario(CompercoItinerario compItin)throws Exception;
    public String saveCompercoItinerario(CompercoItinerario compItin)throws Exception;
    public String deleteCompercoItinerario(Integer idCompItin)throws Exception;
    
}
