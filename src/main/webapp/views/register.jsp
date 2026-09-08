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
                        <a class="nav-link active rounded-pill fw-bold py-2 text-white" style="background-color: #495057;" href="${pageContext.request.contextPath}/register">ĐĂNG KÝ</a>
                    </li>
                </ul>

                <form action="${pageContext.request.contextPath}/register" method="post" novalidate>
                    <c:if test="${not empty alert}">
                        <div class="alert alert-danger text-center py-2 small">${alert}</div>
                    </c:if>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="registerName">Họ và tên</label>
                        <input type="text" id="registerName" name="fullname" class="form-control ${not empty fullnameError ? 'is-invalid' : ''}" value="${fullname}" />
                        <c:if test="${not empty fullnameError}">
                            <div class="invalid-feedback">${fullnameError}</div>
                        </c:if>
                    </div>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="registerUsername">Tên đăng nhập</label>
                        <input type="text" id="registerUsername" name="username" class="form-control ${not empty usernameError ? 'is-invalid' : ''}" value="${username}" />
                        <c:if test="${not empty usernameError}">
                            <div class="invalid-feedback">${usernameError}</div>
                        </c:if>
                    </div>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="registerEmail">Email</label>
                        <input type="email" id="registerEmail" name="email" class="form-control ${not empty emailError ? 'is-invalid' : ''}" value="${email}" />
                        <c:if test="${not empty emailError}">
                            <div class="invalid-feedback">${emailError}</div>
                        </c:if>
                    </div>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="registerPhone">Số điện thoại</label>
                        <input type="tel" id="registerPhone" name="phone" class="form-control ${not empty phoneError ? 'is-invalid' : ''}" value="${phone}" />
                        <c:if test="${not empty phoneError}">
                            <div class="invalid-feedback">${phoneError}</div>
                        </c:if>
                    </div>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="registerPassword">Mật khẩu</label>
                        <input type="password" id="registerPassword" name="password" class="form-control ${not empty passwordError ? 'is-invalid' : ''}" />
                        <c:if test="${not empty passwordError}">
                            <div class="invalid-feedback">${passwordError}</div>
                        </c:if>
                    </div>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="registerRepeatPassword">Nhập lại mật khẩu</label>
                        <input type="password" id="registerRepeatPassword" name="repassword" class="form-control ${not empty repasswordError ? 'is-invalid' : ''}" />
                        <c:if test="${not empty repasswordError}">
                            <div class="invalid-feedback">${repasswordError}</div>
                        </c:if>
                    </div>

                    <button type="submit" class="btn btn-secondary w-100 py-2 fw-bold rounded-pill mb-3" style="background-color: #495057; border-color: #495057;">Đăng ký</button>
                </form>
            </div>
        </div>
    </div>
</div>