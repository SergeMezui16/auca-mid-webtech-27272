package controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.User;
import repository.MembershipRepository;

@WebServlet("/memberships")
public class MembershipServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null)
			action = "list";

		switch (action) {
		case "list":
		default:
			this.list(request, response);
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		switch (action) {
		case "ask":
			post(request, response);
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		case "reject":
			reject(request, response);
			break;
		case "approve":
			approve(request, response);
			break;
		}

		response.sendRedirect(request.getContextPath() + "/memberships");
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("memberships", MembershipRepository.findAll());
		request.getRequestDispatcher("/WEB-INF/views/memberships/index.jsp").forward(request, response);
	}

	private void post(HttpServletRequest request, HttpServletResponse response) {
		UUID type = UUID.fromString(request.getParameter("type"));
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		MembershipRepository.ask(user, type);
	}

	private void reject(HttpServletRequest request, HttpServletResponse response) {
		UUID id = UUID.fromString(request.getParameter("id"));

		MembershipRepository.reject(id);
	}

	private void approve(HttpServletRequest request, HttpServletResponse response) {
		UUID id = UUID.fromString(request.getParameter("id"));

		MembershipRepository.approve(id);
	}
}
