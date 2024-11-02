package utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import entity.User;

public class SessionManager {

	private static final String AUTH_SESSION_NAME = "auth";

	public static User getAuth(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(SessionManager.AUTH_SESSION_NAME);

		return user;
	}

	public static User setAuth(HttpServletRequest request, User user) {
		HttpSession session = request.getSession();
		session.setAttribute(SessionManager.AUTH_SESSION_NAME, user);

		return user;
	}

	public static void invalidate(HttpServletRequest request) {
		HttpSession session = request.getSession();

		if (session != null)
			session.invalidate();
	}

	public static boolean isValid(HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		return !(session == null || session.getAttribute(SessionManager.AUTH_SESSION_NAME) == null);
	}
}
