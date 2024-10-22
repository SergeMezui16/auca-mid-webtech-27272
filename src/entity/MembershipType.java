package entity;

import javax.persistence.*;
import java.util.UUID;
import java.util.List;

@Entity
@Table(name = "membership_type")
public class MembershipType {

    @Id
    @Column(name = "membership_type_id", nullable = false)
    private UUID id;

    @Column(name = "max_books")
    private int maxBooks;

    @Column(name = "membership_name")
    private String name;

    @Column(name = "price")
    private int price;

    @OneToMany(mappedBy = "membershipType")
    private List<Membership> memberships;

    // Constructors, Getters, Setters
}
