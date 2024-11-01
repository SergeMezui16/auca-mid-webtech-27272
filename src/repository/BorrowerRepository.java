package repository;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import entity.Book;
import entity.BookStatus;
import entity.BorrowStatus;
import entity.Borrower;
import entity.User;
import utils.Database;

public class BorrowerRepository {

	public static List<Borrower> findAll() {
		return Database.findAll(Borrower.class);
	}

	public static Borrower findById(UUID id) {
		return Database.find(Borrower.class, id);
	}

	public static Borrower reserve(UUID bookId, Date reserveDate, Date dueDate, User reader) {
		Book book = BookRepository.findById(bookId);
		
		Borrower borrower = new Borrower();
		borrower.setBook(book);
		borrower.setReader(reader);
		borrower.setDate(reserveDate);
		borrower.setDueDate(dueDate);
		borrower.setStatus(BorrowStatus.ASKED);
		
		book.setStatus(BookStatus.RESERVED);

		Database.save(borrower);
		Database.save(book);
		
		return borrower;
	}

	public static Borrower borrow(UUID id) {
		Borrower borrower = BorrowerRepository.findById(id);
		Book book = borrower.getBook();
		
		borrower.setStatus(BorrowStatus.BORROWED);
		book.setStatus(BookStatus.BORROWED);

		Database.save(borrower);
		Database.save(book);

		return borrower;
	}

	public static Borrower retrun(UUID id, Date returnDate, int lateChargeFees) {
		Borrower borrower = BorrowerRepository.findById(id);
		Book book = borrower.getBook();
		
		borrower.setStatus(BorrowStatus.RETURNED);
		borrower.setReturnDate(returnDate);
		borrower.setLateChargeFees(lateChargeFees);
		
		book.setStatus(BookStatus.AVAILABLE);

		Database.save(borrower);
		Database.save(book);

		return borrower;
	}

	public static void delete(UUID id) {
		Database.delete(Borrower.class, id);
	}
}
