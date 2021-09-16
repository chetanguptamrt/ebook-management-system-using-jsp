/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.ShippingDAO;
import com.database.DBConnect;
import com.detail.ShippingDetail;
import com.detail.UserDetail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chetan
 */
public class ShippingAddressServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("userL")!=null){
            UserDetail ud = (UserDetail) session.getAttribute("userL");
            int userId = ud.getId();
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address1 = request.getParameter("add1");
            String address2 = request.getParameter("add2");
            String landmark = request.getParameter("lMark");
            String city = request.getParameter("city");
            String pinCode = request.getParameter("pin");
            ShippingDetail sd = new ShippingDetail();
            sd.setName(name);
            sd.setPhone(phone);
            sd.setAddress1(address1);
            sd.setAddress2(address2);
            sd.setLandmark(landmark);
            sd.setCity(city);
            sd.setPinCode(pinCode);
            sd.setUserId(userId);
            ShippingDAO dao = new ShippingDAO(DBConnect.getConnection());
            String done = dao.insertAddress(sd);
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println(done);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
