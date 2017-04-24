package sep.gob.mx.sems.Service;

import java.util.List;

import sep.gob.mx.sems.Model.Users;

public interface UsersService {
	
	public void addUser(Users user)throws Exception;
	public List<Users> listUsers()throws Exception;
	public void deleteUser(Integer idUser)throws Exception;
	public Users updateUser(Users user)throws Exception;
	public Users getUserById(int idUser)throws Exception;

}
