package sep.gob.mx.sems.DAO;

import java.util.List;

import sep.gob.mx.sems.Model.Users;

public interface UsersDAO {
	
	public void addUser(Users user)throws Exception;
	public List<Users> listUsers()throws Exception;
	public void deleteUser(Integer idUser)throws Exception;
	public Users updateUser(Users user)throws Exception;
	public Users getUser(int idUser)throws Exception;

}
