<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập hệ thống</title>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-white text-center py-4 border-0">
                    <h3 class="my-2 fw-bold text-primary">Đăng nhập</h3>
                </div>
                <div class="card-body p-4">

                    <c:if test="${not empty message}">
                        <div class="alert alert-danger text-center fw-semibold">${message}</div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/login" method="post">
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Tài khoản</label>
                            <input class="form-control py-2" name="username" type="text" placeholder="Nhập tài khoản..." required />
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Mật khẩu</label>
                            <input class="form-control py-2" name="password" type="password" placeholder="Nhập mật khẩu..." required />
                        </div>
                        <div class="d-flex align-items-center justify-content-between mt-3 mb-4">
                            <div class="form-check">
                                <input class="form-check-input" id="rememberMe" type="checkbox" name="remember" />
                                <label class="form-check-label small text-muted" for="rememberMe">Nhớ tài khoản</label>
                            </div>
                            <a class="small text-decoration-none fw-semibold" href="${pageContext.request.contextPath}/forgot-password">Quên mật khẩu?</a>
                        </div>
                        <div class="d-grid gap-2">
                            <button class="btn btn-primary py-2 fw-bold rounded-3" type="submit">Đăng nhập</button>
                        </div>
                    </form>

                </div>
                <div class="card-footer text-center py-3 bg-white border-0">
                    <div class="small">
                        <span class="text-muted">Chưa có tài khoản?</span>
                        <a href="${pageContext.request.contextPath}/register" class="text-decoration-none fw-bold">Đăng ký ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>