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

    // Constructors, Getters, Setters
}
