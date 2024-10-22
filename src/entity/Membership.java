package entity;

import javax.persistence.*;
import java.util.UUID;
import java.util.Date;

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
    private Person reader;

    @Column(name = "registration_date")
    private Date registrationDate;

    // Constructors, Getters, Setters
}

