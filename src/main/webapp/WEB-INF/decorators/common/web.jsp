<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title><sitemesh:write property='title'/></title>

    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />

    <sitemesh:write property='head'/>
</head>
<body class="d-flex flex-column min-vh-100 bg-light">
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/home">UTE SHOP</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product">Tất cả sản phẩm</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product?sort=priceDesc">Sản phẩm phổ biến</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product?sort=newest">Sản phẩm mới nhất</a></li>
                    </ul>
                </li>
            </ul>

            <div class="d-flex align-items-center gap-3">
                <c:choose>
                    <c:when test="${not empty sessionScope.account}">
                        <div class="dropdown">
                            <a href="#" class="d-flex align-items-center text-dark text-decoration-none dropdown-toggle gap-2" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.account.avatar}">
                                        <c:choose>
                                            <c:when test="${sessionScope.account.avatar.startsWith('http')}">
                                                <img src="${sessionScope.account.avatar}" class="rounded-circle border" style="width: 32px; height: 32px; object-fit: cover;" alt="Avatar">
                                            </c:when>
                                            <c:otherwise>
                                                <c:url value="/image" var="navImgUrl">
                                                    <c:param name="fname" value="${sessionScope.account.avatar}" />
                                                </c:url>
                                                <img src="${navImgUrl}" class="rounded-circle border" style="width: 32px; height: 32px; object-fit: cover;" alt="Avatar">
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://ui-avatars.com/api/?name=${sessionScope.account.fullName}&background=495057&color=ffffff" class="rounded-circle" style="width: 32px; height: 32px;" alt="Avatar">
                                    </c:otherwise>
                                </c:choose>
                                <span class="fw-semibold small">${sessionScope.account.fullName}</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end shadow-sm border-0" aria-labelledby="userDropdown">
                                <li><a class="dropdown-item py-2 small" href="${pageContext.request.contextPath}/profile"><i class="bi bi-person-gear me-2"></i>Hồ sơ cá nhân</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item py-2 small text-danger" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right me-2"></i>Đăng xuất</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-primary btn-sm">Đăng nhập</a>
                        <a href="${pageContext.request.contextPath}/register" class="btn btn-primary btn-sm">Đăng ký</a>
                    </c:otherwise>
                </c:choose>

                <form class="d-flex mb-0">
                    <button class="btn btn-outline-dark btn-sm" type="submit">
                        <i class="bi-cart-fill me-1"></i> Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </button>
                </form>
            </div>
        </div>
    </div>
</nav>

<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">UTE SHOP</h1>
            <p class="lead fw-normal text-white-50 mb-0">Thế giới công nghệ & mua sắm</p>
        </div>
    </div>
</header>

<main class="flex-shrink-0 py-4">
    <sitemesh:write property='body'/>
</main>

<footer class="py-5 bg-dark mt-auto">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; UTE Shop 2026</p></div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>

<sitemesh:write property='script'/>
</body>
</html>