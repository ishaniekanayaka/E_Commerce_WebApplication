package lk.ijse.e_commerc_mynew;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "AdminLoginServlet", value = "/admin-login")
public class AdminLoginServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String emailOrPhone = req.getParameter("email"); // Get email or phone from form
        String password = req.getParameter("password");

        try (Connection connection = dataSource.getConnection()) {
            // Query to check if the admin exists with the given email/phone
            String query = "SELECT user_name, password, role FROM users WHERE (email = ? OR phone = ?) AND role = 'admin'";
            try (PreparedStatement ps = connection.prepareStatement(query)) {
                ps.setString(1, emailOrPhone);
                ps.setString(2, emailOrPhone);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // Found a matching admin account
                    String storedPasswordHash = rs.getString("password");
                    if (BCrypt.checkpw(password, storedPasswordHash)) {
                        // Password matches → Successful login
                        HttpSession session = req.getSession();
                        session.setAttribute("user_name", rs.getString("user_name"));
                        session.setAttribute("role", "admin"); // Store role in session
                        resp.sendRedirect("admin-dashboard.jsp"); // Redirect to dashboard
                    } else {
                        // Incorrect password
                        req.setAttribute("error", "Invalid credentials. Please try again.");
                        req.getRequestDispatcher("admin-login.jsp").forward(req, resp);
                    }
                } else {
                    // No matching admin account
                    req.setAttribute("error", "Invalid credentials. Please try again.");
                    req.getRequestDispatcher("admin-login.jsp").forward(req, resp);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }
}
