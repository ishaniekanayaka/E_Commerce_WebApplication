package lk.ijse.e_commerc_mynew;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryName", value = "/category-name")
public class CategoryName extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Integer> categoryIds = new ArrayList<>(); // List to hold category IDs
        try (Connection connection = dataSource.getConnection();
             Statement stm = connection.createStatement();
             ResultSet rst = stm.executeQuery("SELECT category_id FROM categories")) {

            // Fetch category IDs from the result set and add them to the list
            while (rst.next()) {
                categoryIds.add(rst.getInt("category_id"));
            }

            // Set the category IDs as a request attribute
            req.setAttribute("categoryIds", categoryIds);

            // Forward the request to product-new.jsp
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("product.jsp");
            requestDispatcher.forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
            // Log error and redirect to an error page
            resp.sendRedirect("category-list.jsp?error=Failed to load categories");
        }
    }
}
