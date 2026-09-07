<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang quản trị Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            min-height: 100vh;
            background: #343a40;
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
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 col-lg-2 d-md-block sidebar collapse p-0">
            <div class="position-sticky pt-3">
                <h5 class="text-center text-white pb-3 border-bottom border-secondary">ADMIN PANEL</h5>
                <ul class="nav flex-column mt-2">
                    <li class="nav-item">
                        <a class="active" href="${pageContext.request.contextPath}/admin/home">
                            <i class="fa-solid fa-house me-2"></i> Trang chủ
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/profile">
                            <i class="fa-solid fa-user-gear me-2"></i> Hồ sơ cá nhân
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/category/list">
                            <i class="fa-solid fa-list me-2"></i> Quản lý Danh mục
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/product/list">
                            <i class="fa-solid fa-box-open me-2"></i> Quản lý Sản phẩm
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/logout">
                            <i class="fa-solid fa-right-from-bracket me-2"></i> Đăng xuất
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-dark">Bảng điều khiển (Dashboard)</h1>
                <span class="text-muted">Xin chào, <strong>${not empty sessionScope.account.fullName ? sessionScope.account.fullName : sessionScope.account.userName}</strong></span>
            </div>

            <div class="row g-4">
                <div class="col-md-6 col-xl-3">
                    <div class="card card-box bg-primary text-white shadow-sm p-3 h-100">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <div>
                                    <h5 class="card-title fw-bold">Quản lý Danh mục</h5>
                                    <p class="card-text small opacity-75">Xem, Sửa, Xóa danh mục.</p>
                                </div>
                                <i class="fa-solid fa-folder-open fa-3x opacity-50"></i>
                            </div>
                            <div class="mt-auto">
                                <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-light btn-sm fw-semibold w-100 text-primary">
                                    Truy cập <i class="fa-solid fa-arrow-right ms-1"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-xl-3">
                    <div class="card card-box bg-info text-white shadow-sm p-3 h-100">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <div>
                                    <h5 class="card-title fw-bold">Thêm Danh mục</h5>
                                    <p class="card-text small opacity-75">Tạo danh mục sản phẩm mới.</p>
                                </div>
                                <i class="fa-solid fa-square-plus fa-3x opacity-50"></i>
                            </div>
                            <div class="mt-auto">
                                <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-light btn-sm fw-semibold w-100 text-info">
                                    Thêm ngay <i class="fa-solid fa-arrow-right ms-1"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-xl-3">
                    <div class="card card-box bg-success text-white shadow-sm p-3 h-100">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <div>
                                    <h5 class="card-title fw-bold">Quản lý Sản phẩm</h5>
                                    <p class="card-text small opacity-75">Xem, Sửa, Xóa sản phẩm.</p>
                                </div>
                                <i class="fa-solid fa-box-open fa-3x opacity-50"></i>
                            </div>
                            <div class="mt-auto">
                                <a href="${pageContext.request.contextPath}/admin/product/list" class="btn btn-light btn-sm fw-semibold w-100 text-success">
                                    Truy cập <i class="fa-solid fa-arrow-right ms-1"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-xl-3">
                    <div class="card card-box bg-warning text-white shadow-sm p-3 h-100">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <div>
                                    <h5 class="card-title fw-bold">Thêm Sản phẩm</h5>
                                    <p class="card-text small opacity-75">Đăng tải sản phẩm lên hệ thống.</p>
                                </div>
                                <i class="fa-solid fa-cart-plus fa-3x opacity-50"></i>
                            </div>
                            <div class="mt-auto">
                                <a href="${pageContext.request.contextPath}/admin/product-add" class="btn btn-light btn-sm fw-semibold w-100 text-warning">
                                    Thêm ngay <i class="fa-solid fa-arrow-right ms-1"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>