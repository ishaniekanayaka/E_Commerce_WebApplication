package lk.ijse.e_commerc_mynew;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "AdminRegisterServlet", value = "/admin-register-servlet")
public class AdminRegisterServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("user_name");
        String email = request.getParameter("email");
        String plainPassword = request.getParameter("password");

        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        String status = "active";
        String role;


        if (/*(phone == null || phone.trim().isEmpty()) ||*/ (address == null || address.trim().isEmpty())) {
            role = "customer";
//            /*phone = ""; */
            address = "empty";
        } else {
            role = "admin";
        }

        // Hash the password
        String hashedPassword = BCrypt.hashpw(plainPassword, BCrypt.gensalt());

        try (Connection conn = dataSource.getConnection()) {
            String sql = "INSERT INTO users (user_name, email, password, phone, address, role, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, hashedPassword);
                stmt.setString(4, phone);
                stmt.setString(5, address);
                stmt.setString(6, role);
                stmt.setString(7, status);

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    if ("customer".equalsIgnoreCase(role)) {
                        response.sendRedirect("index.jsp?message=Customer registered successfully!");
                    } else {
                        response.sendRedirect("admin-dashboard.jsp?message=Admin registered successfully!");
                    }
                } else {
                    response.sendRedirect("admin-register.jsp?error=Registration failed. Please try again.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
