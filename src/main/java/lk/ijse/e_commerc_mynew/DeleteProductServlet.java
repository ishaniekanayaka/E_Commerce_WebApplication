// DeleteProductServlet.java
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
@WebServlet(name = "DeleteProductServlet", value = "/delete-product-servlet")
public class DeleteProductServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String product_id = req.getParameter("id");

        if (product_id != null) {
            try (Connection connection = dataSource.getConnection()) {
                String sql = "DELETE FROM products WHERE product_id=?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setInt(1, Integer.parseInt(product_id));
                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        req.setAttribute("message", "Product deleted successfully.");
                    } else {
                        req.setAttribute("error", "Product not found.");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("error", "Error deleting product.");
            }
        }
        resp.sendRedirect("product-list");
    }
}

