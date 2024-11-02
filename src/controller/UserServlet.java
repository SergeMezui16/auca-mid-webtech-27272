package controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import entity.Gender;
import entity.Role;
import entity.User;
import repository.LocationRepository;
import repository.UserRepository;

@WebServlet("/users")
public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null)
			action = "list";

		switch (action) {
		case "new":
			request.setAttribute("locations", LocationRepository.findAllVillages());
			request.setAttribute("roles", Role.values());
			request.setAttribute("genders", Gender.values());
			request.getRequestDispatcher("/WEB-INF/views/users/new.jsp").forward(request, response);
			break;
		case "find":
			this.find(request, response);
			break;
		case "id":
			request.setAttribute("roles", Role.values());
			request.setAttribute("user", findUserById(request));
			request.getRequestDispatcher("/WEB-INF/views/users/id.jsp").forward(request, response);
			break;
		case "password":
			request.setAttribute("user", findUserById(request));
			request.getRequestDispatcher("/WEB-INF/views/users/password.jsp").forward(request, response);
			break;
		case "edit":
			request.setAttribute("user", findUserById(request));
			request.setAttribute("locations", LocationRepository.findAllVillages());
			request.setAttribute("genders", Gender.values());
			request.getRequestDispatcher("/WEB-INF/views/users/edit.jsp").forward(request, response);
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
		case "update_credentials":
			updateCredentials(request, response);
			break;
		case "update_password":
			updatePassword(request, response);
			break;
		case "delete":
			delete(request, response);
			break;
		}

		response.sendRedirect(request.getContextPath() + "/users");
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("users", UserRepository.findAll());
		request.getRequestDispatcher("/WEB-INF/views/users/index.jsp").forward(request, response);
	}

	private void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("phone"));
		User user = null;

		try {
			user = UserRepository.findByPhone(request.getParameter("phone"));
		} catch (Exception e) {
			System.out.println(request.getParameter("phone") + ": Not found.");
		}

		request.setAttribute("result", user);
		request.setAttribute("phone", request.getParameter("phone"));
		request.getRequestDispatcher("/WEB-INF/views/users/find.jsp").forward(request, response);
	}

	private User findUserById(HttpServletRequest request) {
		return UserRepository.findById(request.getParameter("id"));
	}

	private void post(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = UserRepository.findById(request.getParameter("username"));

		if (user == null) {
			UserRepository.create(request.getParameter("username"), request.getParameter("firstname"),
					Gender.valueOf(request.getParameter("gender")), request.getParameter("lastname"),
					request.getParameter("phone"), request.getParameter("password"),
					Role.valueOf(request.getParameter("role")), UUID.fromString(request.getParameter("villageId")));
			return;
		}
		
		request.setAttribute("errorMessage", "This username (" + request.getParameter("username") + ") is already taken by another user.");
		request.setAttribute("locations", LocationRepository.findAllVillages());
		request.setAttribute("roles", Role.values());
		request.setAttribute("genders", Gender.values());
		request.getRequestDispatcher("/WEB-INF/views/users/new.jsp").forward(request, response);
	}

	private void put(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");

		if (id == null)
			return;

		UserRepository.updateProfile(id, request.getParameter("firstname"),
				Gender.valueOf(request.getParameter("gender")), request.getParameter("lastname"),
				request.getParameter("phone"), UUID.fromString(request.getParameter("villageId")));

	}

	private void updateCredentials(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");

		if (id == null)
			return;

		System.out.println(request.getParameter("role") + "  " + request.getParameter("username"));
		UserRepository.updateCredentials(id, Role.valueOf(request.getParameter("role")));
	}

	private void updatePassword(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");

		if (id == null)
			return;

		UserRepository.updatePassword(id, request.getParameter("password"));
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");

		if (id != null)
			UserRepository.delete(id);
	}

}
