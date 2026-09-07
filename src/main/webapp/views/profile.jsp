<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Cập Nhật Hồ Sơ</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">

<div class="container mt-5 mb-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card shadow-sm border-0 rounded-4">
        <div class="card-header bg-primary text-white text-center py-3 rounded-top-4">
          <h4 class="mb-0 fw-bold">Cập Nhật Hồ Sơ Cá Nhân</h4>
        </div>
        <div class="card-body p-4">

          <c:if test="${not empty message}">
            <div class="alert alert-success text-center fw-bold">${message}</div>
          </c:if>

          <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">

            <div class="text-center mb-4">
              <c:choose>
                <c:when test="${not empty sessionScope.account.avatar}">
                  <img src="${pageContext.request.contextPath}/uploads/${sessionScope.account.avatar}" class="rounded-circle shadow-sm" style="width: 120px; height: 120px; object-fit: cover;" alt="Avatar">
                </c:when>
                <c:otherwise>
                  <img src="https://ui-avatars.com/api/?name=${sessionScope.account.fullName}&background=random" class="rounded-circle shadow-sm" style="width: 120px; height: 120px;" alt="Avatar">
                </c:otherwise>
              </c:choose>
            </div>

            <div class="mb-3">
              <label class="form-label fw-bold">Họ và Tên:</label>
              <input type="text" name="fullname" class="form-control" value="${sessionScope.account.fullName}" required>
            </div>

            <div class="mb-3">
              <label class="form-label fw-bold">Số điện thoại:</label>
              <input type="tel" name="phone" class="form-control" value="${sessionScope.account.phone}" required>
            </div>

            <div class="mb-4">
              <label class="form-label fw-bold">Ảnh đại diện mới:</label>
              <input type="file" name="images" class="form-control" accept="image/*">
            </div>

            <!-- Các nút thao tác ở dưới cùng -->
            <div class="d-grid gap-2">
              <button type="submit" class="btn btn-primary fw-bold py-2">Lưu thay đổi</button>

              <c:choose>
                <c:when test="${sessionScope.account.roleid == 1}">
                  <a href="${pageContext.request.contextPath}/admin/home" class="btn btn-outline-secondary fw-bold py-2">Quay lại trang chủ Admin</a>
                </c:when>
                <c:otherwise>
                  <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary fw-bold py-2">Quay lại trang chủ</a>
                </c:otherwise>
              </c:choose>
            </div>

          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>