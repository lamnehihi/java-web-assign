<%-- 
    Document   : slider
    Created on : Jul 6, 2020, 10:45:20 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="slider">
    <h2 class="pb-3">My List</h2>
    <div class="container p-0">
        <!-- slider real -->
        <div id="carouselExampleIndicators" class="carousel slide p-5" data-ride="carousel" data-pause="hover" data-interval="5000">
            <ol class="carousel-indicators p-0 hover">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="row d-flex justify-content-center">
                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/1.jpg" alt="" class="w-100">
                        </a>

                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/2.jpg" alt="" class="w-100">
                        </a>

                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/3.jpg" alt="" class="w-100">
                        </a>

                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/4.jpg" alt="" class="w-100">
                        </a>

                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/5.jpg" alt="" class="w-100">
                        </a>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="row d-flex justify-content-center">
                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/6.jpg" alt="" class="w-100">
                        </a>

                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/2.jpg" alt="" class="w-100">
                        </a>

                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/4.jpg" alt="" class="w-100">
                        </a>

                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/10.jpg" alt="" class="w-100">
                        </a>

                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/1.jpg" alt="" class="w-100">
                        </a>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="row d-flex justify-content-center">
                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/2.jpg" alt="" class="w-100">
                        </a>

                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/5.jpg" alt="" class="w-100">
                        </a>

                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/8.jpg" alt="" class="w-100">
                        </a>

                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/10.jpg" alt="" class="w-100">
                        </a>

                        <a href="#" class="col-xs-6 col-md-6 col-lg-2 p-0 d-flex justify-content-center">
                            <img src="img/3.jpg" alt="" class="w-100">
                        </a>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev d-flex justify-content-start hover mt-5" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next d-flex justify-content-end hover mt-5" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        </ul>
    </div>
</div>
