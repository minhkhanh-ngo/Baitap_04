<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ - UTE SHOP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg px-4 shadow-sm mb-4" style="background-color: #bce3ff;">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-primary" href="${pageContext.request.contextPath}/home">UTE SHOP</a>
        <div class="ms-auto d-flex align-items-center">

            <a href="${pageContext.request.contextPath}/profile" class="btn btn-outline-primary btn-sm me-2 fw-semibold">
                <i class="fa-solid fa-user me-1"></i> Hồ sơ cá nhân
            </a>

            <span class="me-3">Xin chào: <strong>${sessionScope.account.fullName}</strong></span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm">Đăng xuất</a>
        </div>
    </div>
</nav>

<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-4 mt-2">
        <h3 class="fw-bold">10 Sản phẩm mới nhất</h3>
        <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-primary btn-sm">Xem tất cả sản phẩm</a>
    </div>

    <div class="row">
        <c:forEach items="${listNewProducts}" var="p">
            <div class="col-md-3 mb-4">
                <div class="card h-100 shadow-sm border-0">
                    <img src="${p.imageUrl}" class="card-img-top" alt="..." style="height: 180px; object-fit: cover;">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title fs-6 fw-bold mb-2">${p.productName}</h5>
                        <p class="card-text text-danger fw-bold mb-1">
                            <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/> đ
                        </p>
                        <p class="card-text text-muted small mb-3">${p.category.cateName}</p>
                        <a href="${pageContext.request.contextPath}/product-detail?id=${p.productId}" class="btn btn-primary btn-sm mt-auto w-100">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>