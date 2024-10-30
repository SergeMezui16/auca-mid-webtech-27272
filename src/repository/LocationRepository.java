package repository;

import java.util.List;
import java.util.UUID;

import org.hibernate.Session;

import entity.Location;
import entity.LocationType;
import utils.Database;

public class LocationRepository {

	public static List<Location> findAll() {
		return Database.findAll(Location.class);
	}

	public static List<Location> findAllVillages() {
		Session session = Database.getSession().openSession();
		List<Location> data = session.createQuery("SELECT l FROM Location l WHERE l.type = :type", Location.class)
				.setParameter("type", LocationType.VILLAGE)
				.list();
		session.close();
		return data;
	}

	public static Location findById(UUID id) {
		return Database.find(Location.class, id);
	}

	public static Location create(String code, String name, LocationType type, UUID parentId) {
		Location location = new Location();
		Location parent = LocationRepository.findById(parentId);
		
		location.setCode(code);
		location.setName(name);
		location.setParent(parent);
		location.setType(type);

		Database.save(location);

		return location;
	}

	public static Location create(String code, String name, LocationType type) {
		Location location = new Location();
		
		location.setCode(code);
		location.setName(name);
		location.setType(type);

		Database.save(location);

		return location;
	}

	public static Location update(UUID id, String code, String name, LocationType type, UUID parentId) {
		Location location = LocationRepository.findById(id);
		Location parent = LocationRepository.findById(parentId);

		location.setCode(code);
		location.setName(name);
		location.setParent(parent);
		location.setType(type);

		Database.save(location);

		return location;
	}

	public static Location update(UUID id, String code, String name, LocationType type) {
		Location location = LocationRepository.findById(id);

		location.setCode(code);
		location.setName(name);
		location.setType(type);

		Database.save(location);

		return location;
	}

	public static void delete(UUID id) {
		Database.delete(Location.class, id);
	}
}
