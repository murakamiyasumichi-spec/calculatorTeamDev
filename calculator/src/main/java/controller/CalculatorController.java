package controller;

import model.FourArithmeticOperations;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/calculator")
public class CalculatorController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("formula", "0");
        request.setAttribute("acOrC", "AC");
        request.getRequestDispatcher("/WEB-INF/views/calculator.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String formula = request.getParameter("formula");
        request.setAttribute("formula", formula);
        System.out.println("formula");

        request.getRequestDispatcher("/WEB-INF/views/calculator.jsp").forward(request, response);
    }
}