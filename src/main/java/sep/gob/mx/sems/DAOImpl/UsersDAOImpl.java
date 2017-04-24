package sep.gob.mx.sems.DAOImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sep.gob.mx.sems.DAO.UsersDAO;
import sep.gob.mx.sems.Model.Users;

@Repository
public class UsersDAOImpl implements UsersDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addUser(Users user) throws Exception {
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Users> listUsers() throws Exception {
		return sessionFactory.getCurrentSession().createQuery("from Users").list();
	}

	@Override
	public void deleteUser(Integer idUser) throws Exception {
		Users user = (Users)sessionFactory.getCurrentSession().load(Users.class, idUser);
		if(null != user)this.sessionFactory.getCurrentSession().delete(user);
	}

	@Override
	public Users updateUser(Users user) throws Exception {
		sessionFactory.getCurrentSession().update(user);
		return user;
	}

	@Override
	public Users getUser(int idUser) throws Exception {
		return (Users)sessionFactory.getCurrentSession().get(Users.class, idUser);
	}
}
