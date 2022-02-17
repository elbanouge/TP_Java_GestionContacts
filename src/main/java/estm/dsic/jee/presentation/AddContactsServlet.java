package estm.dsic.jee.presentation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import estm.dsic.jee.business.ContactServices;
import estm.dsic.jee.dal.Contact;
import estm.dsic.jee.dal.User;

/**
 * Servlet implementation class AddBooksServlet
 */
@WebServlet("/AddContactsServlet")
public class AddContactsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ContactServices contactServices;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddContactsServlet() {
		super();
		// TODO Auto-generated constructor stub
		contactServices = new ContactServices();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		String name = request.getParameter("conName");
		String adresse = request.getParameter("conAdr");
		String email = request.getParameter("conEmail");
		String tel = request.getParameter("conTel");

		Contact contact = new Contact(name, adresse, email, tel, user.getId());

		try {

			if (contactServices.add(contact)) {
				response.sendRedirect("jsp/welcome.jsp");
			} else {
				System.out.println("Erreur !!!");
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
