package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import repository.BookRepository;
import repository.BorrowerRepository;
import repository.UserRepository;
import utils.SessionManager;

@WebServlet("/borrows")
public class BorrowServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("books", BookRepository.findAllAvailable());
		request.getRequestDispatcher("/WEB-INF/views/borrowers/borrow.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UUID bookId = UUID.fromString(request.getParameter("bookId"));
		Date dueDate = Date.valueOf(request.getParameter("dueDate"));
		Date reserveDate = Date.valueOf(request.getParameter("reserveDate"));
		User user = SessionManager.getAuth(request);
		User reader = UserRepository.findById(user.getUsername());
		
		if(reader.getMembership() == null) {
            request.setAttribute("errorMessage", "You don't have membership yet!");
    		request.setAttribute("books", BookRepository.findAllAvailable());
			request.getRequestDispatcher("/WEB-INF/views/borrowers/borrow.jsp").forward(request, response);
			return;
		}
		
		if(reader.allowedNumberOfBorrowAvailable() <= 0) {
            request.setAttribute("errorMessage", "You have to upgrade your subscription to borrow more book!");
    		request.setAttribute("books", BookRepository.findAllAvailable());
			request.getRequestDispatcher("/WEB-INF/views/borrowers/borrow.jsp").forward(request, response);
			return;
		}
		
		BorrowerRepository.reserve(bookId, reserveDate, dueDate, reader);
		SessionManager.invalidate(request);
		// send a message

		response.sendRedirect(request.getContextPath() + "/security?action=profile");
	}
}
