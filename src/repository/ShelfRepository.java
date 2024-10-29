package repository;

import java.util.List;
import java.util.UUID;

import entity.Room;
import entity.Shelf;
import utils.Database;

public class ShelfRepository {

	public static List<Shelf> findAll() {
		return Database.findAll(Shelf.class);
	}

	public static Shelf findById(UUID id) {
		return Database.find(Shelf.class, id);
	}

	public static Shelf create(String bookCategory, int availableStock, int borrowedNumber, int initialStock, UUID roomId) {
		Room room = RoomRepository.findById(roomId);
		
		Shelf shelf = new Shelf();
		shelf.setAvailableStock(availableStock);
		shelf.setBookCategory(bookCategory);
		shelf.setBorrowedNumber(borrowedNumber);
		shelf.setInitialStock(initialStock);
		shelf.setRoom(room);

		Database.save(shelf);

		return shelf;
	}

	public static Shelf update(UUID id, int availableStock, String bookCategory, int borrowedNumber, int initialStock, UUID roomId) {
		Room room = RoomRepository.findById(roomId);
		Shelf shelf = ShelfRepository.findById(id);
		
		shelf.setAvailableStock(availableStock);
		shelf.setBookCategory(bookCategory);
		shelf.setBorrowedNumber(borrowedNumber);
		shelf.setInitialStock(initialStock);
		shelf.setRoom(room);

		Database.save(shelf);

		return shelf;
	}

	public static void delete(UUID id) {
		Database.delete(Shelf.class, id);
	}
}
