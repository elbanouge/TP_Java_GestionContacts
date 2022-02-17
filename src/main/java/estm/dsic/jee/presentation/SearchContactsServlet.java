package estm.dsic.jee.presentation;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class SearchBooksServlet
 */
@WebServlet("/SearchContactsServlet")
public class SearchContactsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ContactServices contactServices;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchContactsServlet() {
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

		ArrayList<Contact> conList = null;
		HttpSession session = request.getSession();
		String val = request.getParameter("ValS");
		User user = (User) session.getAttribute("user");

		if (val != null) {
			conList = contactServices.getAll(val, user.getId());
			session.setAttribute("CONTACT_LIST", conList);
		}

		response.sendRedirect("jsp/welcome.jsp?value=" + val);
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
