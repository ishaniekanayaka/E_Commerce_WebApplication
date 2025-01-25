package lk.ijse.e_commerc_mynew;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.e_commerc_mynew.dto.CategoryDTO;


import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryListServlet", value = "/category-list")
public class CategoryListServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryDTO> categoryDTOList = new ArrayList<>();
        try {
            Connection connection = dataSource.getConnection();
            String sql = "select * from categories";
            Statement stm = connection.createStatement();
            ResultSet rst = stm.executeQuery(sql);
            while (rst.next()) {
                CategoryDTO categoryDTO = new CategoryDTO(
                        rst.getInt(1),
                        rst.getString(2),
                        rst.getString(3)
                );
                categoryDTOList.add(categoryDTO);
            }
            req.setAttribute("categoryList", categoryDTOList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("category-list.jsp");
            requestDispatcher.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("category-list.jsp?error=Fail to load categories");
        }
    }
}


