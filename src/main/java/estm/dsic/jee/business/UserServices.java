package estm.dsic.jee.business;

import java.sql.Connection;

import estm.dsic.jee.dal.User;
import estm.dsic.jee.dal.UserDao;

public class UserServices implements IUserServices {

	private UserDao dao;

	public UserServices() {
		Connection con = null;
		dao = new UserDao(con);
	}

	@Override
	public boolean auth(User u) {
		// TODO Auto-generated method stub
		return dao.saveUser(u);
	}

	@Override
	public User save(String email, String pass) {
		// TODO Auto-generated method stub
		return dao.login(email, pass);
	}

}
