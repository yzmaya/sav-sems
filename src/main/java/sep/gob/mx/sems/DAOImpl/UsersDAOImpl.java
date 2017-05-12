package sep.gob.mx.sems.DAOImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sep.gob.mx.sems.DAO.UsersDAO;
import sep.gob.mx.sems.Model.UsuarioComisionado;

@Repository
public class UsersDAOImpl implements UsersDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<UsuarioComisionado> listUsuarios() throws Exception {
        return sessionFactory.getCurrentSession().createQuery("from UsuarioComisionado").list();
    }

    @Override
    public UsuarioComisionado updateUsuario(UsuarioComisionado user) throws Exception {
        sessionFactory.getCurrentSession().update(user);
        return user;
    }

    @Override
    public UsuarioComisionado getUsuario(Integer idUser) throws Exception {
        return (UsuarioComisionado)sessionFactory.getCurrentSession().get(UsuarioComisionado.class, idUser);
    }

    @Override
    public String saveUsuario(UsuarioComisionado user) throws Exception {
        sessionFactory.getCurrentSession().saveOrUpdate(user);
        return "Se guardo Usuario";
    }

    @Override
    public String deleteUsuario(Integer idUser) throws Exception {
        UsuarioComisionado user = (UsuarioComisionado)sessionFactory.getCurrentSession().load(UsuarioComisionado.class, idUser);
        if(null != user)this.sessionFactory.getCurrentSession().delete(user);
        return "Se borro Usuario";
    }
}
