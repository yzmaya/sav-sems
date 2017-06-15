package sep.gob.mx.sems.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sep.gob.mx.sems.DAO.UsersDAO;
import sep.gob.mx.sems.Model.ListaTablaConciliacion;
import sep.gob.mx.sems.Model.UsuarioComisionado;
import sep.gob.mx.sems.Service.UsersService;

@Service
@Transactional
public class UsersServiceImpl implements UsersService {

    @Autowired
    UsersDAO usersDAO;

    @Override
    @Transactional
    public List<UsuarioComisionado> listUsuarios() throws Exception {
        return usersDAO.listUsuarios();
    }

    @Override
    public UsuarioComisionado updateUsuario(UsuarioComisionado user) throws Exception {
        return usersDAO.updateUsuario(user);
    }

    @Override
    public UsuarioComisionado getUsuario(Integer idUser) throws Exception {
        return usersDAO.getUsuario(idUser);
    }

    @Override
    @Transactional
    public String saveUsuario(UsuarioComisionado user) throws Exception {
        return usersDAO.saveUsuario(user);
    }

    @Override
    @Transactional
    public String deleteUsuario(Integer idUser) throws Exception {
        return usersDAO.deleteUsuario(idUser);
    }

    @Override
    @Transactional
    public List<ListaTablaConciliacion> getTablaConciliacion() throws Exception {
        return usersDAO.getTablaConciliacion();
    }
}
