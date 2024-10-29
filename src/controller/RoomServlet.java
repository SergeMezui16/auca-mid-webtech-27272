package controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import entity.Room;
import repository.RoomRepository;

@WebServlet("/rooms")
public class RoomServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null)
			action = "list";

		switch (action) {
		case "new":
			request.getRequestDispatcher("/WEB-INF/views/rooms/new.jsp").forward(request, response);
			break;
		case "edit":
			request.setAttribute("room", findRoomById(request));
			request.getRequestDispatcher("/WEB-INF/views/rooms/edit.jsp").forward(request, response);
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

		response.sendRedirect(request.getContextPath() + "/rooms");
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("rooms", RoomRepository.findAll());
		request.getRequestDispatcher("/WEB-INF/views/rooms/index.jsp").forward(request, response);
	}

	private Room findRoomById(HttpServletRequest request) {
		return RoomRepository.findById(UUID.fromString(request.getParameter("id")));
	}

	private void post(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String code = request.getParameter("code");

		RoomRepository.create(name, code);
	}

	private void put(HttpServletRequest request, HttpServletResponse response) {
		UUID id = UUID.fromString(request.getParameter("id"));
		String name = request.getParameter("name");
		String code = request.getParameter("code");

		if (id != null)
			RoomRepository.update(id, name, code);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		UUID id = UUID.fromString(request.getParameter("id"));

		if (id != null)
			RoomRepository.delete(id);
	}

}
