package estm.dsic.jee.dal;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {
	public static Connection getConnection() {
		Connection connection = null;

		try {

			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/gestioncontacts");
			connection = dataSource.getConnection();

			// Class.forName("com.mysql.cj.jdbc.Driver");
			// connection =
			// DriverManager.getConnection("jdbc:mysql://localhost:3306/gestioncontacts",
			// "root", "admin");
			System.out.println("Connection succes");

		} catch (SQLException | NamingException ex) {
			ex.printStackTrace();
		}

		return connection;
	}
}
