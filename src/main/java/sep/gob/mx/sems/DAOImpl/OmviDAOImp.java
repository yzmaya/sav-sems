/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sep.gob.mx.sems.DAOImpl;

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
public class OmviDAOImp implements OmviDAO{

    @Autowired
    SessionFactory sessionFactory;
    
    @Override
    public List<TablaOmvi> listaTablaOmvi() throws Exception {
		return sessionFactory.getCurrentSession().createQuery(""
+"select distinct omvi.Id_OMVI, usr.Ap_Paterno, usr.Ap_Materno, usr.Nombre_s, usr.Area_Adscripcion, objCom.Motivo_Comision, viatNac.Total_Importe "+
"from OMVI omvi, UsuarioComisionado as usr,Objeto_comision as objCom, Viaticos_nacionales as viatNac "+
"where omvi.Id_UsrCom=usr.Id_UsrCom and viatNac.Id_Viaticos=(select Id_Viaticos from ViaticosDestinos as viatDest "+
"where omvi.Id_OMVI=viatDest.Id_OMVI)").list();
    }

    @Override
    public OMVI getOMVIById(Integer idOMVI) throws Exception {
        return(OMVI)sessionFactory.getCurrentSession().get(OMVI.class, idOMVI);
    }
    
}
