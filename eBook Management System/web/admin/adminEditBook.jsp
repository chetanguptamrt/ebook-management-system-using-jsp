<%-- 
    Document   : adminAddBook
    Created on : 07-Jun-2021, 10:42:19 AM
    Author     : chetan
--%>
<%@page import="com.detail.BookDetail"%>
<%@page import="com.dao.admin.BookDAO"%>
<%@page import="com.database.DBConnect"%>
<%
    if(session.getAttribute("admin")==null){
        response.sendRedirect("./adminLogin.jsp");
    } else {
        int bookId = 0;
        try{
            bookId = Integer.parseInt(request.getParameter("bookId"));
            BookDAO dao = new BookDAO(DBConnect.getConnection());
            BookDetail bd = dao.editBookDetail(bookId);
            if(bd==null){
                response.sendRedirect("./adminPanel.jsp");
            }
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
                    <h3>Edit Books</h3>
                    <small id="status" style="display: none"></small>
                </div>
            </div>
            <form id="editBook" >
                <div class="row">
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-12">
                        <input name="bookId" hidden value="<%= bd.getId() %>" />
                        <label for="bookName">Book Name <span style="color:red">*</span></label>
                        <input type="text" class="form-control" id="bookName" value="<%= bd.getBookName() %>" name="bookName" placeholder="Java: The Complete Reference" maxlength="100" required="required"/>
                        <label class="mt-2" for="authorName">Author Name <span style="color:red">*</span></label>
                        <input type="text" class="form-control" id="authorName" value="<%= bd.getAuthorName() %>" name="authorName" placeholder="Herbert Schildt" required="required"/>
                        <label class="mt-2" for="price">Price <span style="color:red">*</span></label>
                        <input type="number" class="form-control" id="price" name="price" value="<%= bd.getPrice() %>" placeholder="500 Rs" required="required"/>
                        <label class="mt-2" for="totalBook">Total book <span style="color:red">*</span></label>
                        <input type="number" class="form-control" id="totalBook" value="<%= bd.getAvailable() %>" name="totalBook" placeholder="100" required="required"/>
                        <label class="mt-2">Book Categories <span style="color:red">*</span></label>
                        <select name="category" id="category" class="form-control">
                            <%
                                if(bd.getBookCategory().equals("new")) {
                            %>
                                    <option value="new" selected>New Book</option>
                                    <option value="old">Old Book</option>
                            <%
                                } else {
                            %>
                                    <option value="new">New Book</option>
                                    <option value="old" selected>Old Book</option>                            
                            <%
                                }
                            %>
                        </select>
                        <div class="text-center mt-2">
                            <button type="submit" class="btn btn-outline-primary">Edit Book</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <script src="./js/adminEditBook.js"></script>
        
    </body>
</html>
<%
        } catch(Exception e){}
    }
%>
