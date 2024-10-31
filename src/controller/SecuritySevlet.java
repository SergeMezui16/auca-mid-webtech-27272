package controller;

import java.io.IOException;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import entity.User;
import repository.UserRepository;

@WebServlet("/security")
public class SecuritySevlet extends HttpServlet  {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null)
			action = "login";

		switch (action) {
		case "login":
			request.getRequestDispatcher("/WEB-INF/views/security/login.jsp").forward(request, response);
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
		case "login":
			login(request, response);
			break;
		case "logout":
			logout(request, response);
			break;
		}

		response.sendRedirect(request.getContextPath() + "/");
	}
	
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            User user = UserRepository.findById(username);

            if (user != null && UserRepository.checkPassword(password, user.getPassword())) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                return;
            }
            
            request.setAttribute("errorMessage", "Invalid username or password");
            
        } catch (NoResultException e) {
            request.setAttribute("errorMessage", "Invalid username or password");
        }
        
        request.getRequestDispatcher("/WEB-INF/views/security/login.jsp").forward(request, response);
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        
        request.getRequestDispatcher("/WEB-INF/views/security/login.jsp").forward(request, response);
	}
	
}
