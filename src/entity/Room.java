package entity;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "room")
public class Room {

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "id", updatable = false, nullable = false, columnDefinition = "VARCHAR(36)")
    @Type(type = "uuid-char")
    private UUID id;

    @Column(name = "room_code")
    private String code;

    @Column(name = "room_name")
    private String name;

	@OneToMany(mappedBy = "room", fetch = FetchType.EAGER)
    private List<Shelf> shelves;
	
	public int getNumberOfBook() {
		return this.shelves.stream().map(Shelf::getNumberOfBook).reduce(0, Integer::sum);
	}

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
