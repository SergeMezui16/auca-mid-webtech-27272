package repository;

import java.util.List;
import java.util.UUID;

import org.mindrot.jbcrypt.BCrypt;

import entity.Gender;
import entity.Role;
import entity.User;
import utils.Database;

public class UserRepository {

	public static List<User> findAll() {
		return Database.findAll(User.class);
	}

	public static User findById(UUID id) {
		return Database.find(User.class, id);
	}
	
	public static String hashPassword(String plainPassword) {
		return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
	}

	public static User create(String username, String firstname, Gender gender, String lastname, String phone, String password, Role role) {
		User user = new User();
		user.setFirstName(firstname);
		user.setGender(gender);
		user.setLastName(lastname);
		user.setPassword(UserRepository.hashPassword(password));
		user.setPhoneNumber(phone);
		user.setRole(role);
		user.setUsername(username);
		// user.setVillage(village);

		Database.save(user);

		return user;
	}

	public static User update(UUID id, String username, String firstname, Gender gender, String lastname, String phone, String password, Role role) {
		User user = UserRepository.findById(id);
		
		user.setFirstName(firstname);
		user.setGender(gender);
		user.setLastName(lastname);
		user.setPassword(UserRepository.hashPassword(password));
		user.setPhoneNumber(phone);
		user.setRole(role);
		user.setUsername(username);

		Database.save(user);

		return user;
	}

	public static void delete(UUID id) {
		Database.delete(User.class, id);
	}
}
