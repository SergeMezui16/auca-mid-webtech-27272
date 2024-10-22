package entity;

import javax.persistence.*;
import java.util.UUID;
import java.util.List;

@Entity
@Table(name = "room")
public class Room {

    @Id
    @Column(name = "room_id", nullable = false)
    private UUID id;

    @Column(name = "room_code")
    private String code;

    @OneToMany(mappedBy = "room")
    private List<Shelf> shelves;

    // Constructors, Getters, Setters
}
