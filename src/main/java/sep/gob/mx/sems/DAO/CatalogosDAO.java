package sep.gob.mx.sems.DAO;

import java.util.List;
import sep.gob.mx.sems.Model.Cat_partidas;
import sep.gob.mx.sems.Model.Cat_puesto;
import sep.gob.mx.sems.Model.Cat_unidad_responsable;

/**
 *
 * @author brayan.padilla
 */
public interface CatalogosDAO {
    
    public List<Cat_partidas> getCatPartidas()throws Exception;
    public List<Cat_puesto> getCatPuesto()throws Exception;
    public List<Cat_unidad_responsable> getCatUR()throws Exception;
    
}
