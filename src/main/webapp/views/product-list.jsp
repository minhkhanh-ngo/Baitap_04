<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách Sản phẩm - UTE SHOP</title>
</head>
<body>
<div class="container py-5">
    <nav aria-label="breadcrumb" class="mb-3 mt-2">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home" class="text-decoration-none">Trang chủ</a></li>
            <li class="breadcrumb-item active" aria-current="page">Danh sách sản phẩm</li>
        </ol>
    </nav>

    <form action="${pageContext.request.contextPath}/product" method="get" class="row g-2 mb-4 bg-white p-3 shadow-sm rounded align-items-center">
        <div class="col-md-4">
            <input type="text" name="keyword" class="form-control" placeholder="Tìm tên sản phẩm..." value="${keyword}">
        </div>
        <div class="col-md-3">
            <select name="categoryId" class="form-select">
                <option value="">Tất cả danh mục</option>
                <c:forEach items="${listCategories}" var="c">
                    <option value="${c.categoryid}" ${categoryId == c.categoryid ? 'selected' : ''}>
                            ${c.cateName}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-3">
            <select name="sort" class="form-select">
                <option value="newest" ${sort == 'newest' ? 'selected' : ''}>Mới nhất</option>
                <option value="priceAsc" ${sort == 'priceAsc' ? 'selected' : ''}>Giá: Tăng dần</option>
                <option value="priceDesc" ${sort == 'priceDesc' ? 'selected' : ''}>Giá: Giảm dần</option>
            </select>
        </div>
        <div class="col-md-2">
            <button type="submit" class="btn btn-dark w-100">Tìm kiếm</button>
        </div>
    </form>

    <h4 class="fw-bold mb-4">Kết quả tìm kiếm</h4>

    <div class="row">
        <c:choose>
            <c:when test="${empty listProducts}">
                <div class="col-12 text-center text-muted my-5">
                    <h5>Không tìm thấy sản phẩm nào phù hợp!</h5>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${listProducts}" var="p">
                    <div class="col-md-3 mb-4">
                        <div class="card h-100 shadow-sm border-0">
                            <img src="${p.imageUrl}" class="card-img-top" alt="..." style="height: 180px; object-fit: cover;">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title fs-6 fw-bold mb-2">${p.productName}</h5>
                                <p class="card-text text-danger fw-bold mb-1">
                                    <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/> đ
                                </p>
                                <p class="card-text text-muted small mb-3">${p.category.cateName}</p>
                                <a href="${pageContext.request.contextPath}/product-detail?id=${p.productId}" class="btn btn-dark btn-sm mt-auto w-100">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <c:if test="${endPage > 1}">
        <nav aria-label="Page navigation" class="mt-4 pb-5">
            <ul class="pagination justify-content-center">
                <c:forEach begin="1" end="${endPage}" var="i">
                    <li class="page-item ${tag == i ? 'active' : ''}">
                        <a class="page-link"
                           href="${pageContext.request.contextPath}/product?page=${i}&keyword=${keyword != null ? keyword : ''}&categoryId=${categoryId != null ? categoryId : ''}&sort=${sort != null ? sort : ''}">
                                ${i}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </c:if>
</div>
</body>
</html>