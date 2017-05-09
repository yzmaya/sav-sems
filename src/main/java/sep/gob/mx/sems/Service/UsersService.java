package sep.gob.mx.sems.Service;

import java.util.List;
import sep.gob.mx.sems.Model.UsuarioComisionado;

public interface UsersService {
	
	public List<UsuarioComisionado> listUsuarios()throws Exception;
        public UsuarioComisionado updateUsuario(UsuarioComisionado user)throws Exception;
	public UsuarioComisionado getUsuario(Integer idUser)throws Exception;
	public String saveUsuario(UsuarioComisionado user)throws Exception;
	public String deleteUsuario(Integer idUser)throws Exception;

}
