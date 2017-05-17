/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sep.gob.mx.sems.ServiceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sep.gob.mx.sems.DAO.OmviDAO;
import sep.gob.mx.sems.Model.OMVI;
import sep.gob.mx.sems.Model.TablaOmvi;
import sep.gob.mx.sems.Service.OmviServ;

/**
 *
 * @author brayan.padilla
 */
@Service
@Transactional
public class OmviServImp implements OmviServ{
    
    @Autowired
    OmviDAO omviDAO;
    
    @Transactional
    @Override
    public List<TablaOmvi> listaTablaOmvi() throws Exception {
        return omviDAO.listaTablaOmvi();
    }

    @Override
    public OMVI getOMVIById(Integer idOMVI) throws Exception {
        return omviDAO.getOMVIById(idOMVI);
    }

    public String saveOMVI(OMVI omvi) throws Exception {
        omviDAO.saveOMVI(omvi);
        return "Se guardo OMVI correctamente";
    }
    
}
