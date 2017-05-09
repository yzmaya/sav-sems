/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sep.gob.mx.sems.Service;

import java.util.List;
import sep.gob.mx.sems.Model.OMVI;
import sep.gob.mx.sems.Model.TablaOmvi;

/**
 *
 * @author brayan.padilla
 */
public interface OmviServ {
    
    public List<TablaOmvi> listaTablaOmvi()throws Exception;
        public OMVI getOMVIById(Integer idOMVI)throws Exception;
    
}
