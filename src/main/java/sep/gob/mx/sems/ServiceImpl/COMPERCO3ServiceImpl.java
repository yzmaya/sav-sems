package sep.gob.mx.sems.ServiceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sep.gob.mx.sems.DAO.COMPERCO3DAO;
import sep.gob.mx.sems.Model.COMPERCO;
import sep.gob.mx.sems.Model.CompercoItinerario;
import sep.gob.mx.sems.Model.Itinerario;
import sep.gob.mx.sems.Service.COMPERCO3Service;
/**
 *
 * @author brayan.padilla
 */
@Service
@Transactional
public class COMPERCO3ServiceImpl implements COMPERCO3Service{
    
    @Autowired
    COMPERCO3DAO compercoDAO;

    @Transactional
    @Override
    public List<Itinerario> listItinerario() throws Exception {
        return compercoDAO.listItinerario();
    }

    @Override
    public Itinerario getItinerarioById(Integer idItinerario) throws Exception {
        return compercoDAO.getItinerarioById(idItinerario);
    }

    @Override
    public Itinerario getItinerarioByIdOMVI(Integer idOMVI) throws Exception {
        return compercoDAO.getItinerarioByIdOMVI(idOMVI);
    }

    @Override
    public Itinerario updateItinerario(Itinerario itinerario) throws Exception {
        return compercoDAO.updateItinerario(itinerario);
    }

    @Transactional
    @Override
    public String saveItinerario(Itinerario itinerario) throws Exception {
        return compercoDAO.saveItinerario(itinerario);
    }

    @Transactional
    @Override
    public String deleteItinerario(Integer idItinerario) throws Exception {
        return compercoDAO.deleteItinerario(idItinerario);
    }

    @Transactional
    @Override
    public List<COMPERCO> listCOMPERCO() throws Exception {
        return compercoDAO.listCOMPERCO();
    }

    @Override
    public COMPERCO getCOMPERCOById(Integer idCOMPERCO) throws Exception {
        return compercoDAO.getCOMPERCOById(idCOMPERCO);
    }

    @Override
    public COMPERCO getCOMPERCOByIdOMVI(Integer idOMVI) throws Exception {
        return compercoDAO.getCOMPERCOByIdOMVI(idOMVI);
    }

    @Override
    public COMPERCO updateCOMPERCO(COMPERCO comperco) throws Exception {
        return compercoDAO.updateCOMPERCO(comperco);
    }

    @Transactional
    @Override
    public String saveCOMPERCO(COMPERCO comperco) throws Exception {
        return compercoDAO.saveCOMPERCO(comperco);
    }

    @Transactional
    @Override
    public String deleteCOMPERCO(Integer idCOMPERCO) throws Exception {
        return compercoDAO.deleteCOMPERCO(idCOMPERCO);
    }

    @Override
    public CompercoItinerario getCompercoItinerarioByIdOMVI(Integer idOMVI) throws Exception {
        return compercoDAO.getCompercoItinerarioByIdOMVI(idOMVI);
    }

    @Override
    public CompercoItinerario updateCompercoItinerario(CompercoItinerario compItin) throws Exception {
        return compercoDAO.updateCompercoItinerario(compItin);
    }

    @Transactional
    @Override
    public String saveCompercoItinerario(CompercoItinerario compItin) throws Exception {
        return compercoDAO.saveCompercoItinerario(compItin);
    }

    @Transactional
    @Override
    public String deleteCompercoItinerario(Integer idCompItin) throws Exception {
        return compercoDAO.deleteCompercoItinerario(idCompItin);
    }

    @Override
    public CompercoItinerario getCompercoItinerarioById(Integer idCompItin) throws Exception {
        return compercoDAO.getCompercoItinerarioById(idCompItin);
    }
    
}