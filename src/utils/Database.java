package utils;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;

import entity.*;

public class Database {

	public static SessionFactory sessionFactory = null;

	public static SessionFactory getSession() {
		
		if (sessionFactory == null) {
			Configuration conf = new Configuration();

			Properties settings = new Properties();

			settings.setProperty(Environment.DRIVER, "com.mysql.jdbc.Driver");
			settings.setProperty(Environment.URL, "jdbc:mysql://localhost:3306/auca_library_db");
			settings.setProperty(Environment.USER, "root");
			settings.setProperty(Environment.PASS, "");
			settings.setProperty(Environment.HBM2DDL_AUTO, "create");
			settings.setProperty(Environment.DIALECT, "org.hibernate.dialect.MySQL5Dialect");
			settings.setProperty(Environment.HBM2DDL_AUTO, "create");
			settings.setProperty(Environment.SHOW_SQL, "true");

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
}
