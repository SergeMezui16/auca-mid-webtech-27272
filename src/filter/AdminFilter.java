package filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Role;
import entity.User;
import utils.SessionManager;

@WebFilter("/*") 
public class AdminFilter implements Filter {


    private static final Set<String> PROTECTED_PATHS = new HashSet<>(Arrays.asList(
        "/users",
        "/books",
        "/borrowers",
        "/locations",
        "/memberships",
        "/membership_types",
        "/rooms",
        "/shelves"
    ));


    private static final List<Role> REQUIRED_ROLES = Arrays.asList(Role.DEAN, Role.HOD, Role.LIBRARIAN, Role.MANAGER);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        User user = SessionManager.getAuth(httpRequest);
        
        String requestPath = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        
        if (user != null && PROTECTED_PATHS.contains(requestPath)) {
            if (!REQUIRED_ROLES.contains(user.getRole())) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/");
                return;
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
