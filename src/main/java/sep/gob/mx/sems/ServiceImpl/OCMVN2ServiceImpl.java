package sep.gob.mx.sems.ServiceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sep.gob.mx.sems.DAO.OCMVN2DAO;
import sep.gob.mx.sems.Model.Destinos_viat_nac;
import sep.gob.mx.sems.Model.ViaticosDestinos;
import sep.gob.mx.sems.Model.Viaticos_nacionales;
import sep.gob.mx.sems.Service.OCMVN2Service;
/**
 *
 * @author brayan.padilla
 */
@Service
@Transactional
public class OCMVN2ServiceImpl implements OCMVN2Service{
    
    @Autowired
    OCMVN2DAO ocmvn2DAO;

    @Transactional
    @Override
    public List<Destinos_viat_nac> listDestViatNac() throws Exception {
        return ocmvn2DAO.listDestViatNac();
    }

    @Override
    public Destinos_viat_nac getDestViatNacById(Integer idDestViatNac) throws Exception {
        return ocmvn2DAO.getDestViatNacById(idDestViatNac);
    }

    @Override
    public Destinos_viat_nac getDestViatNacByIdOMVI(Integer idViatDestIdDestino) throws Exception {
        return ocmvn2DAO.getDestViatNacByIdOMVI(idViatDestIdDestino);
    }

    @Override
    public Destinos_viat_nac updateDestViatNac(Destinos_viat_nac destViatNac) throws Exception {
        return ocmvn2DAO.updateDestViatNac(destViatNac);
    }

    @Transactional
    @Override
    public String saveDestViatNac(Destinos_viat_nac destViatNac) throws Exception {
        return ocmvn2DAO.saveDestViatNac(destViatNac);
    }

    @Transactional
    @Override
    public String deleteDestViatNac(Integer idDestViatNac) throws Exception {
        return ocmvn2DAO.deleteDestViatNac(idDestViatNac);
    }

    @Transactional
    @Override
    public List<Viaticos_nacionales> listViaticosNacionales() throws Exception {
        return ocmvn2DAO.listViaticosNacionales();
    }

    @Override
    public Viaticos_nacionales getViaticos_nacionalesById(Integer idViatNac) throws Exception {
        return ocmvn2DAO.getViaticos_nacionalesById(idViatNac);
    }

    @Override
    public Viaticos_nacionales getViatNacByIdOMVI(Integer idOMVI) throws Exception {
        return ocmvn2DAO.getViatNacByIdOMVI(idOMVI);
    }

    @Override
    public Viaticos_nacionales updateViaticos_nacionales(Viaticos_nacionales viatNac) throws Exception {
        return ocmvn2DAO.updateViaticos_nacionales(viatNac);
    }

    @Transactional
    @Override
    public String saveViaticos_nacionales(Viaticos_nacionales viatNac) throws Exception {
        return ocmvn2DAO.saveViaticos_nacionales(viatNac);
    }

    @Transactional
    @Override
    public String deleteViaticos_nacionales(Integer idViatNac) throws Exception {
        return ocmvn2DAO.deleteViaticos_nacionales(idViatNac);
    }

    @Override
    public ViaticosDestinos getViaticosDestinosByIdOMVI(Integer IdOMVI) throws Exception {
        return ocmvn2DAO.getViaticosDestinosByIdOMVI(IdOMVI);
    }

    @Override
    public ViaticosDestinos updateViaticosDestinos(ViaticosDestinos viatDest) throws Exception {
        return ocmvn2DAO.updateViaticosDestinos(viatDest);
    }

    @Transactional
    @Override
    public String saveViaticosDestinos(ViaticosDestinos viatDest) throws Exception {
        return ocmvn2DAO.saveViaticosDestinos(viatDest);
    }

    @Transactional
    @Override
    public String deleteViaticosDestinos(Integer idViatDest) throws Exception {
        return ocmvn2DAO.deleteViaticosDestinos(idViatDest);
    }

    @Override
    public ViaticosDestinos getviaticosDestinosById(Integer idViatDest) throws Exception {
        return ocmvn2DAO.getViaticosDestinosById(idViatDest);
    }
    
}
