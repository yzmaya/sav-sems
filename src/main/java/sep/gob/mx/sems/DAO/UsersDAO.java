package sep.gob.mx.sems.DAO;

import java.util.List;
import sep.gob.mx.sems.Model.ListaTablaConciliacion;
import sep.gob.mx.sems.Model.UsuarioComisionado;

public interface UsersDAO {
	
        public List<UsuarioComisionado> listUsuarios()throws Exception;
        public UsuarioComisionado updateUsuario(UsuarioComisionado user)throws Exception;
	public UsuarioComisionado getUsuario(Integer idUser)throws Exception;
	public String saveUsuario(UsuarioComisionado user)throws Exception;
	public String deleteUsuario(Integer idUser)throws Exception;
	public List<ListaTablaConciliacion> getTablaConciliacion()throws Exception;

}
