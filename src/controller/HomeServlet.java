package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import repository.MembershipRepository;
import repository.MembershipTypeRepository;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("membershipTypes", MembershipTypeRepository.findAll());
		request.setAttribute("memberships", MembershipRepository.findAllPending());
		
		request.getRequestDispatcher("/home.jsp").forward(request, response);
	}
}
