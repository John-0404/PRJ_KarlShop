

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Product details</title>
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
        <div class="breadcrumbs_area product_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li>/</li>
                                <li><a href="product">Product</a></li>
                                <li>/</li>
                                <li>Product detail</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <c:if test="${check=='true'}">
            <div id="toast" style="padding: 5px;border-left: 4px solid #47d864;">
                <div class="toa" style="border-color: #47d864;">
                    <div class="toast__body">
                        <h4 class="toast__title" style="padding-top: 5px;">
                            <i class="fa fa-check-circle" style="color: #47d864;padding: 3px;"></i> Add to cart successfully</h4>
                    </div>
                </div></div>
            </c:if>
            <c:if test="${check=='false'}">
            <div id="toast" style="padding: 5px;border-left: 4px solid #ff2626; ">
                <div class="toa" style="border-color: #47d864;">
                    <div class="toast__body">
                        <h4 class="toast__title" style="padding-top: 5px;">
                            <i class="fa fa-exclamation-circle" style="color: #ff2626;padding: 3px;"></i> Add to cart failed</h4>
                    </div>
                </div></div>
            </c:if>
        <!--product details start-->
        <div class="product_details">
            <div class="container">

                <div class="row">
                    <div class="col-lg-5 col-md-5">
                        <div class="product-details-tab">

                            <div id="img-1" class="zoomWrapper single-zoom">
                                <a href="#">
                                    <img id="zoom1" src="${ProductData.img}" data-zoom-image="${ProductData.img}" alt="product">
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-7 col-md-7">
                        <div class="product_d_right">
                            <form action="cart?product_id=${ProductData.product_id}" method="POST" >
                                <h1>${ProductData.product_name}</h1>
                                <div class="product_price">
                                    <span class="current_price">${ProductData.product_price} VNĐ</span>
                                </div>
                                <div class="product_desc">
                                    <p>${ProductData.product_describe}</p>
                                </div>

                                <div class="product_variant color">
                                    <h3>color</h3>
                                    <select class="niceselect_option" id="color" name="color">
                                        <c:forEach items="${ColorData}" var="c">
                                            <option value="${c.color}">${c.color}</option>
                                        </c:forEach>
                                    </select>   
                                </div>
                                <div class="product_variant size">
                                    <h3>size</h3>
                                    <select class="niceselect_option" id="color1" name="size">       
                                        <c:forEach items="${SizeData}" var="s">
                                            <option value="${s.size}">${s.size}</option>
                                        </c:forEach>                             
                                    </select> 
                                </div>
                                <div class="product_variant quantity">
                                    <label>quantity</label>
                                    <input min="1" max="${ProductData.quantity}" name="quantity" type="number">
                                    <button  class="button" type="submit">Add to cart</button>  
                                </div>
                                    <div style="margin-top: 35px;" >
                                    <h4>DELIVERY POLICY</h4>
                                    <h5>All orders are processed within 2 business days. Orders are not shipped or delivered on weekends or holidays. If we are experiencing a high volume of orders, shipments may be delayed by a few days. Please allow additional days in transit for delivery. If there will be a significant delay in shipment of your order, we will contact you via email or telephone.</h5>
                                    <h4> RETURNS (refunds and exchanges)</h4>
                                    <h5>If you are unhappy with your item, please let us know. You have 30 days to return or exchange an item with a valid receipt. If 30 days have gone by since your purchase, we cannot offer you a refund or exchange. To be eligible for a refund or exchange, goods must be returned in a re-saleable condition.</h5>
                                    </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
        <!--product details end-->
        <!--product info end-->

        <!--product section area start-->
        <section class="product_section related_product">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Recommend for you</h2>
                        </div>
                    </div> 
                </div>    
                <div class="product_area"> 
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
                            <c:forEach items="${ProductByCategory}" var="pc">
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a class="primary_img" href="product?action=productdetail&product_id=${pc.product_id}"><img src="${pc.img}" alt=""></a>
                                        </div>
                                        <div class="product_content">
                                            <h3><a href="product?action=productdetail&product_id=${pc.product_id}">${pc.product_name}</a></h3>
                                            <span class="current_price">${pc.product_price}</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!--product section area end-->

        <!--footer area start-->
        <jsp:include page="layout/footer.jsp"/>
        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
        <style>
            #toast {
                position: absolute ;
                top: 125px;
                right: 32px;
                z-index: 999999;
                background-color: #fff;
            }

            #toast{
                display: flex;
                align-items: center;
                background-color: #fff;
                border-radius: 2px;
                padding: 20px 0;
                min-width: 200px;
                max-width: 450px;
                border-left: 4px solid;
                box-shadow: 0 5px 8px rgba(0, 0, 0, 0.08);
                transition: all linear 0.3s;
                animation: slideInLeft ease .54s, fadeOut linear 1s 2s forwards;
            }

            @keyframes slideInLeft {
                from {
                    opacity: 0;
                    transform: translateX(calc(100% + 32px));
                }
                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            @keyframes fadeOut {
                to {
                    opacity: 0;
                }
            }
        </style>
    </body>

</html>
