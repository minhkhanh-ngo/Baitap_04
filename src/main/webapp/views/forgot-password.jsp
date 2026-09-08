<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quên mật khẩu</title>
</head>
<body>
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-sm border-0 rounded-4 p-4 bg-white">
                <div class="card-header bg-white text-center py-3 border-0">
                    <h3 class="my-2 fw-bold text-dark">Khôi phục mật khẩu</h3>
                </div>
                <div class="card-body p-3">
                    <c:if test="${not empty alert}">
                        <div class="alert alert-danger text-center py-2 small fw-semibold">${alert}</div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/forgot-password" method="post">
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Nhập email đăng ký của bạn:</label>
                            <input type="email" name="email" class="form-control py-2 rounded-3" placeholder="Ví dụ: example@gmail.com" required>
                        </div>
                        <div class="d-grid gap-2 mt-4">
                            <button class="btn w-100 py-2 fw-bold rounded-pill text-white shadow-sm" style="background-color: #495057; border-color: #495057;" type="submit">Gửi mã OTP</button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center py-3 bg-white border-0">
                    <a href="${pageContext.request.contextPath}/login" class="text-decoration-none fw-semibold small text-muted">Quay lại đăng nhập</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>