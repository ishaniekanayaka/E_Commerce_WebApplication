package lk.ijse.e_commerc_mynew;

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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "POSLoginServlet", value = "/pos-login-servlet")
public class LoginServlet extends HttpServlet {
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        // Initialize DataSource (assumes it's already set in context)
        this.dataSource = (DataSource) getServletContext().getAttribute("DataSource");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("user_name");
        String password = req.getParameter("password");

        // Connect to the database and validate login credentials
        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT password FROM users WHERE user_name = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, userName);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        String storedPassword = resultSet.getString("password");

                        // Verify password with BCrypt
                        if (BCrypt.checkpw(password, storedPassword)) {
                            // Redirect to the dashboard on successful login
                            resp.sendRedirect("admin-dashboard.jsp");
                        } else {
                            resp.sendRedirect("admin-register.jsp?error=Invalid credentials.");
                        }
                    } else {
                        resp.sendRedirect("admin-register.jsp?error=User not found.");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("pos-login.jsp?error=Database error.");
        }
    }
}
