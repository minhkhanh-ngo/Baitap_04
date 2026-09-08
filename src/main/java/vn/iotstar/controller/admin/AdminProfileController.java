package vn.iotstar.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import vn.iotstar.dao.UserDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.entity.User;
import vn.iotstar.util.Constant;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet(urlPatterns = {"/admin/profile", "/admin/profile/update"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10)
public class AdminProfileController extends HttpServlet {

    private UserDao userDao = new UserDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.getRequestDispatcher("/views/admin/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("account");

        if (currentUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String fullName = req.getParameter("fullname");
        String phone = req.getParameter("phone");

        String nameRegex = "^[\\p{L} \\.'-]+$";
        if (fullName == null || fullName.trim().isEmpty()) {
            req.setAttribute("error", "Họ và tên không được để trống!");
            req.getRequestDispatcher("/views/admin/profile.jsp").forward(req, resp);
            return;
        }

        fullName = fullName.replaceAll("\\s+", " ").trim();

        if (!fullName.matches(nameRegex) || fullName.length() < 2 || fullName.length() > 100) {
            req.setAttribute("error", "Họ và tên từ 2 đến 100 ký tự và không được chứa số hoặc ký tự đặc biệt!");
            req.getRequestDispatcher("/views/admin/profile.jsp").forward(req, resp);
            return;
        }

        if (phone != null && !phone.matches("^0[0-9]{9}$")) {
            req.setAttribute("error", "Số điện thoại phải có đúng 10 chữ số và bắt đầu bằng số 0!");
            req.getRequestDispatcher("/views/admin/profile.jsp").forward(req, resp);
            return;
        }

        String avatarName = currentUser.getAvatar();

        Part part = req.getPart("images");
        if (part != null && part.getSize() > 0) {
            File uploadDir = new File(Constant.DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            avatarName = System.currentTimeMillis() + "_" + fileName;

            part.write(Constant.DIR + File.separator + avatarName);
        }

        userDao.updateProfile(currentUser.getId(), fullName, phone, avatarName);

        currentUser.setFullName(fullName);
        currentUser.setPhone(phone);
        currentUser.setAvatar(avatarName);
        session.setAttribute("account", currentUser);

        req.setAttribute("message", "Cập nhật hồ sơ quản trị thành công!");
        req.getRequestDispatcher("/views/admin/profile.jsp").forward(req, resp);
    }
}