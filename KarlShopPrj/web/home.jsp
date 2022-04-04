
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="vi">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>My Shop</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link rel = "icon" href = "assets\img\logo\minilogo.png"  type = "image/x-icon">

        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel = "icon" href = "assets\img\logo\logotitle.png"  type = "image/x-icon">
    </head>

    <body>

        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>

        <jsp:include page="layout/menu.jsp"/>

        <!--slider area start-->
        <div class="slider_area slider_style home_three_slider owl-carousel">
            <div class="single_slider" data-bgimg="assets/img/slider/slider4.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="slider_content content_one">
                                <img src="assets/img/slider/content3.png" alt="">
                                <p>the wooboom clothing summer collection is back at half price</p>
                                <a href="product">Discover Now</a>
                            </div>    
                        </div>
                    </div>
                </div>    
            </div>
            <div class="single_slider" data-bgimg="assets/img/slider/slider5.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="slider_content content_two">
                                <img src="assets/img/slider/content4.png" alt="">
                                <p>the wooboom clothing summer collection is back at half price</p>
                                <a href="product">Discover Now</a>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider" data-bgimg="assets/img/slider/slider6.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="slider_content content_three">
                                <img src="assets/img/slider/content5.png" alt="">
                                <p>the wooboom clothing summer collection is back at half price</p>
                                <a href="product">Discover Now</a>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--slider area end-->

        <!--banner area start-->
        <div class="banner_section banner_section_three">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-4 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="product?action=listByCategory&category_id=6"><img src="assets/img/bg/bg-1.png" alt="#"></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="product"><img src="assets/img/bg/banner9.jpg" alt="#"></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="banner_area bottom">
                            <div class="banner_thumb">
                                <a href="product?action=listByCategory&category_id=15"><img src="assets/img/bg/bg-4.png" alt="#"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--banner area end-->

        <!--product section area start-->
        <section class="product_section womens_product bottom">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Our Product</h2>
                            <p>Recommend for you</p>
                        </div>
                    </div> 
                </div>    
                <div class="product_area"> 
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
                            <c:forEach items="${top10}" var="top10">
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a class="primary_img" href="product?action=productdetail&product_id=${top10.product_id}"><img style="min-height:330px " src="${top10.img}" width="10px;" alt=""></a>
                                            <div class="quick_button">
                                                <a href="product?action=productdetail&product_id=${top10.product_id}" title="quick_view">View product</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <h3><a href="product?action=productdetail&product_id=${top10.product_id}">${top10.product_name}</a></h3>
                                            <span class="current_price"><p><fmt:formatNumber type="number" value="${top10.product_price}"/> VND</p></span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--banner area start-->
        <section class="banner_section banner_section_three">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-6 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="product?action=listByCategory&category_id=6"><img src="assets/img/bg/banner11.jpg" alt="#"></a>
                                <div class="banner_content">
                                    <h1>Handbag <br> Men’s Collection</h1>
                                    <a href="product">Discover Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="product?action=listByCategory&category_id=15"><img src="assets/img/bg/banner12.jpg" alt="#"></a>
                                <div class="banner_content">
                                    <h1>Sneaker <br> New Collection</h1>
                                    <a href="product">Discover Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--banner area end-->

        <!--product section area start-->
        <section class="product_section womens_product bottom">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Trending products</h2>
                            <p>Impressive and best-selling products</p>
                        </div>
                    </div> 
                </div>    
                <div class="product_area"> 
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
                            <c:forEach items="${topTrend}" var="td">
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a class="primary_img"  href="product?action=productdetail&product_id=${td.product_id}"><img style="min-height:330px " src="${td.img}" width="10px;" alt=""></a>
                                            <div class="quick_button">
                                                <a href="product?action=productdetail&product_id=${td.product_id}" title="quick_view">View product</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <h3><a href="product?action=productdetail&product_id=${td.product_id}">${td.product_name}</a></h3>
                                            <span class="current_price"> <p><fmt:formatNumber type="number" value="${td.product_price}"/> VND</p></span>
                                                                                       

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="section_title">
                        <p style="font-size: 23px">"You can never take too much care over the choice of your shoes. Too many women think that they are unimportant, but the real proof of an elegant woman is what is on her feet." —<b>Christian Dior</b></p>
                    </div>
                </div> 
            </div>
        </section>
        <!--product section area end-->
        <!--footer area start-->
        <jsp:include page="layout/footer.jsp"/>
        <!--footer area end-->
        <!-- JS
        ============================================ -->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
    </body>

</html>
