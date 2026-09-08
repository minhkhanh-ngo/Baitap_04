<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><sitemesh:write property='title'/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            min-height: 100vh;
            background: #343a40 !important;
            color: #fff;
        }
        .sidebar a {
            color: #adb5bd;
            text-decoration: none;
            padding: 10px 20px;
            display: block;
            transition: 0.2s;
        }
        .sidebar a:hover, .sidebar a.active {
            color: #fff;
            background: #495057;
            border-left: 4px solid #0d6efd;
        }
        .card-box {
            transition: transform 0.2s, box-shadow 0.2s;
            border: none;
            border-radius: 0.75rem;
        }
        .card-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }
    </style>
    <sitemesh:write property='head'/>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 col-lg-2 d-md-block sidebar collapse p-0 shadow-sm">
            <div class="position-sticky pt-3">
                <div class="text-center pb-3 mb-2 border-bottom border-secondary">
                    <h4 class="text-white fw-bold tracking-wide m-0" style="letter-spacing: 1px;">UTE SHOP</h4>
                    <span class="small" style="color: #adb5bd;">Admin Control Panel</span>
                </div>

                <div class="text-center px-3 pb-3 mb-3 border-bottom border-secondary">
                    <div class="position-relative d-inline-block mb-2" style="width: 65px; height: 65px;">
                        <c:choose>
                            <c:when test="${not empty sessionScope.account.avatar}">
                                <c:choose>
                                    <c:when test="${sessionScope.account.avatar.startsWith('http')}">
                                        <img src="${sessionScope.account.avatar}"
                                             class="rounded-circle border border-2 border-light shadow-sm w-100 h-100 object-fit-cover" alt="Avatar">
                                    </c:when>
                                    <c:otherwise>
                                        <c:url value="/image" var="sidebarImgUrl">
                                            <c:param name="fname" value="${sessionScope.account.avatar}" />
                                        </c:url>
                                        <img src="${sidebarImgUrl}"
                                             onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';"
                                             class="rounded-circle border border-2 border-light shadow-sm w-100 h-100 object-fit-cover" alt="Avatar">
                                        <div class="rounded-circle border border-2 border-light shadow-sm bg-secondary text-white align-items-center justify-content-center w-100 h-100"
                                             style="display: none; position: absolute; top: 0; left: 0;">
                                            <i class="fa-solid fa-user"></i>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <div class="rounded-circle border border-2 border-light shadow-sm bg-secondary text-white d-inline-flex align-items-center justify-content-center w-100 h-100">
                                    <i class="fa-solid fa-user"></i>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <span class="position-absolute bottom-0 end-0 p-1 bg-success border border-light rounded-circle" style="width: 12px; height: 12px; z-index: 2;"></span>
                    </div>
                    <h6 class="text-white fw-bold mb-0 text-truncate px-2">
                        ${not empty sessionScope.account.fullName ? sessionScope.account.fullName : sessionScope.account.userName}
                    </h6>
                    <span class="badge bg-danger text-white mt-1" style="font-size: 10px;">Quản trị viên</span>
                </div>

                <ul class="nav flex-column mt-2 px-2">
                    <li class="nav-item mb-1">
                        <a class="nav-link text-white-50 rounded-2 px-3 py-2" href="${pageContext.request.contextPath}/admin/home">
                            <i class="fa-solid fa-house me-2"></i> Trang chủ
                        </a>
                    </li>
                    <li class="nav-item mb-1">
                        <a class="nav-link text-white-50 rounded-2 px-3 py-2" href="${pageContext.request.contextPath}/admin/profile">
                            <i class="fa-solid fa-user-gear me-2"></i> Hồ sơ cá nhân
                        </a>
                    </li>
                    <li class="nav-item mb-1">
                        <a class="nav-link text-white-50 rounded-2 px-3 py-2" href="${pageContext.request.contextPath}/admin/category/list">
                            <i class="fa-solid fa-list me-2"></i> Quản lý Danh mục
                        </a>
                    </li>
                    <li class="nav-item mb-1">
                        <a class="nav-link text-white-50 rounded-2 px-3 py-2" href="${pageContext.request.contextPath}/admin/product/list">
                            <i class="fa-solid fa-box-open me-2"></i> Quản lý Sản phẩm
                        </a>
                    </li>
                    <li class="nav-item mt-4 pt-2 border-top border-secondary">
                        <a class="nav-link text-danger rounded-2 px-3 py-2" href="${pageContext.request.contextPath}/logout">
                            <i class="fa-solid fa-right-from-bracket me-2"></i> Đăng xuất
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            <sitemesh:write property='body'/>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>