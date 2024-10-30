package controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import entity.Location;
import entity.LocationType;
import repository.LocationRepository;

@WebServlet("/locations")
public class LocationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null)
			action = "list";

		switch (action) {
		case "new":
			request.setAttribute("types", LocationType.values());
			request.setAttribute("locations", LocationRepository.findAll());
			request.getRequestDispatcher("/WEB-INF/views/locations/new.jsp").forward(request, response);
			break;
		case "edit":
			request.setAttribute("types", LocationType.values());
			request.setAttribute("location", findBookById(request));
			request.setAttribute("locations", LocationRepository.findAll());
			request.getRequestDispatcher("/WEB-INF/views/locations/edit.jsp").forward(request, response);
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

		response.sendRedirect(request.getContextPath() + "/locations");
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("locations", LocationRepository.findAll());
		request.getRequestDispatcher("/WEB-INF/views/locations/index.jsp").forward(request, response);
	}

	private Location findBookById(HttpServletRequest request) {
		return LocationRepository.findById(UUID.fromString(request.getParameter("id")));
	}

	private void post(HttpServletRequest request, HttpServletResponse response) {
		String parentId = request.getParameter("parentId");

		if (parentId.isEmpty()) {
			LocationRepository.create(request.getParameter("code"), request.getParameter("name"),
					LocationType.valueOf(request.getParameter("type")));
		} else {
			LocationRepository.create(request.getParameter("code"), request.getParameter("name"),
					LocationType.valueOf(request.getParameter("type")), UUID.fromString(parentId));
		}
	}

	private void put(HttpServletRequest request, HttpServletResponse response) {
		UUID id = UUID.fromString(request.getParameter("id"));
		String parentId = request.getParameter("parentId");

		if (id == null)
			return;

		if (parentId.isEmpty()) {
			LocationRepository.update(id, request.getParameter("code"), request.getParameter("name"),
					LocationType.valueOf(request.getParameter("type")));
		} else {
			LocationRepository.update(id, request.getParameter("code"), request.getParameter("name"),
					LocationType.valueOf(request.getParameter("type")), UUID.fromString(parentId));
		}

	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		UUID id = UUID.fromString(request.getParameter("id"));

		if (id != null)
			LocationRepository.delete(id);
	}

}
