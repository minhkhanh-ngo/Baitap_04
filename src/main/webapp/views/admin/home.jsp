<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Trang quản trị Admin</title>
</head>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2 fw-bold text-dark">Bảng điều khiển (Dashboard)</h1>
    <span class="text-muted">Xin chào, <strong>${not empty sessionScope.account.fullName ? sessionScope.account.fullName : sessionScope.account.userName}</strong></span>
</div>

<div class="row g-4">
    <div class="col-md-6 col-xl-3">
        <div class="card card-box bg-primary text-white shadow-sm p-3 h-100 border-0 rounded-4">
            <div class="card-body d-flex flex-column">
                <div class="d-flex justify-content-between align-items-start mb-3">
                    <div>
                        <h5 class="card-title fw-bold">Quản lý Danh mục</h5>
                        <p class="card-text small opacity-75">Xem, Sửa, Xóa danh mục.</p>
                    </div>
                    <i class="fa-solid fa-folder-open fa-3x opacity-50"></i>
                </div>
                <div class="mt-auto">
                    <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-light btn-sm fw-semibold w-100 text-primary rounded-pill">
                        Truy cập <i class="fa-solid fa-arrow-right ms-1"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6 col-xl-3">
        <div class="card card-box bg-info text-white shadow-sm p-3 h-100 border-0 rounded-4">
            <div class="card-body d-flex flex-column">
                <div class="d-flex justify-content-between align-items-start mb-3">
                    <div>
                        <h5 class="card-title fw-bold">Thêm Danh mục</h5>
                        <p class="card-text small opacity-75">Tạo danh mục sản phẩm mới.</p>
                    </div>
                    <i class="fa-solid fa-square-plus fa-3x opacity-50"></i>
                </div>
                <div class="mt-auto">
                    <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-light btn-sm fw-semibold w-100 text-info rounded-pill">
                        Thêm ngay <i class="fa-solid fa-arrow-right ms-1"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6 col-xl-3">
        <div class="card card-box bg-success text-white shadow-sm p-3 h-100 border-0 rounded-4">
            <div class="card-body d-flex flex-column">
                <div class="d-flex justify-content-between align-items-start mb-3">
                    <div>
                        <h5 class="card-title fw-bold">Quản lý Sản phẩm</h5>
                        <p class="card-text small opacity-75">Xem, Sửa, Xóa sản phẩm.</p>
                    </div>
                    <i class="fa-solid fa-box-open fa-3x opacity-50"></i>
                </div>
                <div class="mt-auto">
                    <a href="${pageContext.request.contextPath}/admin/product/list" class="btn btn-light btn-sm fw-semibold w-100 text-success rounded-pill">
                        Truy cập <i class="fa-solid fa-arrow-right ms-1"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6 col-xl-3">
        <div class="card card-box bg-warning text-white shadow-sm p-3 h-100 border-0 rounded-4">
            <div class="card-body d-flex flex-column">
                <div class="d-flex justify-content-between align-items-start mb-3">
                    <div>
                        <h5 class="card-title fw-bold">Thêm Sản phẩm</h5>
                        <p class="card-text small opacity-75">Đăng tải sản phẩm lên hệ thống.</p>
                    </div>
                    <i class="fa-solid fa-cart-plus fa-3x opacity-50"></i>
                </div>
                <div class="mt-auto">
                    <a href="${pageContext.request.contextPath}/admin/product-add" class="btn btn-light btn-sm fw-semibold w-100 text-warning rounded-pill">
                        Thêm ngay <i class="fa-solid fa-arrow-right ms-1"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>