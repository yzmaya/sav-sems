package sep.gob.mx.sems.ServiceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sep.gob.mx.sems.DAO.OSPN1DAO;
import sep.gob.mx.sems.Model.Destino_ordser;
import sep.gob.mx.sems.Model.Objeto_comision;
import sep.gob.mx.sems.Service.OSPN1Service;

/**
 *
 * @author brayan.padilla
 */
@Service
@Transactional
public class OSPN1ServiceImpl implements OSPN1Service {

    @Autowired
    OSPN1DAO osp1DAO;

    @Transactional
    @Override
    public List<Destino_ordser> listDestinoOrdser() throws Exception {
        return osp1DAO.listDestinoOrdser();
    }

    @Override
    public Destino_ordser getDestinoOrdserByIdOMVI(Integer idOMVI) throws Exception {
        return osp1DAO.getDestinoOrdserByIdOMVI(idOMVI);
    }

    @Override
    public Destino_ordser getDestinoOrdserById(Integer idOrdSer) throws Exception {
        return osp1DAO.getDestinoOrdserById(idOrdSer);
    }

    @Override
    public Destino_ordser updateDestinoOrdser(Destino_ordser destinoOrdSer) throws Exception {
        return osp1DAO.updateDestinoOrdser(destinoOrdSer);
    }

    @Transactional
    @Override
    public void saveDestinoOrdser(Destino_ordser destOrd) throws Exception {
        osp1DAO.saveDestinoOrdser(destOrd);
    }

    @Transactional
    @Override
    public void deleteDestinoOrdser(Integer idOrdSer) throws Exception {
        osp1DAO.deleteDestinoOrdser(idOrdSer);
    }

    @Transactional
    @Override
    public List<Objeto_comision> listObjetoComision() throws Exception {
        return osp1DAO.listObjetoComision();
    }

    @Override
    public Objeto_comision getObjetoComisionByIdOMVI(Integer idOMVI) throws Exception {
        return osp1DAO.getObjetoComisionByIdOMVI(idOMVI);
    }

    @Override
    public Objeto_comision getObjetoComisionById(Integer idObjComis) throws Exception {
        return osp1DAO.getObjetoComisionById(idObjComis);
    }

    @Override
    public Objeto_comision updateObjetoComision(Objeto_comision objComis) throws Exception {
        return osp1DAO.updateObjetoComision(objComis);
    }

    @Transactional
    @Override
    public void saveObjetoComision(Objeto_comision objCom) throws Exception {
        osp1DAO.saveObjetoComision(objCom);
    }

    @Transactional
    @Override
    public void deleteObjetoComision(Integer idObjComis) throws Exception {
        osp1DAO.deleteObjetoComision(idObjComis);
    }
}