<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>New arrival</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link rel = "icon" href = "assets\img\logo\minilogo.png"  type = "image/x-icon">

        <!-- CSS 
        ========================= -->


        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

    </head>

    <body>

        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>
        <jsp:include page="layout/menu.jsp"/>

        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li>/</li>
                                <li>Collection </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <!--shop  area start-->
        <div class="shop_area shop_reverse">
            <div class="container">
                <div class="shop_inner_area">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <!--shop wrapper start-->
                            <!--shop toolbar start-->
                            <div style="margin-left: 45%">
                                <h2 style="color: red; font-weight:600 ">Collection</h2>
                            </div>
                            <div class="shop_toolbar_wrapper" style="border:none">
                                <div class="dropdown ">
                                    <button style="color: #000; background-color: #ffffff;border:none; font-family: sans-serif;" class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Sort by
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="Collection?action=sort&type=low">Price(low to high)</a>
                                        <a class="dropdown-item" href="Collection?action=sort&type=high">Price(high to low)</a>
                                        <a class="dropdown-item" href="Collection?action=sort&type=a-z">A-Z</a>
                                    </div>
                                </div>
                            </div>
                            <div class="row shop_wrapper">
                                <c:forEach items="${ProductData}" var="p">
                                    <div class="col-lg-4 col-md-4 col-12 ">
                                        <div class="single_product">
                                            <div class="product_thumb">
                                                <a class="primary_img" href="product?action=productdetail&product_id=${p.product_id}"><img src="${p.img}" alt=""></a>

                                                <div class="quick_button">
                                                    <a href="product?action=productdetail&product_id=${p.product_id}"title="quick_view">View detial</a>
                                                </div>
                                            </div>
                                            <div class="product_content grid_content">
                                                <h3><a href="product?action=productdetail&product_id=${p.product_id}">${p.product_name}</a></h3>
                                                <span class="current_price">
                                                    <p><fmt:formatNumber type="number" value="${p.product_price}"/> VND</p>

                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <!--shop  area end-->

                    <!--footer area start-->
                    <jsp:include page="layout/footer.jsp"/>
                    <!--footer area end-->

                    <!-- Plugins JS -->
                    <script src="assets/js/plugins.js"></script>

                    <!-- Main JS -->
                    <script src="assets/js/main.js"></script>
                    </body>

                    </html>