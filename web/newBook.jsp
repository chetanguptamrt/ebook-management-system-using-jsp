<%-- 
    Document   : index
    Created on : 31-May-2021, 9:09:14 PM
    Author     : chetan
--%>
<%@page import="com.dao.SearchDAO"%>
<%@page import="com.database.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.detail.BookDetail"%>
<%@page import="com.dao.UserBookDAO"%>
<%
    String search = null;
    try{
        search = request.getParameter("search");
    } catch(Exception e) {}
    if(search==null){
        search = "";
    }
    
    SearchDAO dao2 = new SearchDAO(DBConnect.getConnection());
    UserBookDAO dao1 = new UserBookDAO(DBConnect.getConnection());
    
    int pageNo = 1;
    try{
        pageNo = Integer.parseInt(request.getParameter("pageNo"));
    } catch(Exception e){}
    
    List<BookDetail> list1;
    int totalPage = 1;
    if(search.trim().equals("")) {
        list1 = dao1.newBookByPageNo(pageNo);
        totalPage = dao1.countNewBook();
    } else {
        StringBuilder query = new StringBuilder("FROM book WHERE bookCategory = 'new' and ( bookName LIKE '%"+search+"%'");
        
        String[] search2 = search.split(" ");
        for (String search21 : search2) {
            if (!search21.trim().equals("")) {
                query.append(" OR bookName LIKE '%").append(search21).append("%'");
            }
        }
        query.append(") ");
        
        list1 = dao2.newBookSearch(new String("SELECT * "+query), pageNo);
        totalPage = dao2.newBookSearchPageCount(new String("SELECT COUNT(*) AS total "+query));
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/header.jsp" %>
        <title>New Book | Book Store</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        
        <div class="container-fluid cover-img">
            <div class="row">
                <div class="col-12">
                    <h3 class="text-light mt-2 mb-2 cover-img-text">New Book</h3>
                </div>
            </div>
        </div>

        <div class="card-show container-fluid mt-3 mb-4">
            
            <div class="row mr-1 ml-1">
                <%
                    for(BookDetail bd : list1) {
                %>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-6 m-0 p-1">
                            <div class="card card-highlight m-0 p-0">
                                <div class="p-2 text-center">
                                    <img src="./img/books-img/<%= bd.getPhoto() %>" class="img-fluid card-img-show">
                                </div>
                                <div class="card-body m-0 pt-0 pl-1 pr-1 pb-2 ">
                                    <div style="font-weight: 600; font-size: 14px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; " class="ml-2 mr-2" >
                                        <%= bd.getBookName() %>
                                    </div>
                                    <div class="ml-2 mr-2">
                                        MRP - <span><%= bd.getPrice() %></span>/- Rs
                                    </div>
                                    <div style="display: flex;">
                                        <a href="./viewBook.jsp?bookId=<%= bd.getId() %>" target="_blank" class="btn btn-outline-primary form-control ml-2 mr-1 btn-sm">View Item</a>
                                        <button onclick="addCart(<%= bd.getId() %>)" class="btn btn-outline-dark btn-sm mr-2">
                                            <i class="fas fa-cart-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                <%
                    }
                    if (list1.size()==0){
                %>
                        <div class="col-12 text-danger text-center">
                            <h1><i class="far fa-frown"></i></h1>
                            <h1>No result found</h1>
                        </div>
                <%
                    }
                %>
            </div>
            <div class="row mt-2 mb-1">
                <%
                    if (list1.size()!=0){                    
                %>
                    <div class="col-12 text-center">
                        Page
                    </div>
                <%
                    }
                %>
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
                                            <a class="page-link" href="./newBook.jsp?search=<%= search %>&pageNo=<%= pageN %>" >
                                                <%= pageN %>
                                            </a>
                                        </li>
                            <%
                                    }
                                    totalPage-=20;
                                }
                            %>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <script>
            $("#searchInput").val("<%= search %>");
            $("#searchInput2").val("<%= search %>");
            $("#searchBook").attr("action","./newBook.jsp");
            $("#searchBook2").attr("action","./newBook.jsp");
        </script>
        <script src="js/addCart.js" type="text/javascript"></script>
    </body>
</html>
