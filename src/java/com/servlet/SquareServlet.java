/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.entity.House;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "SquareServlet", urlPatterns = {"/squareServlet"})
public class SquareServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            //площадь 
            double sq = Double.parseDouble(request.getParameter("value"));
            ArrayList<House> result = new ArrayList<>();

            Connection con;

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/publicutilities?useSSL=false", "root", "evelina2002");
            PreparedStatement pst = (PreparedStatement) con.prepareStatement("SELECT * FROM houses WHERE apartment_area > ?");

            pst.setDouble(1, sq);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                House house = new House(rs.getInt("id"), rs.getString("user_email"),
                        rs.getInt("apartment_number"), rs.getDouble("apartment_area"),
                        rs.getInt("floor"), rs.getInt("rooms_count"),
                        rs.getString("street"), rs.getString("building_type"),
                        rs.getDouble("life_time"));

                result.add(house);
            }
            
            RequestDispatcher rd;
            request.getSession().setAttribute("result", result);
            rd = getServletContext().getRequestDispatcher("/result.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Ошибка ввода данных");
            RequestDispatcher rd = getServletContext()
                    .getRequestDispatcher("/error.jsp");
            rd.forward(request, response);
        }
    }
}
