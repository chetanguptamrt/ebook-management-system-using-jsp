<%@page import="com.dao.CartDAO"%>
<%@page import="com.database.DBConnect"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.detail.UserDetail"%>
<%
    UserDetail ud = (UserDetail) session.getAttribute("userL");
    if(ud!=null) {
        UserDAO dao = new UserDAO();
        session.setAttribute("userL", dao.userDetail(ud.getEmail()));
        UserDetail ud1 = (UserDetail) session.getAttribute("userL");
        if(!ud1.isActive()) {
%>
    <div class="container-fluid m-0 pt-1 pb-1 bg-danger text-center text-light">
        <p class="m-0">This account is not activate. Please check your email(<%= ud.getEmail() %>).</p>
    </div>  
<%
        }
    }
%>
<div class="container-fluid p-4 top-navbar-custom m-0" id="topNavBar">
    <div class="row">
        <div class="col-md-2">
            <h3 class="text-success">
                <i class="fas fa-book"></i> eBook
            </h3>
        </div>

        <div  class="col-md-6 pl-5 pr-5">
            <form id="searchBook">
                <div style="display: flex">
                    <input class="form-control mr-sm-2" name="search" id="searchInput" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                </div>
            </form>
        </div>
        
        <div class="col-md-4 text-right">
        <%
            if(ud==null) {
        %>
            <button class="btn btn-success" data-toggle="modal" data-target="#modalLogin">
                <i class="fas fa-user"></i> Login
            </button>
            <button class="btn btn-primary" data-toggle="modal" data-target="#modalRegister">
                <i class="fas fa-user-plus"></i> Register
            </button>

        <%
            } else {
        %>
            <a href="./UserLogoutServlet" class="btn btn-danger">
                <i class="fa fa-sign-out-alt" aria-hidden="true"></i> Logout
            </a>
        <%
            }
        %>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom" id="downNav">
    <a class="navbar-brand" href="#"><i class="fa fa-home" aria-hidden="true"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link mr-2" href="./index.jsp">Home </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link mr-2" href="./newBook.jsp"><i class="fa fa-book" aria-hidden="true"></i> New Book</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link mr-2" href="./oldBook.jsp"><i class="fas fa-book-open"></i> Old Book</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link mr-2" href="./contact.jsp"><i class="fas fa-phone-alt"></i> Contact Us</a>
            </li>
            <%
                if(ud!=null) {
                    CartDAO cartDAO = new CartDAO(DBConnect.getConnection());
                    int totalCart = cartDAO.totalCart(ud.getId());
            %>
            <li class="nav-item active">
                <a class="nav-link mr-2" href="./myCart.jsp">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i> My Cart (<span id="navbarTotalCart"><%= totalCart %></span>)
                </a>
            </li>
            <%
                }
            %>
      </ul>
    <%
        if(ud!=null) {
    %>
            <div class="my-2 my-lg-0">
                <a class="btn btn-outline-light" href="./profile.jsp">
                    <i class="fas fa-user"></i> <%= ud.getName() %>
                </a>
            </div>
    <%
        }
    %>
   </div>
</nav>

<div class="container-fluid p-4 top-navbar-custom2 m-0">
    <div class="row">
        <div class="col-md-5 col-sm-5 col-4">
            <h3 class="text-success">
                <i class="fas fa-book"></i> eBook
            </h3>
        </div>
        <div class="col-md-7 col-sm-7 col-8 text-right">
        <%
            if(ud==null) {
        %>
            <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#modalLogin">
                <i class="fas fa-user"></i> Login
            </button>
            <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalRegister">
                <i class="fas fa-user-plus"></i> Register
            </button>
        <%
            } else {
        %>
            <a href="./UserLogoutServlet" class="btn btn-danger btn-sm">
                <i class="fa fa-sign-out-alt" aria-hidden="true"></i> Logout
            </a>
        <%
            }
        %>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 mt-2">
            <form id="searchBook2">
                <div style="display: flex">
                    <input class="form-control mr-1" id="searchInput2" name="search" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-primary " type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                </div>
            </form>
            
        </div>
    </div>
</div>

<%
    if(ud==null) {
%>
<!--modal-->
<div class="modal fade" id="modalLogin" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Sign in</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="loginForm">
                <div class="modal-body" >
                    <div class="alert alert-danger" id="lStatus" style="display: none"></div>
                    <label for="lEmail">Email Address</label> <br/>
                    <input type="email" id="lEmail" name="lEmail" required="required" class="form-control" placeholder="john@example.com" />
                    <label for="lPassword" class="mt-2">Password</label> <br/>
                    <input type="password" id="lPassword" name="lPassword" required="required" class="form-control" placeholder="password" />
                    <div class="text-center mt-2">
                        <a href="forgotPassword.jsp" target="_blank" >Forgot Password?</a>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="modalRegister" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Sign in</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="registerForm">
                <div class="modal-body" >
                    <div class="alert alert-danger" id="rStatus" style="display: none"></div>
                    <label for="rName">Name</label> <br/>
                    <input type="text" id="rName" name="rName" required="required" class="form-control" placeholder="John Smith" />
                    <label for="rEmail" class="mt-2">Email Address</label> <br/>
                    <input type="email" id="rEmail" name="rEmail" required="required" class="form-control" placeholder="john@example.com" />
                    <label for="rPassword" class="mt-2">Password</label> <br/>
                    <input type="password" id="rPassword" name="rPassword" required="required" class="form-control" placeholder="password" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="./js/login.js" type="text/javascript"></script>
<%
    }
%>