package entity;

import javax.persistence.*;
import java.util.UUID;
import java.util.List;

@Entity
@Table(name = "location")
public class Location {

    @Id
    @Column(name = "location_id", nullable = false)
    private UUID id;

    @Column(name = "location_code")
    private String code;

    @Column(name = "location_name")
    private String name;

    @ManyToOne
    @JoinColumn(name = "parent_id")
    private Location parent;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "location_type", nullable = false)
    private LocationType type;

    @OneToMany(mappedBy = "village")
    private List<Person> residents;

    // Constructors, Getters, Setters
}

