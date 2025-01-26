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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "productServlet", value = "/product-list")

public class ProductListServlet extends HttpServlet {
        @Resource(name = "java:comp/env/jdbc/pool")
        private DataSource dataSource;

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            List<ProductDTO> productList = new ArrayList<>();
            try (Connection connection = dataSource.getConnection()) {
                // Query to fetch products
                String sql = "SELECT * FROM products";
                PreparedStatement pst = connection.prepareStatement(sql);
                ResultSet resultSet = pst.executeQuery();

                // Populate the product list
                while (resultSet.next()) {
                    ProductDTO product = new ProductDTO(
                           resultSet.getInt("product_id"),
                            resultSet.getString("product_name"),
                            resultSet.getString("product_description"),
                            resultSet.getDouble("product_price"),
                            resultSet.getInt("product_quantity"),
                            resultSet.getInt("category_id"),
                            resultSet.getString("image_path")

                    );
                    productList.add(product);
                }

                // Set products in request scope
                request.setAttribute("productList", productList);

                // Forward to JSP
                request.getRequestDispatcher("product-list.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to fetch products");
            }
        }
    }
