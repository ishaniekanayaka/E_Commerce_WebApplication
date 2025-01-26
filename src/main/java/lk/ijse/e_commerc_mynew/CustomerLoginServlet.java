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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Base64;

@WebServlet(name = "CustomerLoginServlet", value = "/customer-login")
public class CustomerLoginServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String emailOrPhone = req.getParameter("email"); // Get email or phone from form
        String password = req.getParameter("password");

        try (Connection connection = dataSource.getConnection()) {
            // Query to check if the admin exists with the given email/phone
            String query = "SELECT user_name, password, role FROM users WHERE (email = ? OR phone = ?) AND role = 'customer'";
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
                        session.setAttribute("role", "customer"); // Store role in session
                        resp.sendRedirect("check-out.jsp"); // Redirect to dashboard
                    } else {
                        // Incorrect password
                        req.setAttribute("error", "Invalid credentials. Please try again.");
                        req.getRequestDispatcher("registerCart.jsp").forward(req, resp);
                    }
                } else {
                    // No matching admin account
                    req.setAttribute("error", "Invalid credentials. Please try again.");
                    req.getRequestDispatcher("customerLogin.jsp").forward(req, resp);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }
}
