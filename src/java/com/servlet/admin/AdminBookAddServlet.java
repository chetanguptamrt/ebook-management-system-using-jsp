/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet.admin;

import com.dao.admin.BookDAO;
import com.database.DBConnect;
import com.detail.BookDetail;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author chetan
 */
@MultipartConfig
public class AdminBookAddServlet extends HttpServlet {

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
        try{
            HttpSession session = request.getSession();
            if(session.getAttribute("admin")==null){
                return;
            }
            String bookName = request.getParameter("bookName").trim();
            String authorName = request.getParameter("authorName").trim();
            int price = Integer.parseInt(request.getParameter("price").trim());
            int totalBook = Integer.parseInt(request.getParameter("totalBook").trim());
            String category = request.getParameter("category").trim();
            Part part = request.getPart("photo");
            String fileName = part.getSubmittedFileName();
            BookDetail bd = new BookDetail();
            bd.setBookName(bookName);
            bd.setAuthorName(authorName);
            bd.setPrice(price);
            bd.setAvailable(totalBook);
            bd.setBookCategory(category);
            bd.setPhoto(fileName);
            StringBuilder sb = new StringBuilder();
            for(int i = fileName.length()-1;i>0;i--){
                if(fileName.charAt(i)=='.'){
                    break;
                }
                sb.insert(0, fileName.charAt(i));
            }
            BookDAO dao = new BookDAO(DBConnect.getConnection());
            String f = dao.addBook(bd, sb);
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                if(!f.equals("no")) {
                    InputStream is = part.getInputStream();
                    byte[] data = new byte[is.available()];
                    is.read(data);
                    String path = request.getRealPath("/")+"img"+File.separator+"books-img"+File.separator+f;
                    System.out.println(path);
                    try (FileOutputStream fos = new FileOutputStream(path)) {
                        fos.write(data);
                    }
                    out.println("done");
                }
                else
                    out.println("no");
            }            
        } catch(IOException | NullPointerException | NumberFormatException | ServletException e){
            e.printStackTrace();
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
