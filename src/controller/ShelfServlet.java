package controller;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import entity.Room;
import entity.Shelf;
import repository.RoomRepository;
import repository.ShelfRepository;

@WebServlet("/shelves")
public class ShelfServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null)
			action = "list";

		switch (action) {
		case "new": 
            request.setAttribute("rooms", getAllRooms());
			request.getRequestDispatcher("/WEB-INF/views/shelves/new.jsp").forward(request, response);
			break;
		case "edit":
            request.setAttribute("shelf", findShelfById(request));
            request.setAttribute("rooms", getAllRooms());
			request.getRequestDispatcher("/WEB-INF/views/shelves/edit.jsp").forward(request, response);
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

		response.sendRedirect(request.getContextPath() + "/shelves");
	}
	
    private List<Room> getAllRooms() {
        return RoomRepository.findAll();
    }
	
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("shelves", ShelfRepository.findAll());
		request.getRequestDispatcher("/WEB-INF/views/shelves/index.jsp").forward(request, response);
	}

	private Shelf findShelfById(HttpServletRequest request) {
		return ShelfRepository.findById(UUID.fromString(request.getParameter("id")));
	}

	private void post(HttpServletRequest request, HttpServletResponse response) {
        String bookCategory = request.getParameter("bookCategory");
        int availableStock = Integer.parseInt(request.getParameter("availableStock"));
        int borrowedNumber = Integer.parseInt(request.getParameter("borrowedNumber"));
        int initialStock = Integer.parseInt(request.getParameter("initialStock"));
        UUID roomId = UUID.fromString(request.getParameter("roomId"));

        ShelfRepository.create(bookCategory, availableStock, borrowedNumber, initialStock, roomId);
	}

	private void put(HttpServletRequest request, HttpServletResponse response) {
        UUID id = UUID.fromString(request.getParameter("id"));
        String bookCategory = request.getParameter("bookCategory");
        int availableStock = Integer.parseInt(request.getParameter("availableStock"));
        int borrowedNumber = Integer.parseInt(request.getParameter("borrowedNumber"));
        int initialStock = Integer.parseInt(request.getParameter("initialStock"));
        UUID roomId = UUID.fromString(request.getParameter("roomId"));

		if (id != null)
			ShelfRepository.update(id, availableStock, bookCategory, borrowedNumber, initialStock, roomId);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		UUID id = UUID.fromString(request.getParameter("id"));

		if (id != null)
			ShelfRepository.delete(id);
	}
}
