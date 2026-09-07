package vn.iotstar.controller;

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
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet(urlPatterns = {"/profile"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10)
public class ProfileController extends HttpServlet {

    private UserDao userDao = new UserDaoImpl();
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
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
        String avatarName = "";

        Part part = req.getPart("images");
        if (part != null && part.getSize() > 0) {
            String uploadPath = req.getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            avatarName = System.currentTimeMillis() + "_" + fileName;
            part.write(uploadPath + File.separator + avatarName);
        }

        userDao.updateProfile(currentUser.getId(), fullName, phone, avatarName);

        currentUser.setFullName(fullName);
        currentUser.setPhone(phone);
        if (!avatarName.isEmpty()) currentUser.setAvatar(avatarName);
        session.setAttribute("account", currentUser);

        req.setAttribute("message", "Cập nhật hồ sơ thành công!");
        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
    }
}