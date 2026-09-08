<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Xác thực mã OTP - UTE SHOP</title>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .verify-container {
            max-width: 450px;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            margin: 0 auto;
        }
        .form-control {
            background-color: #f8f9fa;
            border: 1px solid #edf2f7;
            padding: 12px 15px;
            font-size: 16px;
            border-radius: 12px;
        }
        .form-control:focus {
            background-color: #fff;
            border-color: #495057;
            box-shadow: none;
        }
    </style>
</head>

<div class="container py-5">
    <div class="verify-container p-4 p-lg-5">
        <div class="text-center mb-4">
            <div class="bg-secondary bg-opacity-10 text-secondary rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px; font-size: 24px;">
                <i class="fa-solid fa-shield-halved"></i>
            </div>
            <h3 class="fw-bold text-dark fs-4">Xác thực mã OTP</h3>
            <p class="text-muted small mb-0">Vui lòng nhập mã xác thực gồm 6 chữ số đã được gửi qua email của bạn.</p>
        </div>

        <c:if test="${not empty alert}">
            <div class="alert alert-danger text-center py-2 small fw-semibold shadow-sm mb-3 rounded-3" role="alert">
                <i class="fa-solid fa-circle-exclamation me-1"></i> ${alert}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/verify" method="post">
            <div class="mb-4">
                <label class="form-label text-muted small fw-bold">Mã xác thực (OTP)</label>
                <input type="text" name="otp" class="form-control text-center fs-4 tracking-widest fw-bold" placeholder="------" maxlength="6" autocomplete="off" required />
            </div>

            <div class="d-grid mb-3">
                <button class="btn btn-dark py-3 fw-bold rounded-pill shadow-sm" style="background-color: #495057; border-color: #495057;" type="submit">
                    Xác nhận OTP
                </button>
            </div>
        </form>

        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/login" class="text-decoration-none fw-semibold small text-muted">
                <i class="fa-solid fa-arrow-left me-1"></i> Quay lại đăng nhập
            </a>
        </div>
    </div>
</div>