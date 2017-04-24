package sep.gob.mx.sems.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sep.gob.mx.sems.DAO.OmviDAO;
import sep.gob.mx.sems.Model.TablaOmvi;
import sep.gob.mx.sems.Service.OmviService;

@Service
@Transactional
public class OmviServiceImpl implements OmviService{
	
	@Autowired
	OmviDAO omviDAO;

	@Override
	@Transactional
	public List<TablaOmvi> llenaTablaOmvi() throws Exception {
		return omviDAO.llenaTablaOmvi();
	}

}
