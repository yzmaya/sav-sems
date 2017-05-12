/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sep.gob.mx.sems.DAOImpl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import sep.gob.mx.sems.DAO.OmviDAO;
import sep.gob.mx.sems.Model.OMVI;
import sep.gob.mx.sems.Model.TablaOmvi;

/**
 *
 * @author brayan.padilla
 */
@Component
@Repository
public class OmviDAOImp implements OmviDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<TablaOmvi> listaTablaOmvi() throws Exception {
//        List<OMVIViatNac> listViatNac = sessionFactory.getCurrentSession().createQuery("from OMVIViatNac").list();
////        Viaticos_nacionales viatNac = (Viaticos_nacionales);
//        TablaOmvi tab;
//        List<TablaOmvi> listTab = new ArrayList<TablaOmvi>();
        String query;

//        for (int i = 0; i < listViatNac.size(); i++) {
            query = "select distinct omvi.Id_OMVI, usr.Ap_Paterno, usr.Ap_Materno, usr.Nombre_s, usr.Area_Adscripcion, objCom.Motivo_Comision, viatNac.Total_Importe "
                    + "from OMVI omvi, UsuarioComisionado usr,Objeto_comision objCom, Viaticos_nacionales viatNac, Viaticos_Destinos_Nacionales viatDN "
                    + "where omvi.Id_UsrCom=usr.Id_UsrCom and omvi.Id_Obj_Comision=objCom.Id_Obj_Comision and "
                    + "omvi.Id_Viaticos_Destino = viatDN.Id_Viaticos and viatDN.Id_Viaticos=viatNac.Id_Viaticos";
            
//            tab = (TablaOmvi) sessionFactory.getCurrentSession().createQuery(query);
//            System.out.println("Tab id: "+tab.getId_OMVI());
//            System.out.println("Nombre: "+tab.getAp_Paterno()+tab.getAp_Materno()+tab.getNombre_s());
//            listTab.add(tab);
//        }

        return sessionFactory.getCurrentSession().createQuery(query).list();
    }

    @Override
    public OMVI getOMVIById(Integer idOMVI) throws Exception {
        return (OMVI) sessionFactory.getCurrentSession().get(OMVI.class, idOMVI);
    }
}
