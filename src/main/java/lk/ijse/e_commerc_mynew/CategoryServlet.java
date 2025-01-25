package lk.ijse.e_commerc_mynew;

import jakarta.annotation.Resource;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "CategoryServlet", value = "/category-servlet")
public class CategoryServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("category_name");
        String description = req.getParameter("category_description");
        String categoryId = req.getParameter("category_id");
        String updateId = req.getParameter("update_category_id");
        String updateName = req.getParameter("update_name");
        String updateDescription = req.getParameter("update_description");

        if (name != null && description != null && categoryId == null) {
            // Insert category
            try (Connection connection = dataSource.getConnection()) {
                String sql = "INSERT INTO categories (category_name, description) VALUES (?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, name);
                    preparedStatement.setString(2, description);
                    int effectedRows = preparedStatement.executeUpdate();
                    if (effectedRows > 0) {
                        resp.sendRedirect("category.jsp?message=Category added");
                    } else {
                        resp.sendRedirect("category.jsp?error=Category not added");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                resp.sendRedirect("category.jsp?error=Category not added");
            }
        } else if (categoryId != null && name == null && description == null) {
            // Delete category
            try (Connection connection = dataSource.getConnection()) {
                String sql = "DELETE FROM categories WHERE category_id=?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setInt(1, Integer.parseInt(categoryId));
                    int effectedRows = preparedStatement.executeUpdate();
                    if (effectedRows > 0) {
                        resp.sendRedirect("category.jsp?message=Category deleted");
                    } else {
                        resp.sendRedirect("category.jsp?error=Category not deleted");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                resp.sendRedirect("category.jsp?error=Category not deleted");
            }
        } else if (updateId != null && updateName != null && updateDescription != null) {
            // Update category
            try (Connection connection = dataSource.getConnection()) {
                String sql = "UPDATE categories SET category_name=?, description=? WHERE category_id=?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, updateName);
                    preparedStatement.setString(2, updateDescription);
                    preparedStatement.setInt(3, Integer.parseInt(updateId));
                    int effectedRows = preparedStatement.executeUpdate();
                    if (effectedRows > 0) {
                        resp.sendRedirect("category.jsp?message=Category updated");
                    } else {
                        resp.sendRedirect("category.jsp?error=Category not updated");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                resp.sendRedirect("category.jsp?error=Category not updated");
            }
        } else {
            resp.sendRedirect("category.jsp?error=Invalid request");
        }
    }
}
