package vn.iotstar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.EmailUtil;

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String repassword = req.getParameter("repassword");
        String email = req.getParameter("email");
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");

        req.setAttribute("username", username);
        req.setAttribute("email", email);
        req.setAttribute("fullname", fullname);
        req.setAttribute("phone", phone);

        boolean hasError = false;
        String nameRegex = "^[\\p{L} \\.'-]+$";

        if (fullname == null || fullname.trim().isEmpty()) {
            req.setAttribute("fullnameError", "Họ và tên không được để trống!");
            hasError = true;
        } else {
            fullname = fullname.replaceAll("\\s+", " ").trim();
            req.setAttribute("fullname", fullname);
            if (!fullname.matches(nameRegex) || fullname.length() < 2 || fullname.length() > 100) {
                req.setAttribute("fullnameError", "Họ và tên phải từ 2 đến 100 ký tự và không được chứa số hoặc ký tự đặc biệt!");
                hasError = true;
            }
        }

        if (username == null || username.trim().isEmpty()) {
            req.setAttribute("usernameError", "Tên đăng nhập không được để trống!");
            hasError = true;
        }

        String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";
        if (email == null || email.trim().isEmpty()) {
            req.setAttribute("emailError", "Email không được để trống!");
            hasError = true;
        } else if (!email.matches(emailRegex)) {
            req.setAttribute("emailError", "Định dạng email không hợp lệ (ví dụ: name@gmail.com)!");
            hasError = true;
        }

        if (phone == null || phone.trim().isEmpty()) {
            req.setAttribute("phoneError", "Số điện thoại không được để trống!");
            hasError = true;
        } else if (!phone.matches("^0[0-9]{9}$")) {
            req.setAttribute("phoneError", "Số điện thoại phải có đúng 10 chữ số và bắt đầu bằng số 0!");
            hasError = true;
        }

        if (password == null || password.trim().isEmpty()) {
            req.setAttribute("passwordError", "Mật khẩu không được để trống!");
            hasError = true;
        }
        if (repassword == null || !password.equals(repassword)) {
            req.setAttribute("repasswordError", "Mật khẩu nhập lại không khớp!");
            hasError = true;
        }

        UserService service = new UserServiceImpl();
        if (!hasError) {
            if (service.checkExistUsername(username)) {
                req.setAttribute("usernameError", "Tài khoản đã tồn tại!");
                hasError = true;
            }
            if (service.checkExistEmail(email)) {
                req.setAttribute("emailError", "Email này đã được sử dụng bởi tài khoản khác!");
                hasError = true;
            }
        }

        if (hasError) {
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        String otp = String.format("%06d", new java.util.Random().nextInt(999999));
        boolean isSuccess = service.registerWithOtp(username, password, email, fullname, phone, otp);

        if (isSuccess) {
            EmailUtil.sendEmail(email, "Mã xác thực tài khoản", "Mã OTP của bạn là: " + otp);
            req.getSession().setAttribute("verify_username", username);
            resp.sendRedirect(req.getContextPath() + "/verify");
        } else {
            req.setAttribute("alert", "Lỗi hệ thống khi đăng ký!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        }
    }
}