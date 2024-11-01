package entity;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "membership")
public class Membership {

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "membership_id", updatable = false, nullable = false, columnDefinition = "VARCHAR(36)")
    @Type(type = "uuid-char")
    private UUID id;

    @Column(name = "expiring_time")
    private Date expiringTime;

    @ManyToOne
    @JoinColumn(name = "membership_type_id")
    private MembershipType type;

    @Enumerated(EnumType.STRING)
    @Column(name = "membership_status")
    private Status status;

    @ManyToOne
    @JoinColumn(name = "reader_id")
    private User reader;

    @Column(name = "registration_date")
    private Date registrationDate;
    
    public boolean isPending() {
    	return this.getStatus().equals(Status.PENDING);
    }
    
    public boolean isValid() {
    	return this.expiringTime.after(new Date());
    }

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public Date getExpiringTime() {
		return expiringTime;
	}

	public void setExpiringTime(Date expiringTime) {
		this.expiringTime = expiringTime;
	}

	public MembershipType getType() {
		return type;
	}

	public void setType(MembershipType type) {
		this.type = type;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public User getReader() {
		return reader;
	}

	public void setReader(User reader) {
		this.reader = reader;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
}

