<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Thêm sản phẩm mới - Admin</title>
</head>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h3 fw-bold text-dark">Thêm Sản Phẩm Mới</h1>
    <a href="${pageContext.request.contextPath}/admin/product/list" class="btn btn-secondary btn-sm shadow-sm">
        <i class="fa-solid fa-arrow-left me-1"></i> Quay lại danh sách
    </a>
</div>

<div class="row justify-content-center">
    <div class="col-md-9 col-lg-8">
        <div class="card shadow-sm border-0 rounded-4 bg-white p-3">
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/product-add" method="post" enctype="multipart/form-data">

                    <div class="mb-3">
                        <label class="form-label fw-bold">Tên sản phẩm:</label>
                        <input type="text" name="productName" class="form-control bg-light" placeholder="Nhập tên sản phẩm..." required>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Giá (VNĐ):</label>
                            <input type="number" step="any" name="price" class="form-control bg-light" placeholder="Ví dụ: 150000" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Số lượng tồn kho:</label>
                            <input type="number" name="quantity" class="form-control bg-light" placeholder="Ví dụ: 50" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Danh mục sản phẩm:</label>
                        <select name="categoryId" class="form-select bg-light" required>
                            <option value="" disabled selected>-- Chọn danh mục sản phẩm --</option>
                            <c:forEach items="${listCategories}" var="c">
                                <option value="${c.categoryid}">${c.cateName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold">Hình ảnh sản phẩm:</label>
                        <input type="file" name="imageFile" class="form-control bg-light" accept="image/*" required>
                    </div>

                    <div class="d-flex justify-content-end gap-2">
                        <a href="${pageContext.request.contextPath}/admin/product/list" class="btn btn-light border px-4 fw-semibold">Hủy</a>
                        <button type="submit" class="btn btn-dark px-4 fw-semibold">Lưu sản phẩm</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>