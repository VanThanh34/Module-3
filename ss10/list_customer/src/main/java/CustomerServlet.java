import entity.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="customerList", urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = new ArrayList<>();
        customers.add(new Customer("Võ Văn Thành", "2002-04-13", "Quảng Trị", "images/po.jpg"));
        customers.add(new Customer("Hồ Văn Tịnh", "2002-10-13", "Đà Nẵng 2", "images/download (1).jpg"));
        customers.add(new Customer("Lê Văn Tâm", "2004-03-27", "Raumanian", "images/dautrau.jpg"));
        customers.add(new Customer("Vũ Bão", "1999-08-17", "Quảng Trị", "images/download (2).jpg"));

        request.setAttribute("customers", customers);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
