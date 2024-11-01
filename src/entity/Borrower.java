package entity;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "borrower")
public class Borrower {

	@Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "reservation_id", updatable = false, nullable = false, columnDefinition = "VARCHAR(36)")
    @Type(type = "uuid-char")
	private UUID id;

	@ManyToOne
	@JoinColumn(name = "book_id")
	private Book book;

	@Column(name = "due_date")
	private Date dueDate;

	@Column(name = "late_charge_fees")
	private int lateChargeFees;

	@Column(name = "borrower_status")
    @Enumerated(EnumType.STRING)
	private BorrowStatus status;

	@ManyToOne
	@JoinColumn(name = "reader_id")
	private User reader;

	@Column(name = "reserve_date")
	private Date date;

	@Column(name = "return_date")
	private Date returnDate;
	
	public boolean canBorrow() {
		return this.status.equals(BorrowStatus.ASKED);
	}
	
	public boolean canReturn() {
		return this.status.equals(BorrowStatus.BORROWED);
	}
 
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

	public User getReader() {
		return reader;
	}

	public void setReader(User reader) {
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

	public BorrowStatus getStatus() {
		return status;
	}

	public void setStatus(BorrowStatus status) {
		this.status = status;
	}

}
