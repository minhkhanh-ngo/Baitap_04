<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Cập Nhật Sản Phẩm - Admin</title>
</head>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h3 fw-bold text-dark">Cập nhật sản phẩm</h1>
    <a href="${pageContext.request.contextPath}/admin/product/list" class="btn btn-secondary btn-sm shadow-sm">
        <i class="fa-solid fa-arrow-left me-1"></i> Quay lại danh sách
    </a>
</div>

<div class="row justify-content-center">
    <div class="col-md-9 col-lg-8">
        <div class="card shadow-sm border-0 rounded-4 bg-white p-3">
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/product/update" method="post" enctype="multipart/form-data">

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger text-center py-2 small fw-bold shadow-sm mb-3" role="alert">
                            <i class="fa-solid fa-triangle-exclamation me-1"></i> ${error}
                        </div>
                    </c:if>

                    <input type="hidden" name="productId" value="${product.productId}">
                    <input type="hidden" name="oldImages" value="${product.imageUrl}">

                    <div class="mb-3">
                        <label class="form-label fw-bold">Tên sản phẩm:</label>
                        <input type="text" class="form-control bg-light" name="productName" value="${product.productName}" required minlength="3" maxlength="100"
                               oninvalid="if(this.validity.valueMissing){this.setCustomValidity('Vui lòng không để trống tên sản phẩm!');}else if(this.validity.tooShort){this.setCustomValidity('Tên sản phẩm phải từ 3 ký tự trở lên!');}"
                               oninput="this.setCustomValidity('')">
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Giá (VNĐ):</label>
                            <input type="number" step="any" min="0" class="form-control bg-light" name="price" value="${product.price}" required
                                   oninvalid="this.setCustomValidity('Vui lòng nhập giá sản phẩm hợp lệ (>= 0)!')"
                                   oninput="this.setCustomValidity('')">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Số lượng:</label>
                            <input type="number" min="0" class="form-control bg-light" name="quantity" value="${product.quantity}" required
                                   oninvalid="this.setCustomValidity('Vui lòng nhập số lượng hợp lệ!')"
                                   oninput="this.setCustomValidity('')">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Danh mục:</label>
                        <select class="form-select bg-light" name="categoryId" required
                                oninvalid="this.setCustomValidity('Vui lòng chọn danh mục sản phẩm!')"
                                oninput="this.setCustomValidity('')">
                            <c:forEach items="${listCategories}" var="c">
                                <option value="${c.categoryid}" ${product.category.categoryid == c.categoryid ? 'selected' : ''}>
                                        ${c.cateName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Hình ảnh hiện tại:</label><br>
                        <img src="${product.imageUrl}" width="100" height="100" class="mb-2 shadow-sm rounded border object-fit-cover">
                        <input type="file" class="form-control bg-light" name="imageUrl">
                        <small class="text-muted">Bỏ trống nếu không muốn thay đổi hình ảnh.</small>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold">Mô tả:</label>
                        <textarea class="form-control bg-light" name="description" rows="4">${product.description}</textarea>
                    </div>

                    <div class="d-flex justify-content-end gap-2">
                        <a href="${pageContext.request.contextPath}/admin/product/list" class="btn btn-light border px-4 fw-semibold">Hủy</a>
                        <button type="submit" class="btn btn-dark px-4 fw-semibold">Lưu thay đổi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>