<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang Chủ - UTE SHOP</title>
</head>
<body>
<div class="container px-4 px-lg-5 mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4 mt-2">
        <h3 class="fw-bold">10 Sản phẩm mới nhất</h3>
        <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-dark btn-sm">Xem tất cả sản phẩm</a>
    </div>

    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

        <c:forEach items="${listNewProducts}" var="p">
            <div class="col mb-5">
                <div class="card h-100 shadow-sm border-0">
                    <img class="card-img-top" src="${p.imageUrl}" alt="${p.productName}" style="height: 200px; object-fit: cover;" />

                    <div class="card-body p-4">
                        <div class="text-center">
                            <h5 class="fw-bolder fs-6 mb-2">${p.productName}</h5>
                            <p class="text-muted small mb-2">${p.category.cateName}</p>

                            <span class="text-danger fw-bold fs-5">
                                <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/> đ
                            </span>
                        </div>
                    </div>

                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                            <a class="btn btn-outline-dark mt-auto w-100" href="${pageContext.request.contextPath}/product-detail?id=${p.productId}">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</div>
</body>
</html>