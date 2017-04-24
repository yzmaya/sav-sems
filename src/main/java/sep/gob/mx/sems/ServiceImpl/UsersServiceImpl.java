package sep.gob.mx.sems.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sep.gob.mx.sems.DAO.UsersDAO;
import sep.gob.mx.sems.Model.Users;
import sep.gob.mx.sems.Service.UsersService;

@Service
@Transactional
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	UsersDAO usersDAO;

	@Override
	@Transactional
	public void addUser(Users user) throws Exception {
		usersDAO.addUser(user);
	}

	@Override
	@Transactional
	public List<Users> listUsers() throws Exception {
		return usersDAO.listUsers();
	}

	@Override
	@Transactional
	public void deleteUser(Integer idUser) throws Exception {
		usersDAO.deleteUser(idUser);
	}

	@Override
	public Users updateUser(Users user) throws Exception {
		return usersDAO.updateUser(user);
	}

	@Override
	public Users getUserById(int idUser) throws Exception {
		return usersDAO.getUser(idUser);
	}
	
	public void setUsersDAO(UsersDAO usersDAO){
		this.usersDAO=usersDAO;
	}

}
