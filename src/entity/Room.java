package entity;

import javax.persistence.*;

import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "room")
public class Room {

    @Id
    @Column(name = "room_id", nullable = false)
    private UUID id;

    @Column(name = "room_code")
    private String code;

    @Column(name = "room_name")
    private String name;

	@OneToMany(mappedBy = "room")
    private List<Shelf> shelves;

    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<Shelf> getShelves() {
		return shelves;
	}

	public void setShelves(List<Shelf> shelves) {
		this.shelves = shelves;
	}
}
