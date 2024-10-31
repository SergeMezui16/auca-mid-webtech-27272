package repository;

import java.util.List;
import java.util.UUID;

import org.mindrot.jbcrypt.BCrypt;

import entity.Gender;
import entity.Location;
import entity.LocationType;
import entity.Role;
import entity.User;
import utils.Database;

public class UserRepository {

	public static List<User> findAll() {
		return Database.findAll(User.class);
	}

	public static User findById(String username) {
		return Database.find(User.class, username);
	}

	public static String hashPassword(String plainPassword) {
		return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
	}

	public static boolean checkPassword(String plainPassword, String hashedPassword) {
		return BCrypt.checkpw(plainPassword, hashedPassword);
	}

	public static User create(String username, String firstname, Gender gender, String lastname, String phone,
			String password, Role role, UUID villageId) {
		Location location = LocationRepository.findById(villageId);

		User user = new User();
		user.setFirstName(firstname);
		user.setGender(gender);
		user.setLastName(lastname);
		user.setPassword(UserRepository.hashPassword(password));
		user.setPhoneNumber(phone);
		user.setRole(role);
		user.setUsername(username);

		if (LocationType.VILLAGE.equals(location.getType()))
			user.setVillage(location);

		Database.save(user);

		return user;
	}

	public static User updateCredentials(String username, Role role) {
		User user = UserRepository.findById(username);
		user.setRole(role);
		
		Database.save(user);

		return user;
	}

	public static User updatePassword(String username, String plainPassword) {
		User user = UserRepository.findById(username);
		user.setPassword(UserRepository.hashPassword(plainPassword));
		
		Database.save(user);

		return user;
	}

	public static User updateProfile(String username, String firstname, Gender gender, String lastname, String phone, UUID villageId) {
		User user = UserRepository.findById(username);
		Location location = LocationRepository.findById(villageId);

		user.setFirstName(firstname);
		user.setLastName(lastname);
		user.setGender(gender);
		user.setPhoneNumber(phone);

		if (LocationType.VILLAGE.equals(location.getType()))
			user.setVillage(location);

		Database.save(user);

		return user;
	}

	public static void delete(String username) {
		Database.delete(User.class, username);
	}
}
