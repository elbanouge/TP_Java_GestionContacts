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
@WebServlet("/EditContactServlet")
public class EditContactsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditContactsServlet() {
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

		int id = Integer.parseInt(request.getParameter("conID"));
		String name = request.getParameter("conName");
		String adresse = request.getParameter("conAdr");
		String email = request.getParameter("conEmail");
		String tel = request.getParameter("conTel");
		Contact contact = new Contact(id, name, adresse, email, tel);
		try {
			ContactDao contactDao = new ContactDao(DBConnection.getConnection());
			if (contactDao.modCon(contact)) {
				response.sendRedirect("jsp/welcome.jsp");
			} else {
				System.out.print("Erreur !!!");
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
