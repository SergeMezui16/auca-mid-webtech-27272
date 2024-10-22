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

    // Constructors, Getters, Setters
}
