package utils;

import java.util.List;
import java.util.Properties;
import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;

import entity.*;

public class Database {

	public static SessionFactory sessionFactory = null;
	
	public static void save(Object object) {
		Session session = Database.getSession().openSession();
		session.beginTransaction();
		session.saveOrUpdate(object);
		session.getTransaction().commit();
		session.close();
	}
	
	public static <T> T find(Class<T> entityType, UUID id) {
		Session session = Database.getSession().openSession();
		T data =  session.get(entityType, id);
		session.close();
		return data;
	}
	
	public static <T> List<T> findAll(Class<T> entityType) {
		Session session = Database.getSession().openSession();
		List<T> data = session.createQuery("FROM " + entityType.getName(), entityType).list();
		session.close();
		return data;
	}
	
	public static <T> void delete(Class<T> entityType, UUID id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		T data = session.get(entityType, id);
		session.delete(data);
		session.getTransaction().commit();
		session.close();
	}

	public static SessionFactory getSession() {
		
		if (sessionFactory == null) {
			Configuration conf = new Configuration();

			Properties settings = Database.getSettings();

			conf.setProperties(settings);

			conf.addAnnotatedClass(Book.class);
			conf.addAnnotatedClass(Borrower.class);
			conf.addAnnotatedClass(Membership.class);
			conf.addAnnotatedClass(Location.class);
			conf.addAnnotatedClass(MembershipType.class);
			conf.addAnnotatedClass(Room.class);
			conf.addAnnotatedClass(Shelf.class);
			conf.addAnnotatedClass(User.class);

			sessionFactory = conf.buildSessionFactory();
		}

		return sessionFactory;
	}
	
	private static Properties getSettings() {
		Properties settings = new Properties();

		settings.setProperty(Environment.DRIVER, "com.mysql.jdbc.Driver");
		settings.setProperty(Environment.URL, "jdbc:mysql://localhost:3306/auca_library_db");
		settings.setProperty(Environment.USER, "root");
		settings.setProperty(Environment.PASS, "");
		settings.setProperty(Environment.HBM2DDL_AUTO, "create");
		settings.setProperty(Environment.DIALECT, "org.hibernate.dialect.MySQL5Dialect");
		settings.setProperty(Environment.HBM2DDL_AUTO, "update"); // update | validate | create
		settings.setProperty(Environment.SHOW_SQL, "true");
		
		return settings;
	}
}
