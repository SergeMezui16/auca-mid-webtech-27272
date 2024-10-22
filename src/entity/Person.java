package entity;

import javax.persistence.*;

@MappedSuperclass
public abstract class Person {

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender")
    private Gender gender;

    @ManyToOne
    @JoinColumn(name = "village_id")
    private Location village;

    @Column(name = "phone_number")
    private String phoneNumber;

    // Constructors, Getters, Setters
}
