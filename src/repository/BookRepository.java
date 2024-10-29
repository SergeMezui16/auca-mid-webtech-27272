package repository;

import java.util.List;
import java.util.UUID;

import entity.Book;
import entity.Shelf;
import utils.Database;

public class BookRepository {

	public static List<Book> findAll() {
		return Database.findAll(Book.class);
	}

	public static Book findById(UUID id) {
		return Database.find(Book.class, id);
	}

	public static Book create(String title, int edition, String ISBNCode, int publicationYear, String publisherName, UUID shelfId) {
		Shelf shelf = ShelfRepository.findById(shelfId);
		
		Book book = new Book();
		book.setEdition(edition);
		book.setISBNCode(ISBNCode);
		book.setPublicationYear(publicationYear);
		book.setPublisherName(publisherName);
		book.setTitle(title);
		book.setShelf(shelf);

		Database.save(book);

		return book;
	}

	public static Book update(UUID id, String title, int edition, String ISBNCode, int publicationYear, String publisherName, UUID shelfId) {
		Book book = BookRepository.findById(id);
		Shelf shelf = ShelfRepository.findById(shelfId);

		book.setEdition(edition);
		book.setISBNCode(ISBNCode);
		book.setPublicationYear(publicationYear);
		book.setPublisherName(publisherName);
		book.setTitle(title);
		book.setShelf(shelf);

		Database.save(book);

		return book;
	}

	public static void delete(UUID id) {
		Database.delete(Book.class, id);
	}
}
