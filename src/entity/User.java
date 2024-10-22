package entity;

import javax.persistence.*;

@Entity
@Table(name = "user")
public class User extends Person {

    @Id
    @Column(name = "user_name", nullable = false)
    private String name;

    @Column(name = "password", nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(name = "role", nullable = false)
    private Role role;

    // Constructors, Getters, Setters
}

