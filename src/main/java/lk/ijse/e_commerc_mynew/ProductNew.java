
package lk.ijse.e_commerc_mynew;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.e_commerc_mynew.dto.ProductDTO;


import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "ProductNew", value = "/product-new")
@MultipartConfig
public class ProductNew extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        // Retrieve form data
        String productName = request.getParameter("productName");
        String productDescription = request.getParameter("productDescription");
        String productPriceStr = request.getParameter("productPrice");
        String productQuantityStr = request.getParameter("productQuantity");
        String categoryIdStr = request.getParameter("category_id"); // Updated to match the JSP field name
        System.out.println("Selected Category ID: " + categoryIdStr);
        Part productImagePart = request.getPart("productImage");

        // Validate required fields
        if (productName == null || productDescription == null || productPriceStr == null ||
                productQuantityStr == null || categoryIdStr == null || productImagePart == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required.");
            return;
        }

        double productPrice;
        int productQuantity;
        int categoryId;

        // Parse numeric values
        try {
            productPrice = Double.parseDouble(productPriceStr.trim());
            productQuantity = Integer.parseInt(productQuantityStr.trim());
            categoryId = Integer.parseInt(categoryIdStr.trim());
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid numeric values.");
            return;
        }

        // Handle file upload
        String imagePath = null;
        if (productImagePart != null && productImagePart.getSize() > 0) {
            String fileName = productImagePart.getSubmittedFileName();
            String uploadDir = getServletContext().getRealPath("/") + "uploads";

            // Ensure the directory exists
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            imagePath = "uploads/" + fileName;
            Path filePath = Path.of(uploadDir, fileName);

            try (InputStream fileContent = productImagePart.getInputStream()) {
                Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "File upload failed.");
                return;
            }
        }

        // Create ProductDTO
        ProductDTO product = new ProductDTO();
        product.setProductName(productName);
        product.setProductDescription(productDescription);
        product.setProductPrice(productPrice);
        product.setProductQuantity(productQuantity);
        product.setCategory_id(categoryId);
        product.setImage_path(imagePath);

        // Save the product to the database
        try (Connection connection = dataSource.getConnection()) {
            String insertQuery = "INSERT INTO products (product_name, product_description, product_price, " +
                    "product_quantity, category_id, image_path) VALUES (?, ?, ?, ?, ?, ?)";

            try (PreparedStatement pst = connection.prepareStatement(insertQuery)) {
                pst.setString(1, product.getProductName());
                pst.setString(2, product.getProductDescription());
                pst.setDouble(3, product.getProductPrice());
                pst.setInt(4, product.getProductQuantity());
                pst.setInt(5, product.getCategory_id());
                pst.setString(6, product.getImage_path());

                int rowsAffected = pst.executeUpdate();
                if (rowsAffected > 0) {
                    // Redirect to the product list page
                    response.sendRedirect("product-list");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to save the product.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }
}
