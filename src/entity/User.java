package entity;

import javax.persistence.*;

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
}

