<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Chỉnh sửa Danh mục - Admin</title>
</head>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h3 fw-bold text-dark">Chỉnh sửa Danh mục</h1>
    <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary btn-sm shadow-sm">
        <i class="fa-solid fa-arrow-left me-1"></i> Quay lại danh sách
    </a>
</div>

<div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
        <div class="card shadow-sm border-0 rounded-4 bg-white p-3">
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/category/edit" method="post" enctype="multipart/form-data">

                    <input type="hidden" name="categoryid" value="${category.categoryid}">
                    <input type="hidden" name="oldImages" value="${category.images}">

                    <div class="mb-3">
                        <label for="cateName" class="form-label fw-bold">Tên danh mục:</label>
                        <input type="text" class="form-control bg-light" id="cateName" name="cateName" value="${category.cateName}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Ảnh hiện tại:</label><br>
                        <c:if test="${not empty category.images}">
                            <img src="${pageContext.request.contextPath}/image?fname=${category.images}" width="80" height="80" class="mb-2 shadow-sm rounded border" style="object-fit: cover;">
                        </c:if>
                        <c:if test="${empty category.images}">
                            <p class="text-muted small fst-italic">Chưa có ảnh</p>
                        </c:if>
                    </div>

                    <div class="mb-4">
                        <label for="images" class="form-label fw-bold">Đổi hình ảnh mới (nếu muốn):</label>
                        <input type="file" class="form-control bg-light" id="images" name="images">
                    </div>

                    <div class="d-flex justify-content-end gap-2">
                        <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-light border px-4 fw-semibold">Hủy</a>
                        <button type="submit" class="btn btn-dark px-4 fw-semibold">Cập nhật</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>