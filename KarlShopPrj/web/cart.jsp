

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Cart</title>
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
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="index.html">Home</a></li>
                                <li>/</li>
                                <li>Cart</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <!-- shopping cart area start -->
        <div class="shopping_cart_area">
            <div class="container-fluid">  
                <form> 
                    <div class="row">
                        <div class="col-12">
                            <div class="table_desc">
                                <div class="cart_page table-responsive">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="product_remove">Delete</th>
                                                <th class="product_thumb">Image</th>
                                                <th class="product_name">Product</th>
                                                <th class="product-price">Price</th>
                                                <th class="product_quantity">Size</th>
                                                <th class="product-price">Color</th>
                                                <th class="product_quantity">Quantity</th>
                                                <th class="product_total">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="o" value="${sessionScope.cart}"/>
                                            <c:forEach items="${o.items}" var="i">
                                                <tr>
                                                    <td class="product_remove"><a href="cart?action=deletecart&product_id=${i.product.product_id}"><i class="fa fa-trash-o"></i></a></td>
                                                    <td class="product_thumb"><a href="product?action=productdetail&product_id=${i.product.product_id}"><img src="${i.product.img}" alt="" style="width: 100px; height: auto;"></a></td>
                                                    <td class="product_name"><a href="product?action=productdetail&product_id=${i.product.product_id}">${i.product.product_name}</a></td>
                                                    <td class="product-price"><fmt:formatNumber pattern="##########" value="${i.product.product_price}"/></td>
                                                    <td class="product-price">${i.size}</td>
                                                    <td class="product-price">${i.color}</td>
                                                    <td class="product_quantity"><input name="quantity" min="1" max="100" value="${i.quantity}" type="number"></td>
                                                    <td class="product_total"> <fmt:formatNumber pattern="##########" value="${i.product.product_price * i.quantity }"/></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        </form>

                                    </table>   
                                    <c:if test="${sessionScope.cart==null}">
                                        <h2 style="text-align: center; color: #1e85be;"> <i class="fa fa-info-circle"></i> Cart is empty</h2>
                                    </c:if>
                                </div>
                            </div>
                            <!--coupon code area end-->

                            <!--coupon code area start-->
                            <c:if test="${sessionScope.cart!=null}">
                                <div class="container">
                                    <div class="coupon_area">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12">
                                                <div class="coupon_code right">
                                                    <h3>Bill</h3>
                                                    <div class="coupon_inner">
                                                        <div class="cart_subtotal">
                                                            <p>Total bill</p>
                                                            <p class="cart_amount"><fmt:formatNumber  type="number" value="${sessionScope.total}"/> VND</p>
                                                        </div>
                                                        <div class="cart_subtotal ">
                                                            <p>Shipping fee (Trợ giá 63 tỉnh thành)</p>
                                                            <p class="cart_amount">30000 VND</p>
                                                        </div>

                                                        <div class="cart_subtotal">
                                                            <p>Total</p>
                                                            <p class="cart_amount"><fmt:formatNumber type="number" value="${sessionScope.totalfinal}"/> VND</p>
                                                        </div>
                                                        <div >
                                                            <form method="post" action="cart?action=checkcode">
                                                                <div class="col-lg-12 mb-20" style="display: flex;justify-content: flex-end; flex-direction: row; margin-top: 5px;">
                                                                    <span ><input placeholder="Discount code" name="code"></span>
                                                                    <span class="order_button" >
                                                                        <button type="submit">Check code</button>
                                                                    </span>
                                                                </div>
                                                                <span style="margin-left: 70%;">${mess}</span>

                                                            </form>
                                                        </div>
                                                        <div class="checkout_btn">
                                                            <a href="checkout">Thanh toán</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>     
                    </div>
                    <!-- shopping cart area end -->

                    <!--footer area start-->
                    <jsp:include page="layout/footer.jsp"/>
                    <!--footer area end-->

                    <!-- JS
                    ============================================ -->


                    <!--map js code here-->
                    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdWLY_Y6FL7QGW5vcO3zajUEsrKfQPNzI"></script>
                    <script  src="https://www.google.com/jsapi"></script>
                    <script src="assets/js/map.js"></script>


                    <!-- Plugins JS -->
                    <script src="assets/js/plugins.js"></script>

                    <!-- Main JS -->
                    <script src="assets/js/main.js"></script>



                    </body>

                    </html>