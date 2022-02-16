package estm.dsic.jee.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDao {
	Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

	// for register user
	public boolean saveUser(User user) {
		boolean set = false;
		try {
			// Insert register data to database
			String query = "insert into users(name,email,password) values(?,?,?)";

			PreparedStatement pt = this.con.prepareStatement(query);
			pt.setString(1, user.getName());
			pt.setString(2, user.getEmail());
			pt.setString(3, user.getPassword());

			pt.executeUpdate();
			set = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return set;
	}

	// user login
	public User login(String email, String pass) {
		User usr = null;
		try {
			String query = "select * from users where email=? and password=?";
			PreparedStatement pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, pass);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				usr = new User();
				usr.setId(rs.getInt("id_user"));
				usr.setName(rs.getString("name"));
				usr.setEmail(rs.getString("email"));
				usr.setPassword(rs.getString("password"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return usr;
	}

	public User getUserByName(String val) {
		User user = null;
		String req = "SELECT * FROM `gestioncontacts`.`users` WHERE `name` like '" + val + "';";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(req);

			while (rs.next()) {
				user = new User(rs.getInt("id_user"), rs.getString("name"), rs.getString("email"),
						rs.getString("password"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

}
