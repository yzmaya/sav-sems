package sep.gob.mx.sems.Service;

import java.util.List;
import sep.gob.mx.sems.Model.Destino_ordser;
import sep.gob.mx.sems.Model.Objeto_comision;
/**
 *
 * @author brayan.padilla
 */
public interface OSPN1Service {
    
   public List<Destino_ordser> listDestinoOrdser()throws Exception;
    public Destino_ordser getDestinoOrdserByIdOMVI(Integer idOMVI)throws Exception;
    public Destino_ordser getDestinoOrdserById(Integer idOrdSer)throws Exception;
    public Destino_ordser updateDestinoOrdser(Destino_ordser destinoOrdSer)throws Exception;
    public void saveDestinoOrdser(Destino_ordser destOrd)throws Exception;
    public void deleteDestinoOrdser(Integer idOrdSer)throws Exception;
    
    public List<Objeto_comision> listObjetoComision()throws Exception;
    public Objeto_comision getObjetoComisionByIdOMVI(Integer idOMVI)throws Exception;
    public Objeto_comision getObjetoComisionById(Integer idObjComis)throws Exception;
    public Objeto_comision updateObjetoComision(Objeto_comision objComis)throws Exception;
    public void saveObjetoComision(Objeto_comision objCom)throws Exception;
    public void deleteObjetoComision(Integer idObjComis)throws Exception;
}
