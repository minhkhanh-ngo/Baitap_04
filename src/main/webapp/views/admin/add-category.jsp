<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Thêm mới Danh mục - Admin</title>
</head>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h3 fw-bold text-dark">Thêm mới Danh mục</h1>
    <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary btn-sm shadow-sm">
        <i class="fa-solid fa-arrow-left me-1"></i> Quay lại danh sách
    </a>
</div>

<div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
        <div class="card shadow-sm border-0 rounded-4 bg-white p-3">
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/category/add" method="post" enctype="multipart/form-data">

                    <div class="mb-3">
                        <label for="cateName" class="form-label fw-bold">Tên danh mục:</label>
                        <input type="text" class="form-control bg-light" id="cateName" name="cateName" required placeholder="Nhập tên danh mục...">
                    </div>

                    <div class="mb-4">
                        <label for="images" class="form-label fw-bold">Hình ảnh / Icon:</label>
                        <input type="file" class="form-control bg-light" id="images" name="images">
                    </div>

                    <div class="d-flex justify-content-end gap-2">
                        <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-light border px-4 fw-semibold">Hủy</a>
                        <button type="submit" class="btn btn-dark px-4 fw-semibold">Lưu danh mục</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>