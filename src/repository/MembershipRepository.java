package repository;

import java.util.*;

import entity.Membership;
import entity.MembershipType;
import entity.Status;
import entity.User;
import utils.Database;

public class MembershipRepository {

	public static List<Membership> findAll() {
		return Database.findAll(Membership.class);
	}

	public static Membership findById(UUID id) {
		return Database.find(Membership.class, id);
	}

	public static Membership ask(Date time, Date date, String userId, UUID type) {
		MembershipType membershipType = MembershipTypeRepository.findById(type);
		User reader = UserRepository.findById(userId);
		
		Membership membership = new Membership();
		membership.setExpiringTime(time);
		membership.setRegistrationDate(date);
		membership.setStatus(Status.PENDING);
		membership.setReader(reader);
		membership.setType(membershipType);

		Database.save(membership);

		return membership;
	}
	
	public static Membership approve(UUID id) {
		Membership membership = MembershipRepository.findById(id);

		membership.setStatus(Status.APPROVED);
		Database.save(membership);

		return membership;
	}
	
	public static Membership reject(UUID id) {
		Membership membership = MembershipRepository.findById(id);

		membership.setStatus(Status.REJECTED);
		Database.save(membership);

		return membership;
	}

	public static Membership create(Date time, Date date, Status status, String userId, UUID type) {
		MembershipType membershipType = MembershipTypeRepository.findById(type);
		User reader = UserRepository.findById(userId);
		
		Membership membership = new Membership();
		membership.setExpiringTime(time);
		membership.setRegistrationDate(date);
		membership.setStatus(status);
		membership.setReader(reader);
		membership.setType(membershipType);

		Database.save(membership);

		return membership;
	}

	public static Membership update(UUID id, Date time, Date date, Status status, String userId, UUID type) {
		MembershipType membershipType = MembershipTypeRepository.findById(type);
		User reader = UserRepository.findById(userId);
		Membership membership = MembershipRepository.findById(id);
		
		membership.setExpiringTime(time);
		membership.setRegistrationDate(date);
		membership.setStatus(status);
		membership.setReader(reader);
		membership.setType(membershipType);

		Database.save(membership);

		return membership;
	}

	public static void delete(UUID id) {
		Database.delete(Membership.class, id);
	}
}
