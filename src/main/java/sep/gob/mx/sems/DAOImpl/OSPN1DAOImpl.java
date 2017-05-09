/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sep.gob.mx.sems.DAOImpl;

import sep.gob.mx.sems.DAO.OSPN1DAO;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import sep.gob.mx.sems.Model.Destino_ordser;
import sep.gob.mx.sems.Model.Objeto_comision;

/**
 *
 * @author brayan.padilla
 */
@Repository
public class OSPN1DAOImpl implements OSPN1DAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Destino_ordser> listDestinoOrdser() throws Exception {
        return sessionFactory.getCurrentSession().createQuery("from Destino_ordser").list();
    }

    @Override
    public Destino_ordser getDestinoOrdserByIdOMVI(Integer idOMVI) throws Exception {
        return (Destino_ordser) sessionFactory.getCurrentSession().createQuery("from Destino_ordser where Id_OMVI=" + idOMVI);
    }

    @Override
    public Destino_ordser getDestinoOrdserById(Integer idOrdSer) throws Exception {
        return (Destino_ordser) sessionFactory.getCurrentSession().get(Destino_ordser.class, idOrdSer);
    }

    @Override
    public Destino_ordser updateDestinoOrdser(Destino_ordser destinoOrdSer) throws Exception {
        sessionFactory.getCurrentSession().update(destinoOrdSer);
        return destinoOrdSer;
    }

    @Override
    public String saveDestinoOrdser(Destino_ordser destOrd) throws Exception {
        sessionFactory.getCurrentSession().saveOrUpdate(destOrd);
        return "Se guardo DestinoOrdSer";
    }

    @Override
    public String deleteDestinoOrdser(Integer idOrdSer) throws Exception {
        Destino_ordser dest = (Destino_ordser) sessionFactory.getCurrentSession().load(Destino_ordser.class, idOrdSer);
        if (dest != null)this.sessionFactory.getCurrentSession().delete(dest);
        return "Se borro DestinoOrdSer";
    }

    @Override
    public List<Objeto_comision> listObjetoComision() throws Exception {
        return sessionFactory.getCurrentSession().createQuery("from Objeto_comision").list();
    }

    @Override
    public Objeto_comision getObjetoComisionByIdOMVI(Integer idOMVI) throws Exception {
        return (Objeto_comision) sessionFactory.getCurrentSession().createQuery("from Objeto_comision where Id_OMVI=" + idOMVI);
    }

    @Override
    public Objeto_comision getObjetoComisionById(Integer idObjComis) throws Exception {
        return (Objeto_comision) sessionFactory.getCurrentSession().get(Objeto_comision.class, idObjComis);
    }

    @Override
    public Objeto_comision updateObjetoComision(Objeto_comision objComis) throws Exception {
        sessionFactory.getCurrentSession().update(objComis);
        return objComis;
    }

    @Override
    public String saveObjetoComision(Objeto_comision objCom) throws Exception {
        sessionFactory.getCurrentSession().saveOrUpdate(objCom);
        return "Se guardo Objeto Comision";
    }

    @Override
    public String deleteObjetoComision(Integer idObjComis) throws Exception {
        Objeto_comision obj = (Objeto_comision) sessionFactory.getCurrentSession().load(Objeto_comision.class, idObjComis);
        if (obj != null)this.sessionFactory.getCurrentSession().delete(obj);
        return "Se borro Objeto Comision";
    }
}