package repository;

import java.util.*;

import entity.Room;
import utils.Database;

public class RoomRepository {

	public static List<Room> findAll() {
		return Database.findAll(Room.class);
	}

	public static Room findById(UUID id) {
		return Database.find(Room.class, id);
	}

	public static Room create(String name, String code) {
		Room room = new Room();
		room.setName(name);
		room.setCode(code);

		Database.save(room);

		return room;
	}

	public static Room update(UUID id, String name, String code) {
		Room room = RoomRepository.findById(id);
		room.setName(name);
		room.setCode(code);

		Database.save(room);

		return room;
	}

	public static void delete(UUID id) {
		Database.delete(Room.class, id);
	}
}
