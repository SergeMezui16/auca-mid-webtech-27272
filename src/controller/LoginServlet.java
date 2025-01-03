package controller;

import java.io.IOException;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import repository.UserRepository;
import utils.SessionManager;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/security/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.login(request, response);

	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try {
			User user = UserRepository.findById(username);

			if (user != null && UserRepository.checkPassword(password, user.getPassword())) {
				SessionManager.setAuth(request, user);
				
				System.out.println(request.getHeader("Referer"));

				response.sendRedirect(request.getHeader("Referer").equals("http://localhost:8080/TestServer/login") ? "/" : request.getHeader("Referer"));
				return;
			}

			request.setAttribute("errorMessage", "Invalid username or password");

		} catch (NoResultException e) {
			request.setAttribute("errorMessage", "Invalid username or password");
		}

		request.getRequestDispatcher("/WEB-INF/views/security/login.jsp").forward(request, response);
	}

}
