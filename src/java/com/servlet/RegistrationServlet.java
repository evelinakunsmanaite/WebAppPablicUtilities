/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
@WebServlet(urlPatterns = {"/register"})
public class RegistrationServlet extends HttpServlet {

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

            String firstNname = request.getParameter("firstNname");
            String lastNname = request.getParameter("lastNname");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String status = request.getParameter("status");
            RequestDispatcher dispatcher;
            Connection con;
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/publicutilities?useSSL=false", "root", "evelina2002");
            PreparedStatement pst = (PreparedStatement) con.prepareStatement("insert into users(email,password,first_name,last_name,status) values(?,?,?,?,?)");

            pst.setString(1, email);
            pst.setString(2, pass);
            pst.setString(3, firstNname);
            pst.setString(4, lastNname);
            pst.setString(5, status);

            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("admin.jsp");

            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Ошибка ввода данных");
            RequestDispatcher rd = getServletContext()
                    .getRequestDispatcher("/errorAdmin.jsp");
            rd.forward(request, response);
        }
    }
}
