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

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public int getMaxBooks() {
		return maxBooks;
	}

	public void setMaxBooks(int maxBooks) {
		this.maxBooks = maxBooks;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public List<Membership> getMemberships() {
		return memberships;
	}

	public void setMemberships(List<Membership> memberships) {
		this.memberships = memberships;
	}
}
