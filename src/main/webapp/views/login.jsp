<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-sm border-0 rounded-4 p-4 bg-white">

                <ul class="nav nav-pills nav-justified mb-4 bg-light p-1 rounded-pill">
                    <li class="nav-item">
                        <a class="nav-link active rounded-pill fw-bold py-2 text-white" style="background-color: #495057;" href="${pageContext.request.contextPath}/login">ĐĂNG NHẬP</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark rounded-pill fw-bold py-2" href="${pageContext.request.contextPath}/register">ĐĂNG KÝ</a>
                    </li>
                </ul>

                <form action="${pageContext.request.contextPath}/login" method="post" novalidate>
                    <c:if test="${not empty alert}">
                        <div class="alert alert-danger text-center py-2 small">${alert}</div>
                    </c:if>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="loginName">Tên đăng nhập</label>
                        <input type="text" id="loginName" name="username" class="form-control ${not empty usernameError ? 'is-invalid' : ''}" value="${username}" />
                        <c:if test="${not empty usernameError}">
                            <div class="invalid-feedback">${usernameError}</div>
                        </c:if>
                    </div>

                    <div class="form-outline mb-3">
                        <label class="form-label text-muted small fw-bold" for="loginPassword">Mật khẩu</label>
                        <input type="password" id="loginPassword" name="password" class="form-control ${not empty passwordError ? 'is-invalid' : ''}" />
                        <c:if test="${not empty passwordError}">
                            <div class="invalid-feedback">${passwordError}</div>
                        </c:if>
                    </div>

                    <div class="row mb-4">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="remember" value="on" id="loginCheck" checked />
                                <label class="form-check-label small" for="loginCheck"> Nhớ mật khẩu </label>
                            </div>
                        </div>
                        <div class="col-6 text-end">
                            <a href="${pageContext.request.contextPath}/forgot-password" class="small text-decoration-none text-muted fw-semibold">Quên mật khẩu?</a>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-secondary w-100 py-2 fw-bold rounded-pill mb-3" style="background-color: #495057; border-color: #495057;">Đăng nhập</button>
                </form>
            </div>
        </div>
    </div>
</div>