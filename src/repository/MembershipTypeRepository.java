package repository;

import java.util.*;

import entity.MembershipType;
import utils.Database;

public class MembershipTypeRepository {

	public static List<MembershipType> findAll() {
		return Database.findAll(MembershipType.class);
	}

	public static MembershipType findById(UUID id) {
		return Database.find(MembershipType.class, id);
	}

	public static MembershipType create(int max, String name, int price) {
		MembershipType membershipType = new MembershipType();
		membershipType.setName(name);
		membershipType.setPrice(price);
		membershipType.setMaxBooks(max);

		Database.save(membershipType);

		return membershipType;
	}

	public static MembershipType update(UUID id, int max, String name, int price) {
		MembershipType membershipType = MembershipTypeRepository.findById(id);
		membershipType.setName(name);
		membershipType.setPrice(price);
		membershipType.setMaxBooks(max);

		Database.save(membershipType);

		return membershipType;
	}

	public static void delete(UUID id) {
		Database.delete(MembershipType.class, id);
	}
}
