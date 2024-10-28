package entity;

import javax.persistence.*;

import java.util.List;
import java.util.UUID;

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
    private List<User> residents;

	public synchronized UUID getId() {
		return id;
	}

	public synchronized void setId(UUID id) {
		this.id = id;
	}

	public synchronized String getCode() {
		return code;
	}

	public synchronized void setCode(String code) {
		this.code = code;
	}

	public synchronized String getName() {
		return name;
	}

	public synchronized void setName(String name) {
		this.name = name;
	}

	public synchronized Location getParent() {
		return parent;
	}

	public synchronized void setParent(Location parent) {
		this.parent = parent;
	}

	public synchronized LocationType getType() {
		return type;
	}

	public synchronized void setType(LocationType type) {
		this.type = type;
	}

	public synchronized List<User> getResidents() {
		return residents;
	}

	public synchronized void setResidents(List<User> residents) {
		this.residents = residents;
	}
}

