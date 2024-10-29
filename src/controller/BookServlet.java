package controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import entity.Book;
import repository.BookRepository;
import repository.ShelfRepository;

@WebServlet("/books")
public class BookServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null)
			action = "list";

		switch (action) {
		case "new":
			request.setAttribute("shelves", ShelfRepository.findAll());
			request.getRequestDispatcher("/WEB-INF/views/books/new.jsp").forward(request, response);
			break;
		case "edit":
			request.setAttribute("shelves", ShelfRepository.findAll());
			request.setAttribute("book", findBookById(request));
			request.getRequestDispatcher("/WEB-INF/views/books/edit.jsp").forward(request, response);
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

		response.sendRedirect(request.getContextPath() + "/books");
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("books", BookRepository.findAll());
		request.getRequestDispatcher("/WEB-INF/views/books/index.jsp").forward(request, response);
	}

	private Book findBookById(HttpServletRequest request) {
		return BookRepository.findById(UUID.fromString(request.getParameter("id")));
	}

	private void post(HttpServletRequest request, HttpServletResponse response) {
		BookRepository.create(request.getParameter("title"), Integer.parseInt(request.getParameter("edition")),
				request.getParameter("ISBNCode"), Integer.parseInt(request.getParameter("publicationYear")),
				request.getParameter("publisherName"), UUID.fromString(request.getParameter("shelfId")));
	}

	private void put(HttpServletRequest request, HttpServletResponse response) {
		UUID id = UUID.fromString(request.getParameter("id"));

		if (id != null)
			BookRepository.update(id, request.getParameter("title"), Integer.parseInt(request.getParameter("edition")),
					request.getParameter("ISBNCode"), Integer.parseInt(request.getParameter("publicationYear")),
					request.getParameter("publisherName"), UUID.fromString(request.getParameter("shelfId")));
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		UUID id = UUID.fromString(request.getParameter("id"));

		if (id != null)
			BookRepository.delete(id);
	}

}
