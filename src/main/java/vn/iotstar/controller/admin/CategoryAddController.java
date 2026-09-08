package vn.iotstar.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import vn.iotstar.entity.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.util.Constant;

@MultipartConfig()
@WebServlet(urlPatterns = {"/admin/category/add", "/admin/category/insert"})
public class CategoryAddController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/add-category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String cateName = req.getParameter("cateName");

        String safeRegex = "^[\\p{L}0-9 \\.'-]+$";

        if (cateName == null || cateName.trim().isEmpty()) {
            req.setAttribute("error", "Tên danh mục không được để trống!");
            req.getRequestDispatcher("/views/admin/add-category.jsp").forward(req, resp);
            return;
        }

        cateName = cateName.replaceAll("\\s+", " ").trim();

        if (cateName.length() < 3 || cateName.length() > 50) {
            req.setAttribute("error", "Tên danh mục phải từ 3 đến 50 ký tự!");
            req.getRequestDispatcher("/views/admin/add-category.jsp").forward(req, resp);
            return;
        }

        if (!cateName.matches(safeRegex)) {
            req.setAttribute("error", "Tên danh mục không được chứa ký tự đặc biệt!");
            req.getRequestDispatcher("/views/admin/add-category.jsp").forward(req, resp);
            return;
        }


        int status = 1;
        String statusStr = req.getParameter("status");
        if (statusStr != null && !statusStr.isEmpty()) {
            status = Integer.parseInt(statusStr);
        }

        Category category = new Category();
        category.setCateName(cateName);
        category.setStatus(status);

        String fname = "";
        String uploadPath = Constant.DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            boolean created = uploadDir.mkdir();
            if (!created) {
                System.out.println("Không thể tạo thư mục upload!");
            }
        }

        try {
            Part part = req.getPart("images");
            if (part != null && part.getSize() > 0) {
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                int index = filename.lastIndexOf(".");
                String ext = filename.substring(index + 1);
                fname = System.currentTimeMillis() + "." + ext;
                part.write(uploadPath + File.separator + fname);
                category.setImages(fname);
            } else {
                category.setImages("avatar.png");
            }
        } catch (Exception e) {
            e.printStackTrace();
            category.setImages("avatar.png");
        }

        categoryService.insert(category);

        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}