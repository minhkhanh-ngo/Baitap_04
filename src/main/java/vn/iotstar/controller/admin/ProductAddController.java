package vn.iotstar.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;
import vn.iotstar.util.CloudinaryUtil;
import vn.iotstar.config.CloudinaryConfig;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(urlPatterns = "/admin/product-add")
public class ProductAddController extends HttpServlet {
    private final ProductService productService = new ProductServiceImpl();
    private final CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        List<Category> categories = categoryService.findAll();
        req.setAttribute("listCategories", categories);

        req.getRequestDispatcher("/views/admin/product-add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String productName = req.getParameter("productName");
        String priceStr = req.getParameter("price");
        String quantityStr = req.getParameter("quantity");
        String categoryIdStr = req.getParameter("categoryId");
        String description = req.getParameter("description");
        String imageLink = req.getParameter("imageLink");

        String safeRegex = "^[\\p{L}0-9 \\.'-]+$";

        if (productName == null || productName.trim().isEmpty()) {
            req.setAttribute("error", "Tên sản phẩm không được để trống!");
            req.setAttribute("listCategories", categoryService.findAll());
            req.getRequestDispatcher("/views/admin/product-add.jsp").forward(req, resp);
            return;
        }

        productName = productName.replaceAll("\\s+", " ").trim();

        if (productName.length() < 3 || productName.length() > 100) {
            req.setAttribute("error", "Tên sản phẩm phải từ 3 đến 100 ký tự!");
            req.setAttribute("listCategories", categoryService.findAll());
            req.getRequestDispatcher("/views/admin/product-add.jsp").forward(req, resp);
            return;
        }

        if (!productName.matches(safeRegex)) {
            req.setAttribute("error", "Tên sản phẩm không được chứa ký tự đặc biệt!");
            req.setAttribute("listCategories", categoryService.findAll());
            req.getRequestDispatcher("/views/admin/product-add.jsp").forward(req, resp);
            return;
        }

        double price = 0;
        try {
            price = Double.parseDouble(priceStr);
            if (price < 0) {
                throw new NumberFormatException();
            }
        } catch (Exception e) {
            req.setAttribute("error", "Giá sản phẩm phải là số hợp lệ và lớn hơn hoặc bằng 0!");
            req.setAttribute("listCategories", categoryService.findAll());
            req.getRequestDispatcher("/views/admin/product-add.jsp").forward(req, resp);
            return;
        }

        int quantity = 0;
        try {
            quantity = Integer.parseInt(quantityStr);
            if (quantity < 0) {
                throw new NumberFormatException();
            }
        } catch (Exception e) {
            req.setAttribute("error", "Số lượng tồn kho phải là số nguyên lớn hơn hoặc bằng 0!");
            req.setAttribute("listCategories", categoryService.findAll());
            req.getRequestDispatcher("/views/admin/product-add.jsp").forward(req, resp);
            return;
        }

        int categoryId = 0;
        try {
            categoryId = Integer.parseInt(categoryIdStr);
        } catch (Exception e) {
            req.setAttribute("error", "Vui lòng chọn danh mục hợp lệ!");
            req.setAttribute("listCategories", categoryService.findAll());
            req.getRequestDispatcher("/views/admin/product-add.jsp").forward(req, resp);
            return;
        }

        Part filePart = req.getPart("imageFile");
        String imageUrl = "";

        if (filePart != null && filePart.getSize() > 0) {
            imageUrl = CloudinaryUtil.uploadImage(filePart);
        } else if (imageLink != null && imageLink.startsWith("http")) {
            try {
                Cloudinary cloudinary = CloudinaryConfig.getCloudinary();
                Map uploadResult = cloudinary.uploader().upload(imageLink, ObjectUtils.emptyMap());
                imageUrl = (String) uploadResult.get("secure_url");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        Product product = new Product();
        product.setProductName(productName);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setDescription(description);
        product.setImageUrl(imageUrl);

        Category category = new Category();
        category.setCategoryid(categoryId);
        product.setCategory(category);

        productService.insert(product);

        resp.sendRedirect(req.getContextPath() + "/admin/product/list");
    }
}