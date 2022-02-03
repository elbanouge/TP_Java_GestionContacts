package estm.dsic.jee.business;

import estm.dsic.jee.dal.User;

public interface IUserServices {
	public boolean auth(User u);

	public User save(String email, String pass);
}
