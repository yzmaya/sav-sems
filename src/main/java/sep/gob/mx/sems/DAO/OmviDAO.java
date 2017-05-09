package sep.gob.mx.sems.DAO;

import java.util.List;
import sep.gob.mx.sems.Model.OMVI;

import sep.gob.mx.sems.Model.TablaOmvi;

public interface OmviDAO {
	
	public List<TablaOmvi> listaTablaOmvi()throws Exception;
        public OMVI getOMVIById(Integer idOMVI)throws Exception;

}
