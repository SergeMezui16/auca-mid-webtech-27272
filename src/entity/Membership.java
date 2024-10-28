package entity;

import javax.persistence.*;

import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "membership")
public class Membership {

    @Id
    @Column(name = "membership_id", nullable = false)
    private UUID id;

    @Column(name = "expiring_time")
    private Date expiringTime;

    @Column(name = "fine")
    private int fine;

    @Column(name = "membership_code")
    private String code;

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

	public int getFine() {
		return fine;
	}

	public void setFine(int fine) {
		this.fine = fine;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

