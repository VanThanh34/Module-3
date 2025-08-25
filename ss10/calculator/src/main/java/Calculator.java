import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Calculate", urlPatterns = "/calculate")
public class Calculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        double num1 = Double.parseDouble(req.getParameter("num1"));
        double num2 = Double.parseDouble(req.getParameter("num2"));
        double result = 0.0;
        String choose = req.getParameter("cal");
        switch (choose) {
            case "add":
                result = num1 + num2;
                resp.getWriter().println("<h1>Result: " + num1 + " " + getOperator(choose) + " " + num2 + " = " + result + "</h1>");
                break;
            case "sub":
                result = num1 - num2;
                resp.getWriter().println("<h1>Result: " + num1 + " " + getOperator(choose) + " " + num2 + " = " + result + "</h1>");
                break;
            case "mul":
                result = num1 * num2;
                resp.getWriter().println("<h1>Result: " + num1 + " " + getOperator(choose) + " " + num2 + " = " + result + "</h1>");
                break;
            case "div":
                if (num2 != 0) {
                    result = num1 / num2;
                    resp.getWriter().println("<h1>Result: " + num1 + " " + getOperator(choose) + " " + num2 + " = " + result + "</h1>");
                } else {
                    resp.getWriter().println("<h1>Div by 0!</h1>");
                }
                break;

            default:
                resp.getWriter().println("Invalid Operation!");
        }


        resp.getWriter().println("<br><a href='index.jsp'>Calculate Again</a>");
    }

    private String getOperator(String op) {
        switch (op) {
            case "add":
                return "+";
            case "sub":
                return "-";
            case "mul":
                return "×";
            case "div":
                return "÷";
            default:
                return "?";
        }
    }
}
