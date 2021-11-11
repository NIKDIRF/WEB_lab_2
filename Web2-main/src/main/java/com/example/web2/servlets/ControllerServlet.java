package com.example.web2.servlets;

import javax.validation.constraints.NotNull;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String x_value = req.getParameter("X_field");
        String y_value = req.getParameter("Y_field");
        String r_value = req.getParameter("R_field");
        if (x_value != null && y_value != null && r_value != null) {
            try {
                double x = Double.parseDouble(substr(x_value, 0, 12));
                double y = Double.parseDouble(substr(y_value, 0, 12));
                double r = Double.parseDouble(substr(r_value,0, 12));

                if (isValid(x, y, r)) {

                    getServletContext().getRequestDispatcher("/areaCheckServlet").forward(req, resp);
                } else {
                    String canvas = req.getParameter("Canvas_clicked");

                    if (canvas != null && canvas.equalsIgnoreCase("true"))
                        getServletContext().getRequestDispatcher("/areaCheckServlet").forward(req, resp);
                    else
                        resp.sendError(400);
                }
            } catch (NumberFormatException e) {
                System.out.println(e.getClass());
                getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            } catch (Error error) {
                error.printStackTrace();
                System.out.println("ku");
            }
        } else {
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }

    }

    private String substr(String s, int start, int end) {
        if (s != null && s.length() >= end)
            return s.substring(start, end);
        else
            return s;
    }

    public boolean isValid(double x, double y, double r) {
        return (x > -3) && (x < 3) && (y >= -5) && (y <= 3) && (r >= 1) && (r <= 5);
    }
}

