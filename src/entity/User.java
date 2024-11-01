package entity;

import java.util.Comparator;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User extends Person {

    @Id
    @Column(name = "user_name", nullable = false, length=100)
    private String username;

    @Column(name = "password", nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(name = "role", nullable = false)
    private Role role;

	@OneToMany(mappedBy = "reader", fetch = FetchType.EAGER)
    private List<Membership> memberships;
    
    public String toString() {
    	return this.getName();
    }
    
    public String getName() {
    	return this.getFirstName() + " " + this.getLastName();
    }
    
    public boolean hasMembership() {
    	return this.memberships.stream().filter(m -> m.getStatus().equals(Status.APPROVED) && m.isValid()).count() != 0;
    }
    
    public Membership getMembership() {
    	return this.memberships.stream().max(Comparator.comparingInt(m -> m.getType().getMaxBooks())).get();
    }
    
    public boolean canBorrowBook() {
    	return this.role.equals(Role.STUDENT) || this.role.equals(Role.STUDENT);
    }
    
    public boolean canWrite() {
    	return this.role.equals(Role.LIBRARIAN);
    }
    
    public boolean canRead() {
    	return !this.role.equals(Role.STUDENT) && !this.role.equals(Role.STUDENT);
    }

	public String getUsername() {
		return username;
	}

	public User setUsername(String username) {
		this.username = username;
		
		return this;
	}

	public String getPassword() {
		return password;
	}

	public User setPassword(String password) {
		this.password = password;
		
		return this;
	}

	public Role getRole() {
		return role;
	}

	public User setRole(Role role) {
		this.role = role;
		
		return this;
	}

	public List<Membership> getMemberships() {
		return memberships;
	}

	public void setMemberships(List<Membership> memberships) {
		this.memberships = memberships;
	}
}

