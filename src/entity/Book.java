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

    // Constructors, Getters, Setters
}
