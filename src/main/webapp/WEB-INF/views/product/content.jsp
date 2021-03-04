<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>

<html lang="en-US">

<head>

	<meta charset="UTF-8">
	
<title>funDigo</title>
	
    
  

</head>

<body>

    <div class="short-description">

        <div class="container">

            <div class="row">

                <div class="col-md-6">

                    <div class="product-thumbnail">

                        <div class="col-md-2 col-sm-2 col-xs-2">

                            <ul class="thumb-image">

                                <li class="active"><a href="../resources/images/single-product-1.jpg"><img src="../resources/images/single-product-1.jpg" alt=""></a></li>

                                <li><a href="../resources/images/single-product-2.jpg"><img src="../resources/images/single-product-2.jpg" alt=""></a></li>

                                <li><a href="../resources/images/single-product-3.jpg"><img src="../resources/images/single-product-3.jpg" alt=""></a></li>

                                <li><a href=""><img src="../resources/images/single-product-4.jpg" alt=""></a></li>

                                <li><a href=""><img src="../resources/images/single-product-5.jpg" alt=""></a></li>

                            </ul>

                        </div>

                        <div class="col-md-10 col-sm-10 col-xs-10">

                            <div class="thumb-main-image"><a href=""><img src="../resources/images/single-product-1.jpg" alt=""></a></div>

                        </div>

                    </div>

                    <div class="clearfix"></div>

                </div>

                <div class="col-md-6">

                    <h1 class="product-title">${product.title }</h1>

                    <div class="ratings">

                        <i class="fa fa-star"></i>

                        <i class="fa fa-star"></i>

                        <i class="fa fa-star"></i>

                        <i class="fa fa-star"></i>

                        <i class="fa fa-star"></i>

                        <span class="vote-count">35 vote</span>

                    </div>

                    <div class="product-info">

                        <span class="product-id"><span class="strong-text">Product ID:</span> RST 4562</span>

                        

                        <span class="product-avilability"><span class="strong-text">Availability:</span> In Stock</span>

                    </div>

                    <p class="short-info">${product.description }</p>

                    <div class="price">

                        <span>$522.00</span>

                    </div>

                    <form action="" class="purchase-form">

                       <div class="qt-area">

                           <i class="fa fa-minus"></i>

                           <input name="quantity" class="qt" value="1">

                           <i class="fa fa-plus"></i>

                       </div>

                        <button class="btn btn-theme" type="submit">펀딩하기</button>

                        <div class="social-share">

                            <ul>

                                <li><a href=""><i class="fa fa-facebook"></i></a></li>

                                <li><a href=""><i class="fa fa-twitter"></i></a></li>

                                <li><a href=""><i class="fa fa-google-plus"></i></a></li>

                                <li><a href=""><i class="fa fa-linkedin"></i></a></li>

                            </ul>

                        </div>

                    </form>

                    <p><span class="strong-text">카테고리 : </span>
                    <c:if test="#{product.tag eq 'G' }">게임</c:if>
                    <c:if test="#{product.tag eq 'D' }">디자인</c:if>
                    <c:if test="#{product.tag eq 'L' }">생활</c:if>
                    <c:if test="#{product.tag eq 'T' }">테크</c:if>
                    </p>

                    <ul class="product-info-btn">

                        <li><a href=""><i class="fa fa-heart-o"></i> 찜</a></li>

                        <li><a href=""><i class="fa fa-arrows-h"></i> Compare</a></li>

                        <li><a href=""><i class="fa fa-envelope-o"></i> Email</a></li>

                        <li><a href=""><i class="fa fa-print"></i> Print</a></li>

                    </ul>

                    <p><i class="fa fa-check"></i> Let’s start with the most essential part of any written content. At the early </p>

                </div>

            </div>

        </div>

    </div> 

    <div class="container">

        <div class="row">

            <div class="single-product-tabs" id = "menuTab">

                <ul class="nav nav-tabs nav-single-product-tabs">

                    <li class="active"><a href="#description" data-toggle="tab">상품 설명</a></li>

                    <li><a href="#notice" data-toggle="tab" data-url="http://localhost:8181/product/notice?pno=${product.pno }">공지사항</a></li>
                    
                    <li><a href="#community" data-toggle="tab" data-url="http://localhost:8181/product/community?pno=${product.pno }">커뮤니티</a></li>
                    
                    <li><a href="#sponsor" data-toggle="tab" data-url="http://localhost:8181/product/sponsor?pno=${product.pno }">서포터</a></li>

                </ul>

                <div class="tab-content">

                    <div class="tab-pane active" id="description">

                        <div class="product-desc">

                            <h2>${product.title }</h2>

                            <p>${product.description }</p>
                        </div>

                    </div>
                    
                    <div class="tab-pane product-desc" id="notice">
						
                    </div>
                    
                    <div class="tab-pane product-desc" id="community">

                    </div>

                    <div class="tab-pane product-desc" id="sponsor">

                    </div>

                </div> <!-- tab content 닫히는 곳 -->

            </div>

        </div>

    </div>

    <div class="container">

        <div class="row">

            <div class="related-items">

                <ul class="nav nav-tabs nav-single-product-tabs">

                    <li class="active"><a href="#related" data-toggle="tab">Related Products</a></li>

                </ul>

                <div class="tab-content">

                    <div class="tab-pane active" id="related">

                        <div class="col-md-3 col-sm-4">

                            <div class="single-product">

                                <div class="product-block">

                                    <img src="../resources/images/product-1.jpg" alt="" class="thumbnail">

                                    <div class="product-description text-center">

                                        <p class="title">Date Tiffany Torchiere</p>

                                        <p class="price">$ 55.00</p>

                                    </div>

                                    <div class="product-hover">

                                        <ul>

                                            <li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>

                                            <li><a href=""><i class="fa fa-arrows-h"></i></a></li>

                                            <li><a href=""><i class="fa fa-heart-o"></i></a></li>

                                        </ul>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <div class="col-md-3 col-sm-4">

                            <div class="single-product">

                                <div class="product-block">

                                    <img src="../resources/images/product-2.jpg" alt="" class="thumbnail">

                                    <div class="product-description text-center">

                                        <p class="title">Date Tiffany Torchiere</p>

                                        <p class="price">$ 55.00</p>

                                    </div>

                                    <div class="product-hover">

                                        <ul>

                                            <li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>

                                            <li><a href=""><i class="fa fa-arrows-h"></i></a></li>

                                            <li><a href=""><i class="fa fa-heart-o"></i></a></li>

                                        </ul>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <div class="col-md-3 col-sm-4">

                            <div class="single-product">

                                <div class="product-block">

                                    <img src="../resources/images/product-3.jpg" alt="" class="thumbnail">

                                    <div class="product-description text-center">

                                        <p class="title">Date Tiffany Torchiere</p>

                                        <p class="price">$ 55.00</p>

                                    </div>

                                    <div class="product-hover">

                                        <ul>

                                            <li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>

                                            <li><a href=""><i class="fa fa-arrows-h"></i></a></li>

                                            <li><a href=""><i class="fa fa-heart-o"></i></a></li>

                                        </ul>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <div class="col-md-3 col-sm-4">

                            <div class="single-product">

                                <div class="product-block">

                                    <img src="../resources/images/product-4.jpg" alt="" class="thumbnail">

                                    <div class="product-description text-center">

                                        <p class="title">Date Tiffany Torchiere</p>

                                        <p class="price">$ 55.00</p>

                                    </div>

                                    <div class="product-hover">

                                        <ul>

                                            <li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>

                                            <li><a href=""><i class="fa fa-arrows-h"></i></a></li>

                                            <li><a href=""><i class="fa fa-heart-o"></i></a></li>

                                        </ul>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


	

</body>

</html>