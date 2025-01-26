package lk.ijse.e_commerc_mynew;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.e_commerc_mynew.dto.ProductDTO;


import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "NewProductList",value = "/new-product-list")
public class NewProductList extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // List to store all products
        List<ProductDTO> productList = new ArrayList<>();

        // Query to fetch all products
        String query = "SELECT  product_name, product_description, product_price, product_quantity, category_id, image_path FROM products";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement pst = connection.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {

            // Iterate through the result set and populate the product list
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setProductName(rs.getString("product_name"));
                product.setProductDescription(rs.getString("product_description"));
                product.setProductPrice(rs.getDouble("product_price"));
                product.setProductQuantity(rs.getInt("product_quantity"));
                product.setCategory_id(rs.getInt("category_id"));
                product.setImage_path(rs.getString("image_path"));

                productList.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to fetch products.");
            return;
        }

        // Set the product list as a request attribute
        request.setAttribute("productList", productList);

        // Forward to JSP page for rendering
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }



}
