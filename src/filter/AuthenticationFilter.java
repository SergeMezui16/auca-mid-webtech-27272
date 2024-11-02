package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import repository.UserRepository;
import utils.SessionManager;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    private final List<String> authorizedPaths = Arrays.asList(
            "/login", "/register", "/resources", "/css", "/js", "/images"
    );

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String path = httpRequest.getRequestURI();

        if (isAuthorizedPath(path, httpRequest)) {
        	System.out.println("Authorized path");
            chain.doFilter(request, response);
            return;
        }	

        if (!SessionManager.isValid(httpRequest)) {
        	System.out.println("No session.");
            httpRequest.getRequestDispatcher("/WEB-INF/views/security/login.jsp").forward(httpRequest, httpResponse);
            return;
        }
        
        User user = SessionManager.getAuth(httpRequest);
        
        if(user != null) {
            // update session
            SessionManager.setAuth(httpRequest, UserRepository.findById(user.getUsername()));
        }
    	System.out.println("Filter passed.");
        chain.doFilter(request, response);
    }
    
    
    private List<String> generatePaths(HttpServletRequest request) {
    	List<String> prefixedStrings = new ArrayList<>();
    	for (String str : authorizedPaths) {
            prefixedStrings.add(request.getContextPath() + str);
        }
        return prefixedStrings;
    }

    private boolean isAuthorizedPath(String path, HttpServletRequest request) {
        return generatePaths(request).stream().anyMatch(path::startsWith);
    }

	@Override
	public void destroy() {
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}
}
