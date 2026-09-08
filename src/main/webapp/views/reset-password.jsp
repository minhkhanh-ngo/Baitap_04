<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đặt lại mật khẩu</title>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-sm border-0 rounded-4 mt-5">
                <div class="card-header bg-white text-center py-4 border-0">
                    <h3 class="my-2 fw-bold text-primary">Xác thực & Đổi mật khẩu</h3>
                </div>
                <div class="card-body p-4">
                    <c:if test="${not empty alert}">
                        <div class="alert alert-danger text-center fw-semibold">${alert}</div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/reset-password" method="post">
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Mã OTP (6 chữ số):</label>
                            <input type="text" name="otp" class="form-control py-2" placeholder="Nhập mã OTP..." required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label text-muted small fw-bold">Mật khẩu mới:</label>
                            <input type="password" name="newPassword" class="form-control py-2" placeholder="Nhập mật khẩu mới..." required>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary py-2 fw-bold rounded-3">Xác nhận đổi mật khẩu</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>