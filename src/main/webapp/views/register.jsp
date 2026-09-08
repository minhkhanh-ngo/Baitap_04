<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký tài khoản</title>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-white text-center py-4 border-0">
                    <h3 class="my-2 fw-bold text-primary">Đăng ký tài khoản</h3>
                </div>
                <div class="card-body p-4">
                    <c:if test="${not empty alert}">
                        <div class="alert alert-danger text-center fw-semibold" role="alert">${alert}</div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/register" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label text-muted small fw-bold">Tài khoản</label>
                            <input type="text" class="form-control py-2" id="username" name="username" placeholder="Nhập tài khoản..." required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label text-muted small fw-bold">Mật khẩu</label>
                            <input type="password" class="form-control py-2" id="password" name="password" placeholder="Nhập mật khẩu..." required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label text-muted small fw-bold">Email (nhận mã OTP)</label>
                            <input type="email" class="form-control py-2" id="email" name="email" placeholder="Nhập email của bạn..." required>
                        </div>
                        <div class="mb-3">
                            <label for="fullname" class="form-label text-muted small fw-bold">Họ và tên</label>
                            <input type="text" class="form-control py-2" id="fullname" name="fullname" placeholder="Nhập họ và tên..." required>
                        </div>
                        <div class="mb-4">
                            <label for="phone" class="form-label text-muted small fw-bold">Số điện thoại</label>
                            <input type="tel" class="form-control py-2" id="phone" name="phone" placeholder="Nhập số điện thoại...">
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary py-2 fw-bold rounded-3">Đăng ký</button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center py-3 bg-white border-0">
                    <span class="text-muted small">Đã có tài khoản? </span>
                    <a href="${pageContext.request.contextPath}/login" class="text-decoration-none fw-bold small">Đăng nhập ngay</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>