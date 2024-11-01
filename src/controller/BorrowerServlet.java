package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Borrower;
import repository.BorrowerRepository;

@WebServlet("/borrowers")
public class BorrowerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null)
			action = "list";

		switch (action) {
		case "return":
			request.setAttribute("borrower", this.findBorrowerById(request));
			request.getRequestDispatcher("/WEB-INF/views/borrowers/return.jsp").forward(request, response);
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
		case "borrow":
			borrowBook(request, response);
			break;
		case "return":
			returnBook(request, response);
			break;
		}

		response.sendRedirect(request.getContextPath() + "/borrowers");
	}
	


	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("borrowers", BorrowerRepository.findAll());
		request.getRequestDispatcher("/WEB-INF/views/borrowers/index.jsp").forward(request, response);
	}

	private Borrower findBorrowerById(HttpServletRequest request) {
		return BorrowerRepository.findById(UUID.fromString(request.getParameter("id")));
	}

	private void borrowBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BorrowerRepository.borrow(UUID.fromString(request.getParameter("id")));
	}

	private void returnBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UUID id = UUID.fromString(request.getParameter("id"));
		Date date = Date.valueOf(request.getParameter("returnDate"));
		int fees = Integer.parseInt(request.getParameter("lateChargeFees"));
		
		BorrowerRepository.retrun(id, date, fees);
	}


}
