package controller;

import entity.Room;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import utils.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet(value="/rooms/new", name="room_new")
public class NewRoomServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Display the form for creating a new room
        request.getRequestDispatcher("/WEB-INF/views/rooms/new.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String code = request.getParameter("code");

        // Create a new Room instance and set its properties
        Room room = new Room();
        room.setName(name);
        room.setCode(code);
        room.setId(UUID.randomUUID());

        // Save the Room to the database
        SessionFactory sessionFactory = Database.getSession();
        Session session = sessionFactory.openSession();

        try {
            session.beginTransaction();
            session.save(room); // Persist the Room entity
            session.getTransaction().commit();
        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

        // Redirect to the room list page after creation
        response.sendRedirect(request.getContextPath() + "/rooms");
    }
}
