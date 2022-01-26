package estm.dsic.jee.presentation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import estm.dsic.jee.dal.Contact;
import estm.dsic.jee.dal.ContactDao;
import estm.dsic.jee.dal.DBConnection;

/**
 * Servlet implementation class EditBooksServlet
 */
@WebServlet("/EditBooksServlet")
public class EditBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditBooksServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int id = Integer.parseInt(request.getParameter("bkid"));
		String name = request.getParameter("bkname");
		String adresse = request.getParameter("bkdes");
		String email = request.getParameter("authname");
		String tel = request.getParameter("category");
		Contact contact = new Contact(id, name, adresse, email, tel);
		try {
			ContactDao contactDao = new ContactDao(DBConnection.getConnection());
			if (contactDao.modCon(contact)) {
				response.sendRedirect("jsp/welcome.jsp");
			} else {
				System.out.print("wrong cre3dential");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
