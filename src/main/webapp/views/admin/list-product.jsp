<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<head>
    <title>Quản lý Sản Phẩm - Admin</title>
</head>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h3 fw-bold text-dark">Quản lý Sản phẩm</h1>
    <a href="${pageContext.request.contextPath}/admin/product-add" class="btn btn-dark shadow-sm">
        <i class="fa-solid fa-plus me-1"></i> Thêm sản phẩm mới
    </a>
</div>

<div class="card shadow-sm border-0 rounded-3 overflow-hidden">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-dark text-uppercase small">
                <tr>
                    <th class="py-3 ps-4" style="width: 5%;">ID</th>
                    <th class="py-3" style="width: 12%;">Hình ảnh</th>
                    <th class="py-3" style="width: 28%;">Tên sản phẩm</th>
                    <th class="py-3" style="width: 15%;">Danh mục</th>
                    <th class="py-3 text-end" style="width: 15%;">Giá bán</th>
                    <th class="py-3 text-center" style="width: 10%;">Tồn kho</th>
                    <th class="py-3 text-center" style="width: 15%;">Hành động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listProducts}" var="p">
                    <tr>
                        <td class="ps-4 fw-semibold text-secondary">#${p.productId}</td>
                        <td>
                            <img src="${p.imageUrl}" alt="img" style="width: 50px; height: 50px; object-fit: cover; border-radius: 6px; border: 1px solid #dee2e6;" class="shadow-sm">
                        </td>
                        <td class="fw-bold text-dark">${p.productName}</td>
                        <td><span class="badge bg-light text-dark border">${p.category.cateName}</span></td>
                        <td class="text-danger fw-bold text-end">
                            <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/> đ
                        </td>
                        <td class="text-center fw-semibold">${p.quantity}</td>
                        <td class="text-center">
                            <a href="${pageContext.request.contextPath}/admin/product/edit?id=${p.productId}" class="btn btn-sm btn-outline-warning me-1 px-2 fw-semibold">
                                <i class="fa-solid fa-pen-to-square"></i> Sửa
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/product/delete?id=${p.productId}" class="btn btn-sm btn-outline-danger px-2 fw-semibold" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm: ${p.productName}?');">
                                <i class="fa-solid fa-trash"></i> Xóa
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>