/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "UpdateServlet", urlPatterns = {"/updateServlet"})
public class UpdateServlet extends HttpServlet {

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
        Connection con = null;

        try {

            String idString = request.getParameter("id");
            int id = Integer.parseInt(idString);

            String userEmail = request.getParameter("userEmail");

            String apartmentNumberString = request.getParameter("apartmentNumber");
            int apartmentNumber = Integer.parseInt(apartmentNumberString);

            String apartmentAreaString = request.getParameter("apartmentArea");
            double apartmentArea = Double.parseDouble(apartmentAreaString);

            String floorString = request.getParameter("floor");
            int floor = Integer.parseInt(floorString);

            String roomsCountString = request.getParameter("roomsCount");
            int roomsCount = Integer.parseInt(roomsCountString);

            String street = request.getParameter("street");

            String buildingType = request.getParameter("buildingType");

            String lifeTimeString = request.getParameter("lifeTime");
            double lifeTime = Double.parseDouble(lifeTimeString);

            RequestDispatcher dispatcher;

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/publicutilities?useSSL=false", "root", "evelina2002");
            PreparedStatement pst = con.prepareStatement("UPDATE houses SET user_email =?, apartment_number =?, apartment_area =?, floor =?, rooms_count =?, street =?, building_type =?, life_time =? WHERE id =?");

            pst.setString(1, userEmail);
            pst.setInt(2, apartmentNumber);
            pst.setDouble(3, apartmentArea);
            pst.setInt(4, floor);
            pst.setInt(5, roomsCount);
            pst.setString(6, street);
            pst.setString(7, buildingType);
            pst.setDouble(8, lifeTime);
            pst.setInt(9, id);

            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("update.jsp");

            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
            dispatcher.forward(request, response);

        } catch (IOException e) {
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(HousesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
