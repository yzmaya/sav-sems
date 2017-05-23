/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sep.gob.mx.sems.ServiceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sep.gob.mx.sems.DAO.CatalogosDAO;
import sep.gob.mx.sems.Model.Cat_partidas;
import sep.gob.mx.sems.Model.Cat_puesto;
import sep.gob.mx.sems.Model.Cat_unidad_responsable;
import sep.gob.mx.sems.Service.CatalogosService;

/**
 *
 * @author brayan.padilla
 */

@Service
@Transactional
public class CatalogosServiceImpl implements CatalogosService{
    
    @Autowired
    CatalogosDAO catalogosDAO;
    
    @Override
    @Transactional
    public List<Cat_partidas> getCatPartidas() throws Exception {
        return catalogosDAO.getCatPartidas();
    }
    
    @Override
    @Transactional
    public List<Cat_puesto> getCatPuesto() throws Exception {
        return catalogosDAO.getCatPuesto();
    }
    
    @Override
    @Transactional
    public List<Cat_unidad_responsable> getCatUR() throws Exception {
        return catalogosDAO.getCatUR();
    }

    @Override
    @Transactional
    public Cat_puesto getPuestoById(Integer idPuesto) throws Exception {
        return catalogosDAO.getPuestoById(idPuesto);
    }
    
}
