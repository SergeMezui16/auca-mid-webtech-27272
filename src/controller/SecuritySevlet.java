package controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Gender;
import entity.User;
import repository.LocationRepository;
import repository.UserRepository;
import utils.SessionManager;

@WebServlet("/security")
public class SecuritySevlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null)
			action = "profile";

		switch (action) {
		case "password":
			request.getRequestDispatcher("/WEB-INF/views/security/password.jsp").forward(request, response);
			break;
		case "edit":
			request.setAttribute("locations", LocationRepository.findAllVillages());
			request.setAttribute("genders", Gender.values());
			request.getRequestDispatcher("/WEB-INF/views/security/edit.jsp").forward(request, response);
			break;
		case "profile":
			request.getRequestDispatcher("/WEB-INF/views/security/profile.jsp").forward(request, response);
			break;
		case "books":
			request.setAttribute("borrowers", SessionManager.getAuth(request).getBorrowers());
			request.getRequestDispatcher("/WEB-INF/views/security/books.jsp").forward(request, response);
			break;
		default:
			response.sendRedirect(request.getContextPath() + "/");
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		switch (action) {
		case "password":
			changePassword(request, response);
			break;
		case "edit":
			put(request, response);
			break;
		case "logout":
			logout(request, response);
			break;
		}

		response.sendRedirect(request.getContextPath() + "/");
	}

	private void put(HttpServletRequest request, HttpServletResponse response) {
        User user = SessionManager.getAuth(request);

		user = UserRepository.updateProfile(user.getUsername(), request.getParameter("firstname"),
				Gender.valueOf(request.getParameter("gender")), request.getParameter("lastname"),
				request.getParameter("phone"), UUID.fromString(request.getParameter("villageId")));
		
		SessionManager.setAuth(request, user);
	}

	private void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        User user = SessionManager.getAuth(request);
        
        try {
        	if (user != null && UserRepository.checkPassword(oldPassword, user.getPassword())) {
                UserRepository.updatePassword(user.getUsername(), newPassword);
                
                SessionManager.setAuth(request, user);
                return;
            }
            
            request.setAttribute("errorMessage", "Invalid password");
            
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Invalid password");
        }
        
        request.getRequestDispatcher("/WEB-INF/views/security/password.jsp").forward(request, response);
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionManager.invalidate(request);

		request.getRequestDispatcher("/WEB-INF/views/security/login.jsp").forward(request, response);
	}

}
