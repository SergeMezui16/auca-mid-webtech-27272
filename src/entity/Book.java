package entity;

import javax.persistence.*;
import java.util.UUID;
import java.util.List;

@Entity
@Table(name = "book")
public class Book {

    @Id
    @Column(name = "book_id", nullable = false)
    private UUID id;

    @Column(name = "edition")
    private int edition;

    @Column(name = "ISBNCode")
    private String ISBNCode;

    @Column(name = "publication_year")
    private int publicationYear;

    @Column(name = "publisher_name")
    private String publisherName;

    @ManyToOne
    @JoinColumn(name = "shelf_id")
    private Shelf shelf;

    @Column(name = "title")
    private String title;

    @OneToMany(mappedBy = "book")
    private List<Borrower> borrowers;

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public int getEdition() {
		return edition;
	}

	public void setEdition(int edition) {
		this.edition = edition;
	}

	public String getISBNCode() {
		return ISBNCode;
	}

	public void setISBNCode(String iSBNCode) {
		ISBNCode = iSBNCode;
	}

	public int getPublicationYear() {
		return publicationYear;
	}

	public void setPublicationYear(int publicationYear) {
		this.publicationYear = publicationYear;
	}

	public String getPublisherName() {
		return publisherName;
	}

	public void setPublisherName(String publisherName) {
		this.publisherName = publisherName;
	}

	public Shelf getShelf() {
		return shelf;
	}

	public void setShelf(Shelf shelf) {
		this.shelf = shelf;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Borrower> getBorrowers() {
		return borrowers;
	}

	public void setBorrowers(List<Borrower> borrowers) {
		this.borrowers = borrowers;
	}
}
