package repository;

import java.util.*;

import org.hibernate.*;

import entity.Room;
import utils.Database;

public class RoomRepository {

	private SessionFactory sessionFactory;

	public RoomRepository() {
		sessionFactory = Database.getSession();
	}

	public List<Room> findAll() {
		Session session = sessionFactory.openSession();
		List<Room> rooms = session.createQuery("FROM Room", Room.class).list();
		session.close();
		return rooms;
	}

	public Room findById(UUID id) {
		Session session = sessionFactory.openSession();
		Room room = session.get(Room.class, id);
		session.close();
		return room;
	}

	public Room create(String name, String code) {
		Room room = new Room();
		room.setName(name);
		room.setCode(code);
		room.setId(UUID.randomUUID());

		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(room);
		session.getTransaction().commit();
		session.close();

		return room;
	}

	public Room update(UUID id, String name, String code) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Room room = session.get(Room.class, id);
		room.setName(name);
		room.setCode(code);
		session.getTransaction().commit();
		session.close();

		return room;
	}

	public void delete(UUID id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Room room = session.get(Room.class, id);
		session.delete(room);
		session.getTransaction().commit();
		session.close();
	}
}
