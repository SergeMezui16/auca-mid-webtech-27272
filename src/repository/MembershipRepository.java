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

	public static Membership ask(User reader, UUID type) {
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, 30);
        
		MembershipType membershipType = MembershipTypeRepository.findById(type);
		
		Membership membership = new Membership();
		membership.setExpiringTime(calendar.getTime());
		membership.setRegistrationDate(date);
		membership.setStatus(Status.PENDING);
		membership.setReader(reader);
		membership.setType(membershipType);

		Database.save(membership);

		return membership;
	}
	
	public static Membership approve(UUID id) {
		Membership membership = MembershipRepository.findById(id);

		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, 30);
        
		membership.setStatus(Status.APPROVED);
		membership.setExpiringTime(calendar.getTime());
		membership.setRegistrationDate(date);
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
