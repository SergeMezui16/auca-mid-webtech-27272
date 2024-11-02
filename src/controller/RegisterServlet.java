package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Gender;
import entity.Role;
import entity.User;
import repository.LocationRepository;
import repository.UserRepository;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("locations", LocationRepository.findAllVillages());
		request.setAttribute("roles", Arrays.asList(Role.values()).stream().filter(r -> r.equals(Role.TEACHER) || r.equals(Role.STUDENT)).toArray());
		request.setAttribute("genders", Gender.values());
		request.getRequestDispatcher("/WEB-INF/views/security/register.jsp").forward(request, response);
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = UserRepository.findById(request.getParameter("username"));

		if (user == null) {
			UserRepository.create(request.getParameter("username"), request.getParameter("firstname"),
					Gender.valueOf(request.getParameter("gender")), request.getParameter("lastname"),
					request.getParameter("phone"), request.getParameter("password"),
					Role.valueOf(request.getParameter("role")), UUID.fromString(request.getParameter("villageId")));

			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		
		request.setAttribute("errorMessage", "This username (" + request.getParameter("username") + ") is already taken by another user.");
		request.setAttribute("locations", LocationRepository.findAllVillages());
		request.setAttribute("roles", Arrays.asList(Role.values()).stream().filter(r -> r.equals(Role.TEACHER) || r.equals(Role.STUDENT)).toArray());
		request.setAttribute("genders", Gender.values());
		request.getRequestDispatcher("/WEB-INF/views/security/register.jsp").forward(request, response);
	}
}
