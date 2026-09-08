package vn.iotstar.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload2.core.DiskFileItem;
import org.apache.commons.fileupload2.jakarta.JakartaServletFileUpload;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;
import vn.iotstar.config.CloudinaryConfig;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/admin/product/edit", "/admin/product/update"})
public class ProductEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null) {
            Product product = productService.findById(Integer.parseInt(id));
            req.setAttribute("product", product);
        }
        List<Category> listCategories = categoryService.findAll();
        req.setAttribute("listCategories", listCategories);

        req.getRequestDispatcher("/views/admin/product-edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Product product = new Product();
        product.setQuantity(0);
        product.setPrice(0.0);
        String oldImages = "";
        String imageLink = "";
        String uploadedCloudUrl = "";

        Cloudinary cloudinary = CloudinaryConfig.getCloudinary();

        if (JakartaServletFileUpload.isMultipartContent(req)) {
            JakartaServletFileUpload<DiskFileItem, ? extends org.apache.commons.fileupload2.core.FileItemFactory<DiskFileItem>> upload =
                    new JakartaServletFileUpload<>(new org.apache.commons.fileupload2.core.DiskFileItemFactory.Builder().get());
            try {
                List<DiskFileItem> items = upload.parseRequest(req);
                for (DiskFileItem item : items) {
                    if (item.isFormField()) {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString(StandardCharsets.UTF_8);
                        switch (fieldName) {
                            case "productId" -> {
                                if (fieldValue != null && !fieldValue.isEmpty())
                                    product.setProductId(Integer.parseInt(fieldValue));
                            }
                            case "productName" -> product.setProductName(fieldValue);
                            case "price" -> {
                                if (fieldValue != null && !fieldValue.isEmpty())
                                    product.setPrice(Double.parseDouble(fieldValue));
                            }
                            case "quantity" -> {
                                if (fieldValue != null && !fieldValue.isEmpty())
                                    product.setQuantity(Integer.parseInt(fieldValue));
                            }
                            case "description" -> product.setDescription(fieldValue);
                            case "categoryId" -> {
                                if (fieldValue != null && !fieldValue.isEmpty()) {
                                    Category category = new Category();
                                    category.setCategoryid(Integer.parseInt(fieldValue));
                                    product.setCategory(category);
                                }
                            }
                            case "oldImages" -> oldImages = fieldValue;
                            case "imageLink" -> imageLink = fieldValue;
                        }
                    } else {
                        if (item.getSize() > 0) {
                            Map uploadResult = cloudinary.uploader().upload(item.get(), ObjectUtils.emptyMap());
                            uploadedCloudUrl = (String) uploadResult.get("secure_url");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (uploadedCloudUrl.isEmpty() && imageLink != null && imageLink.startsWith("http")) {
            try {
                Map uploadResult = cloudinary.uploader().upload(imageLink, ObjectUtils.emptyMap());
                uploadedCloudUrl = (String) uploadResult.get("secure_url");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (!uploadedCloudUrl.isEmpty()) {
            product.setImageUrl(uploadedCloudUrl);
        } else {
            product.setImageUrl(oldImages);
        }

        String productName = product.getProductName();
        String safeRegex = "^[\\p{L}0-9 \\.'-]+$";

        if (productName == null || productName.trim().isEmpty()) {
            req.setAttribute("error", "Tên sản phẩm không được để trống!");
            req.setAttribute("product", product);
            req.setAttribute("listCategories", categoryService.findAll());
            req.getRequestDispatcher("/views/admin/product-edit.jsp").forward(req, resp);
            return;
        }

        productName = productName.replaceAll("\\s+", " ").trim();
        product.setProductName(productName);

        if (productName.length() < 3 || productName.length() > 100) {
            req.setAttribute("error", "Tên sản phẩm phải từ 3 đến 100 ký tự!");
            req.setAttribute("product", product);
            req.setAttribute("listCategories", categoryService.findAll());
            req.getRequestDispatcher("/views/admin/product-edit.jsp").forward(req, resp);
            return;
        }

        if (!productName.matches(safeRegex)) {
            req.setAttribute("error", "Tên sản phẩm không được chứa ký tự đặc biệt!");
            req.setAttribute("product", product);
            req.setAttribute("listCategories", categoryService.findAll());
            req.getRequestDispatcher("/views/admin/product-edit.jsp").forward(req, resp);
            return;
        }

        if (product.getPrice() < 0) {
            req.setAttribute("error", "Giá sản phẩm phải lớn hơn hoặc bằng 0!");
            req.setAttribute("product", product);
            req.setAttribute("listCategories", categoryService.findAll());
            req.getRequestDispatcher("/views/admin/product-edit.jsp").forward(req, resp);
            return;
        }

        if (product.getQuantity() < 0) {
            req.setAttribute("error", "Số lượng tồn kho phải lớn hơn hoặc bằng 0!");
            req.setAttribute("product", product);
            req.setAttribute("listCategories", categoryService.findAll());
            req.getRequestDispatcher("/views/admin/product-edit.jsp").forward(req, resp);
            return;
        }

        productService.update(product);
        resp.sendRedirect(req.getContextPath() + "/admin/product/list");
    }
}