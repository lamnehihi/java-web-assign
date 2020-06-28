<%-- 
    Document   : sideBar
    Created on : Jun 26, 2020, 8:14:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light sideBar">
    <a class="navbar-brand sidebar-brand text-white" href="#">
        <div class="mb-2 ml-3">
            <div class="sidebar-brand-icon">
                <img id="logo" src="./images/glasses.svg" alt="logo" />
            </div>
            <div class="sidebar-brand-text">Nerd</div>
        </div>
    </a>
    <hr class="sidebar-divider my-0" />
    <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button> -->
    <div class="w-100" id="navbarNav w-100">
        <ul class="navbar-nav mt-2 d-flex align-items-start">
            <li class="nav-item active">
                <a class="nav-link text-white" href="#"
                   >Dash Board <span class="sr-only">(current)</span></a
                >
            </li>
            <hr class="sidebar-divider my-0 w-100 mt-3">
            <li class="nav-item">
                <a class="nav-link text-white-50" href="#">Book</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white-50" href="#">User</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white-50" href="#">Order</a>
            </li>
        </ul>
    </div>
</nav>