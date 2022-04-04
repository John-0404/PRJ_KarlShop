/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin;

import DAO.productDAO;
import Entity.Category;
import Entity.Color;
import Entity.Product;
import Entity.Size;
import Entity.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

//@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
//        maxFileSize = 1024 * 1024 * 50, // 50MB
//        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProductManager extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "images";
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            Entity.User user = (User) session.getAttribute("user");
//            if (user.getIsAdmin().equalsIgnoreCase("true")) {
            if (true) {
                if (action == null || action == "") {
                    productDAO c = new productDAO();
                    List<Product> product = c.getProduct();
                    List<Size> size = c.getSize();
                    List<Color> color = c.getColor();
                    List<Category> category = c.getCategory();
                    request.setAttribute("CategoryData", category);
                    request.setAttribute("ProductData", product);
                    request.setAttribute("SizeData", size);
                    request.setAttribute("ColorData", color);
                    request.getRequestDispatcher("/admin/product.jsp").forward(request, response);
                }
                if (action.equalsIgnoreCase("insert")) {
                    productDAO c = new productDAO();
                    List<Category> category = c.getCategory();
                    request.setAttribute("CategoryData", category);
                    request.getRequestDispatcher("/admin/productinsert.jsp").forward(request, response);
                }

                if (action.equalsIgnoreCase("insertcategory")) {
                    String name = request.getParameter("name");
                    productDAO dao = new productDAO();
                    Entity.Category c = dao.getCategoryByName(name);
                    if (c != null) {
                        request.setAttribute("error", name + " already");
                        request.getRequestDispatcher("admin/productinsert.jsp").forward(request, response);
                    } else {
                        dao.insertCategory(name);
                        request.getRequestDispatcher("productmanager?action=insert").forward(request, response);
                    }
                }

                if (action.equalsIgnoreCase("insertproduct")) {
                    String fileName = "";
                    String product_id = "";
                    String category_id = "";
                    String product_name = "";
                    String product_price = "";
                    String product_size = "";
                    String product_color = "";
                    String product_quantity = "";
                    String product_img = "";
                    String product_describe = "";
                    // configures upload settings
                    DiskFileItemFactory factory = new DiskFileItemFactory(); // sets memory threshold - beyond which files are stored in disk
                    factory.setSizeThreshold(MEMORY_THRESHOLD); // sets temporary location to store files
                    factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setFileSizeMax(MAX_FILE_SIZE);
                    upload.setSizeMax(MAX_REQUEST_SIZE);
                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                    // creates the directory if it does not exist
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }
                    try {
                        // parses the request's content to extract file data
                        @SuppressWarnings("unchecked")
                        List<FileItem> formItems = upload.parseRequest(request);
                        if (formItems != null && formItems.size() > 0) {
                            for (FileItem item : formItems) {
                                if (!item.isFormField()) {// processes only fields that are not form fields
                                    fileName = new File(item.getName()).getName();
                                    String filePath = uploadPath + File.separator + fileName;
                                    File storeFile = new File(filePath);
                                    out.println(fileName);
                                    // saves the file on disk
                                    item.write(storeFile);
                                } else {
                                    if ("product_id".equals(item.getFieldName())) {
                                        product_id = item.getString();
                                    }
                                    if ("category_id".equals(item.getFieldName())) {
                                        category_id = item.getString();
                                    }
                                    if ("product_name".equals(item.getFieldName())) {
                                        product_name = item.getString();
                                    }
                                    if ("price".equals(item.getFieldName())) {
                                        product_price = item.getString();
                                    }
                                    if ("size".equals(item.getFieldName())) {
                                        product_size = item.getString();
                                    }
                                    if ("color".equals(item.getFieldName())) {
                                        product_color = item.getString();
                                    }
                                    if ("quantity".equals(item.getFieldName())) {
                                        product_quantity = item.getString();
                                    }
                                    if ("describe".equals(item.getFieldName())) {
                                        product_describe = item.getString();
                                    }
                                }
                            }
                        }
                    } catch (Exception ex) {
                        request.setAttribute("message",
                                "There was an error: " + ex.getMessage());
                    }
                    product_img = "images/" + fileName;
                    int quantity = Integer.parseInt(product_quantity);
                    Float price = Float.parseFloat(product_price);
                    int cid = Integer.parseInt(category_id);
                    productDAO dao = new productDAO();
                    Category cate = new Category(cid);
                    String[] size_rw = product_size.split("\\s*,\\s*");
                    String[] color_rw = product_color.split("\\s*,\\s*");
                    int[] size = new int[size_rw.length];
                    int[] color = new int[color_rw.length];
                    List<Size> list = new ArrayList<>();
                    try {
                        for (int i = 0; i < size.length; i++) {
                            Size s = new Size(product_id, size_rw[i]);
                            list.add(s);
                        }
                    } catch (Exception e) {
                    }
                    // color
                    List<Color> list2 = new ArrayList<>();
                    try {
                        for (int i = 0; i < color.length; i++) {
                            Color s1 = new Color(product_id, color_rw[i]);
                            list2.add(s1);
                        }
                    } catch (Exception e) {
                    }
                    Product product = new Product(cate, product_id, product_name, price, product_describe, quantity, product_img);
                    product.setSize(list);
                    product.setColor(list2);
                    dao.insertProduct(product);
                    out.print(product_img);
                    out.print(product_name);
                    response.sendRedirect("productmanager");
                }

                if (action.equalsIgnoreCase("deleteproduct")) {
                    String product_id = request.getParameter("product_id");
                    productDAO dao = new productDAO();
                    dao.ProductDelete(product_id);
                    response.sendRedirect("productmanager");
                }

                if (action.equalsIgnoreCase("updateproduct")) {
                    String product_id = request.getParameter("product_id");
                    String category_id = request.getParameter("category_id");
                    String product_name = request.getParameter("product_name");
                    String product_price = request.getParameter("product_price");
                    String product_size = request.getParameter("product_size");
                    String product_color = request.getParameter("product_color");
                    String product_quantity = request.getParameter("product_quantity");
//                    String product_img = "images/" + request.getParameter("product_img");
                    String product_describe = request.getParameter("product_describe");
                    String fileName = "";
                    
                    int quantity = Integer.parseInt(product_quantity);
                    Float price = Float.parseFloat(product_price);
                    int cid = Integer.parseInt(category_id);
                    productDAO dao = new productDAO();
                    Category cate = new Category(cid);
                    String[] size_rw = product_size.split("\\s*,\\s*");
                    String[] color_rw = product_color.split("\\s*,\\s*");
                    int[] size = new int[size_rw.length];
                    int[] color = new int[color_rw.length];
                    //size
                    List<Size> list = new ArrayList<>();
                    try {
                        for (int i = 0; i < size.length; i++) {
                            Size s = new Size(product_id, size_rw[i]);
                            list.add(s);
                        }
                    } catch (Exception e) {
                    }
                    // color
                    List<Color> list2 = new ArrayList<>();
                    try {
                        for (int i = 0; i < color.length; i++) {
                            Color s1 = new Color(product_id, color_rw[i]);
                            list2.add(s1);
                        }
                    } catch (Exception e) {
                    }
                    out.println(" |||||| ");

                    out.println(product_id + " - ");
                    out.println(product_name + " - ");
                    out.println(product_price + " - ");
                    out.println(product_quantity + " - ");
                    out.println(product_describe + " - ");
                    out.println(product_size + " - ");
                    out.println(product_color + " - ");
                    out.println(category_id + " - ");
                    Product product = new Product(cate, product_id, product_name, price, product_describe, quantity);
//                    product.setImg(product_img);
                    product.setSize(list);
                    product.setColor(list2);
                    dao.updateProduct(product);
                    response.sendRedirect("productmanager");
                }
            } else {
                response.sendRedirect("user?action=login");
            }

        } catch (Exception e) {
            response.sendRedirect("404.jsp");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
