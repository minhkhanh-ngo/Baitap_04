<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Quản lý Danh mục</title>
</head>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h3 fw-bold text-dark">Quản lý Danh mục sản phẩm</h1>
    <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-dark shadow-sm">
        <i class="fa-solid fa-plus me-1"></i> Thêm danh mục mới
    </a>
</div>

<div class="card shadow-sm border-0 mb-4 p-3 bg-white rounded-3">
    <form action="${pageContext.request.contextPath}/admin/category/list" method="get" class="row g-3 align-items-center">
        <div class="col-md-10">
            <div class="input-group">
                <span class="input-group-text bg-light border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                <input type="text" class="form-control bg-light border-start-0" name="keyword" value="${keyword}" placeholder="Nhập tên danh mục cần tìm kiếm...">
            </div>
        </div>
        <div class="col-md-2">
            <button type="submit" class="btn btn-dark w-100 fw-semibold">Tìm kiếm</button>
        </div>
    </form>
</div>

<div class="card shadow-sm border-0 rounded-3 overflow-hidden">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-dark text-uppercase small">
                <tr>
                    <th class="py-3 ps-4" style="width: 8%;">ID</th>
                    <th class="py-3" style="width: 15%;">Hình ảnh</th>
                    <th class="py-3" style="width: 55%;">Tên danh mục</th>
                    <th class="py-3 text-center" style="width: 22%;">Hành động</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty cateList}">
                        <c:forEach items="${cateList}" var="cate">
                            <tr>
                                <td class="ps-4 fw-semibold text-secondary">#${cate.categoryid}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty cate.images}">
                                            <img src="${pageContext.request.contextPath}/image?fname=${cate.images}" alt="Icon" style="width: 45px; height: 45px; object-fit: cover; border-radius: 6px; border: 1px solid #dee2e6;">
                                        </c:when>
                                        <c:otherwise>
                                            <span class="text-muted small fst-italic">Không có ảnh</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><span class="fw-bold text-dark">${cate.cateName}</span></td>
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/admin/category/edit?id=${cate.categoryid}" class="btn btn-sm btn-outline-warning me-2 px-3 fw-semibold">
                                        <i class="fa-solid fa-pen-to-square me-1"></i> Sửa
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.categoryid}"
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục [${cate.cateName}] này không?');"
                                       class="btn btn-sm btn-outline-danger px-3 fw-semibold">
                                        <i class="fa-solid fa-trash me-1"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="4" class="text-center py-4 text-muted">
                                <i class="fa-solid fa-box-open fa-2x mb-2 d-block opacity-50"></i>
                                Không tìm thấy danh mục nào trong hệ thống!
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>