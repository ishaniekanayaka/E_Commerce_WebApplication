package lk.ijse.e_commerc_mynew;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "DeleteUserServlet", value = "/delete-user-servlet")
public class DeleteUserServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("id");

        if (userId != null) {
            try (Connection connection = dataSource.getConnection()) {
                String sql = "DELETE FROM users WHERE user_id=?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setInt(1, Integer.parseInt(userId));
                    preparedStatement.executeUpdate();
                }
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("error", "Error deleting user.");
            }
        }
        resp.sendRedirect("user-list");
    }
}
