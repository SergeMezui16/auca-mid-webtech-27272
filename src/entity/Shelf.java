package entity;

import javax.persistence.*;
import java.util.UUID;
import java.util.List;

@Entity
@Table(name = "shelf")
public class Shelf {

    @Id
    @Column(name = "shelf_id", nullable = false)
    private UUID id;

    @Column(name = "available_stock")
    private int availableStock;

    @Column(name = "book_category")
    private String bookCategory;

    @Column(name = "borrowed_number")
    private int borrowedNumber;

    @Column(name = "initial_stock")
    private int initialStock;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    @OneToMany(mappedBy = "shelf")
    private List<Book> books;

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public int getAvailableStock() {
		return availableStock;
	}

	public void setAvailableStock(int availableStock) {
		this.availableStock = availableStock;
	}

	public String getBookCategory() {
		return bookCategory;
	}

	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}

	public int getBorrowedNumber() {
		return borrowedNumber;
	}

	public void setBorrowedNumber(int borrowedNumber) {
		this.borrowedNumber = borrowedNumber;
	}

	public int getInitialStock() {
		return initialStock;
	}

	public void setInitialStock(int initialStock) {
		this.initialStock = initialStock;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}
}
