<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<% if (session.getAttribute("username") == null || session.getAttribute("password") == null) {
   response.sendRedirect("../index.jsp"); return; } %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" href="./style/style.css" />
    <title>Admin</title>
  </head>
  <body>
    <div class="pos">
      <div class="content">
        <div class="past1">
          <div class="box1">
            <button id="sidebar-toggle" class="toggle-btn">
              <i class="fas fa-bars"></i>
            </button>
          </div>
          <div class="past2">
            <h1>POS System</h1>
          <%-- <button onclick="loadProducts()">Refresh</button> --%>
          </div>
        </div>
        <%-- <div class="name_admin">
          <img
            src="./style/imgs/Exit.png"
            alt="Login icon"
            class="login-btn-icon"
            id="loginNavIcon"
            onclick="showLogoutLink()"
          />
        </div> --%>
      </div>
      <div class="cart">
        <div class="cart_pd">
          <h1>cart</h1>
        </div>
      </div>
    </div>

    <div class="content-wrapper">
      <div id="sidebar" class="sidebar">
        <ul class="sidebar-nav">
          <li>
             <a class="nav-link"  onclick="loadPage('../Admin/page/Home/Home.jsp'); return false;"
              ><i class="fas fa-home"></i><span>Home</span></a
            >
          </li>
          <li>
          <a class="nav-link" onclick="loadPage('../Admin/page/Products/Products.html'); return false;"
            ><i class="fas fa-cube"></i><span>Apps</span></a>
          </li>
          <li>
            <a href="/index.jsp"
              ><i class="fas fa-boxes"></i><span>Products</span
              ><i class="fas fa-angle-right arrow"></i
            ></a>
          </li>
          <li>
            <a href="#"
              ><i class="fas fa-tags"></i><span>Categories</span
              ><i class="fas fa-angle-right arrow"></i
            ></a>
          </li>
          <li>
            <a href="#"
              ><i class="fas fa-chart-line"></i><span>Sales</span
              ><i class="fas fa-angle-right arrow"></i
            ></a>
          </li>
          <li>
            <a href="#"
              ><i class="fas fa-exchange-alt"></i><span>Transfers</span
              ><i class="fas fa-angle-right arrow"></i
            ></a>
          </li>
          <li>
            <a href="#"
              ><i class="fas fa-shopping-cart"></i><span>Purchases</span
              ><i class="fas fa-angle-right arrow"></i
            ></a>
          </li>
          <li>
            <a href="#"><i class="fas fa-gift"></i><span>Gift Card</span></a>
          </li>
          <li>
            <a href="#"
              ><i class="fas fa-users"></i><span>People</span
              ><i class="fas fa-angle-right arrow"></i
            ></a>
          </li>
          <li>
              <a class="nav-link" onclick="loadPage('../Admin/page/Settings/Settings.jsp'); return false;"
              ><i class="fas fa-cog"></i><span>Settings</span
              ><i class="fas fa-angle-right arrow"></i
            ></a>
          </li>
          <li>
            <a href="#"
              ><i class="fas fa-chart-pie"></i><span>Reports</span
              ><i class="fas fa-angle-right arrow"></i
            ></a>
          </li>
        </ul>
         <div class="name_admin">
         <div class ="name"  onclick="showLogoutLink()">
          <img
            src="./style/imgs/Exit.png"
            alt="Login icon"
            class="login-btn-icon"
            id="loginNavIcon"
            onclick="showLogoutLink()"
          />
          <h4  onclick="showLogoutLink()">Logout</h4>
         </div>
        </div>
      </div>


      

      <div id="main-content" class="main-content">

      
      </div>
    </div>
    <script src="../js/path.js"></script>
    <script src="../js/logout.js"></script>
    <script src="../js/navbar.js"></script>
    <script src="../js/select.js"></script>
    <script src="./page/Settings/js/path.js"></script>
    <script src="./page/Settings/js/productForm.js"></script>
    <script src="../js/img.js"></script>



  </body>
</html>
