<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-sm border-0 rounded-4 p-4 bg-white">
                <ul class="nav nav-pills nav-justified mb-4 bg-light p-1 rounded-pill">
                    <li class="nav-item">
                        <a class="nav-link text-dark rounded-pill fw-bold py-2" href="${pageContext.request.contextPath}/login">ĐĂNG NHẬP</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active rounded-pill fw-bold py-2" href="${pageContext.request.contextPath}/register">ĐĂNG KÝ</a>
                    </li>
                </ul>

                <form action="${pageContext.request.contextPath}/register" method="post">
                    <c:if test="${not empty alert}">
                        <div class="alert alert-danger text-center py-2 small">${alert}</div>
                    </c:if>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="registerName">Họ và tên</label>
                        <input type="text" id="registerName" name="fullname" class="form-control" required />
                    </div>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="registerUsername">Tên đăng nhập</label>
                        <input type="text" id="registerUsername" name="username" class="form-control" required />
                    </div>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="registerEmail">Email</label>
                        <input type="email" id="registerEmail" name="email" class="form-control" required />
                    </div>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="registerPhone">Số điện thoại</label>
                        <input type="tel" id="registerPhone" name="phone" class="form-control" required />
                    </div>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="registerPassword">Mật khẩu</label>
                        <input type="password" id="registerPassword" name="password" class="form-control" required />
                    </div>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="registerRepeatPassword">Nhập lại mật khẩu</label>
                        <input type="password" id="registerRepeatPassword" name="repassword" class="form-control" required />
                    </div>

                    <button type="submit" class="btn btn-dark w-100 py-2 fw-bold rounded-pill mb-3">Đăng ký</button>
                </form>
            </div>
        </div>
    </div>
</div>