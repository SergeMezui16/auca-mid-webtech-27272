package controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.MembershipType;
import repository.MembershipTypeRepository;

@WebServlet("/membership_types")
public class MembershipTypeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null)
			action = "list";

		switch (action) {
		case "new":
			request.getRequestDispatcher("/WEB-INF/views/membership_types/new.jsp").forward(request, response);
			break;
		case "edit":
			request.setAttribute("membershipType", findBookById(request));
			request.getRequestDispatcher("/WEB-INF/views/membership_types/edit.jsp").forward(request, response);
			break;
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
		case "create":
			post(request, response);
			break;
		case "update":
			put(request, response);
			break;
		case "delete":
			delete(request, response);
			break;
		}

		response.sendRedirect(request.getContextPath() + "/membership_types");
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("membershipTypes", MembershipTypeRepository.findAll());
		request.getRequestDispatcher("/WEB-INF/views/membership_types/index.jsp").forward(request, response);
	}

	private MembershipType findBookById(HttpServletRequest request) {
		return MembershipTypeRepository.findById(UUID.fromString(request.getParameter("id")));
	}

	private void post(HttpServletRequest request, HttpServletResponse response) {
		MembershipTypeRepository.create(Integer.parseInt(request.getParameter("maxBooks")),request.getParameter("name"), 
				Integer.parseInt(request.getParameter("price")));
	}

	private void put(HttpServletRequest request, HttpServletResponse response) {
		UUID id = UUID.fromString(request.getParameter("id"));

		if (id != null)
			MembershipTypeRepository.update(id,Integer.parseInt(request.getParameter("maxBooks")),request.getParameter("name"), 
					Integer.parseInt(request.getParameter("price")));
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		UUID id = UUID.fromString(request.getParameter("id"));

		if (id != null)
			MembershipTypeRepository.delete(id);
	}

}
