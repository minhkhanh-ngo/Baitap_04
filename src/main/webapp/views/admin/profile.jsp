<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <title>Hồ sơ Quản trị viên</title>
    <style>
        .admin-profile-container {
            max-width: 950px;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            margin: 0 auto;
        }
        .admin-profile-sidebar {
            background: #343a40;
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

<div class="container py-4">
    <form action="${pageContext.request.contextPath}/admin/profile/update" method="post" enctype="multipart/form-data">
        <div class="admin-profile-container">
            <div class="row g-0">

                <div class="col-lg-4 admin-profile-sidebar text-center">
                    <div class="position-relative d-inline-block mb-3">
                        <label for="adminAvatarFile" style="cursor: pointer;" title="Click để đổi ảnh đại diện">
                            <c:choose>
                                <c:when test="${not empty sessionScope.account.avatar}">
                                    <c:choose>
                                        <c:when test="${sessionScope.account.avatar.startsWith('http')}">
                                            <img src="${sessionScope.account.avatar}" class="rounded-circle shadow border border-3 border-white" style="width: 120px; height: 120px; object-fit: cover;" alt="Admin Avatar">
                                        </c:when>
                                        <c:otherwise>
                                            <c:url value="/image" var="adminImgUrl">
                                                <c:param name="fname" value="${sessionScope.account.avatar}" />
                                            </c:url>
                                            <img src="${adminImgUrl}" class="rounded-circle shadow border border-3 border-white" style="width: 120px; height: 120px; object-fit: cover;" alt="Admin Avatar">
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <img src="https://ui-avatars.com/api/?name=${sessionScope.account.fullName}&background=6c757d&color=ffffff" class="rounded-circle shadow border border-3 border-white" style="width: 120px; height: 120px; object-fit: cover;" alt="Admin Avatar">
                                </c:otherwise>
                            </c:choose>
                            <span class="position-absolute bottom-0 start-50 translate-middle-x badge rounded-pill bg-dark text-white border border-light px-2 py-1 shadow-sm" style="font-size: 11px;">
                                <i class="fa-solid fa-camera me-1"></i> Đổi ảnh
                            </span>
                        </label>
                        <input type="file" id="adminAvatarFile" name="images" accept="image/*" class="d-none">
                    </div>
                    <h5 class="fw-bold text-white mb-1 text-truncate px-2">${sessionScope.account.fullName}</h5>
                    <span class="badge bg-danger text-uppercase px-2 py-1" style="font-size: 10px;">Quản trị viên hệ thống</span>
                </div>

                <div class="col-lg-8 p-4 p-lg-5 d-flex flex-column justify-content-between">
                    <div>
                        <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-2">
                            <h4 class="fw-bold text-dark m-0 fs-5"><i class="fa-solid fa-user-gear me-2 text-secondary"></i>Chỉnh sửa hồ sơ quản trị</h4>
                        </div>

                        <c:if test="${not empty message}">
                            <div class="alert alert-success text-center py-2 small fw-bold shadow-sm mb-3" role="alert">
                                <i class="fa-solid fa-circle-check me-1"></i> ${message}
                            </div>
                        </c:if>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Họ và tên (Fullname)</label>
                            <input type="text" name="fullname" class="form-control ${not empty fullnameError ? 'is-invalid' : ''}"
                                   value="${not empty fullname ? fullname : sessionScope.account.fullName}" required>
                            <c:if test="${not empty fullnameError}">
                                <div class="invalid-feedback">${fullnameError}</div>
                            </c:if>
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Số điện thoại (Phone number)</label>
                            <input type="tel" name="phone" class="form-control ${not empty phoneError ? 'is-invalid' : ''}"
                                   value="${not empty phone ? phone : sessionScope.account.phone}">
                            <c:if test="${not empty phoneError}">
                                <div class="invalid-feedback">${phoneError}</div>
                            </c:if>
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Email tài khoản</label>
                            <input type="email" class="form-control bg-light text-muted" value="${sessionScope.account.email}" disabled>
                            <small class="text-muted" style="font-size: 11px;">Email quản trị không thể thay đổi tại đây.</small>
                        </div>
                    </div>

                    <div class="d-flex justify-content-end mt-4 pt-3 border-top">
                        <button type="submit" class="btn btn-dark px-4 py-2 fw-bold rounded-pill shadow-sm">
                            <i class="fa-solid fa-floppy-disk me-1"></i> Lưu thông tin
                        </button>
                    </div>
                </div>

            </div>
        </div>
    </form>
</div>

<content tag="script">
    <script>
        document.getElementById('adminAvatarFile').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const imgElement = document.querySelector('.admin-profile-sidebar img');
                    if (imgElement) {
                        imgElement.src = e.target.result;
                    }
                }
                reader.readAsDataURL(file);
            }
        });
    </script>
</content>