<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Hồ sơ cá nhân - UTE SHOP</title>

<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    .profile-container {
      max-width: 950px;
      background: #ffffff;
      border-radius: 20px;
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.08);
      overflow: hidden;
      margin: 0 auto;
    }
    .profile-sidebar {
      background: #495057;
      color: #fff;
      padding: 50px 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
    .form-control {
      background-color: #f8f9fa;
      border: 1px solid #edf2f7;
      padding: 10px 15px;
      font-size: 14px;
      border-radius: 10px;
    }
    .form-control:focus {
      background-color: #fff;
      border-color: #0d6efd;
      box-shadow: none;
    }
  </style>
</head>

<div class="container py-2">
  <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">
    <div class="profile-container">
      <div class="row g-0">

        <div class="col-lg-4 profile-sidebar">
          <div class="text-center">
            <div class="position-relative d-inline-block">
              <label for="avatarFile" style="cursor: pointer;" title="Click để đổi ảnh đại diện">
                <c:choose>
                  <c:when test="${not empty sessionScope.account.avatar}">
                    <img src="${pageContext.request.contextPath}/uploads/${sessionScope.account.avatar}" class="rounded-circle shadow border border-3 border-white" style="width: 120px; height: 120px; object-fit: cover;" alt="Avatar">
                  </c:when>
                  <c:otherwise>
                    <img src="https://ui-avatars.com/api/?name=${sessionScope.account.fullName}&background=ffffff&color=0d6efd" class="rounded-circle shadow border border-3 border-white" style="width: 120px; height: 120px;" alt="Avatar">
                  </c:otherwise>
                </c:choose>
                <span class="position-absolute bottom-0 start-50 translate-middle-x badge rounded-pill bg-dark text-white border border-light px-2 py-1 shadow-sm" style="font-size: 11px;">
                                    <i class="fa-solid fa-camera me-1"></i> Đổi ảnh
                                </span>
              </label>
              <input type="file" id="avatarFile" name="images" accept="image/*" class="d-none">
            </div>
          </div>
        </div>

        <div class="col-lg-8 p-4 p-lg-5 d-flex flex-column justify-content-between">
          <div>
            <div class="text-center text-muted small mb-4 fw-semibold">Thông tin cá nhân</div>

            <c:if test="${not empty message}">
              <div class="alert alert-success text-center py-2 small fw-bold">${message}</div>
            </c:if>

            <div class="mb-3">
              <label class="form-label text-muted small fw-bold">Họ và tên (Fullname)</label>
              <input type="text" name="fullname" class="form-control" value="${sessionScope.account.fullName}" required>
            </div>

            <div class="mb-3">
              <label class="form-label text-muted small fw-bold">Số điện thoại (Phone number)</label>
              <input type="tel" name="phone" class="form-control" value="${sessionScope.account.phone}" required>
            </div>
          </div>

          <div class="d-grid mt-4">
            <button type="submit" class="btn btn-dark py-2 fw-bold rounded-pill shadow-sm">
              Lưu thông tin
            </button>
          </div>
        </div>

      </div>
    </div>
  </form>
</div>

<content tag="script">
  <script>
    document.getElementById('avatarFile').addEventListener('change', function(event) {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
          const imgElement = document.querySelector('.profile-sidebar img');
          if (imgElement) {
            imgElement.src = e.target.result;
          }
        }
        reader.readAsDataURL(file);
      }
    });
  </script>
</content>