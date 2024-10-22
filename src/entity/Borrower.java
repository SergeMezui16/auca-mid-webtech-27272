package entity;

import javax.persistence.*;
import java.util.UUID;
import java.util.Date;

@Entity
@Table(name = "borrower")
public class Borrower {

	@Id
	@Column(name = "reservation_id")
	private UUID id;

	@ManyToOne
	@JoinColumn(name = "book_id")
	private Book book;

	@Column(name = "due_date")
	private Date dueDate;

	@Column(name = "late_charge_fees")
	private int lateChargeFees;

	@ManyToOne
	@JoinColumn(name = "reader_id")
	private Person reader;

	@Column(name = "reserve_date")
	private Date date;

	@Column(name = "return_date")
	private Date returnDate;

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public int getLateChargeFees() {
		return lateChargeFees;
	}

	public void setLateChargeFees(int lateChargeFees) {
		this.lateChargeFees = lateChargeFees;
	}

	public Person getReader() {
		return reader;
	}

	public void setReader(Person reader) {
		this.reader = reader;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

}
