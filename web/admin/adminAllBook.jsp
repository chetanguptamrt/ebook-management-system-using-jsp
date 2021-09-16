<%-- 
    Document   : adminAllBook
    Created on : 07-Jun-2021, 10:44:57 AM
    Author     : chetan
--%>

<%@page import="com.detail.BookDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.database.DBConnect"%>
<%@page import="com.dao.admin.BookDAO"%>
<%
    if(session.getAttribute("admin")==null){
        response.sendRedirect("./adminLogin.jsp");
    } else {
        int pageNo = 1;
        try{
            pageNo = Integer.parseInt(request.getParameter("pageNo"));
        } catch(Exception e){
            e.printStackTrace();
        }
        BookDAO dao = new BookDAO(DBConnect.getConnection());
        List<BookDetail> list = dao.showBook(pageNo);
        int totalPage = dao.bookCount();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="adminHead.jsp" %>
        <title>Admin Panel | Book Store</title>
    </head>
    <body>
        <%@include file="adminNavbar.jsp" %>
        
        <div class="container-fluid mt-2 mb-5">
            <div class="row mb-1">
                <div class="col-12 text-center">
                    <h3>All Books</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-12 table-responsive">
                    <table class="table table-striped">
                        <thead class="thead-dark-custom">
                            <tr>
                                <td>Id</td>
                                <td>Book Name</td>
                                <td>Author Name</td>
                                <td>
                                    Price<br/>
                                    (in Rs.)
                                </td>
                                <td>Book Categories</td>
                                <td>Availability</td>
                                <td>Action</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(BookDetail bd: list) {
                            %>
                                <tr>
                                    <td><h6><%= bd.getId() %></h6></td>
                                    <td>
                                        <div style="display: flex;">
                                            <img width="50px" class="img-fluid mr-1" src="../img/books-img/<%= bd.getPhoto() %>" />
                                            <span><%= bd.getBookName() %></span>
                                        </div>
                                    </td>
                                    <td><%= bd.getAuthorName() %></td>
                                    <td><%= bd.getPrice() %>/-</td>
                                    <td><%= bd.getBookCategory() %></td>
                                    <td><%= bd.getAvailable() %></td>
                                    <td>
                                        <div style="display:flex">
                                            <a class="btn btn-primary btn-sm mr-2" href="./adminEditBook.jsp?bookId=<%= bd.getId() %>" >Edit</a>
                                            <a class="btn btn-danger btn-sm" href="../AdminDeleteBookServlet?id=<%= bd.getId() %>" >Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row mt-3 mb-2"> 
                <div class="col-12 text-center">
                    <label>Page</label>
                </div>
                <div class="col-12 text-center">
                    <nav>
                        <ul class="pagination pagination-sm justify-content-center">
                            <%
                                int pageN = 0;
                                while(totalPage>0) {
                                    pageN+=1;
                                    if(pageN==pageNo){
                            %>
                                        <li class="page-item active">
                                            <span class="page-link" ><%= pageN %></span>
                                        </li>
                            <%
                                    } else {
                            %>
                                        <li class="page-item">
                                            <a class="page-link" href="./adminAllBook.jsp?pageNo=<%= pageN %>" >
                                                <%= pageN %>
                                            </a>
                                        </li>
                            <%
                                    }
                                    totalPage-=10;
                                }
                            %>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
         
    </body>
</html>
<%
    }
%>
