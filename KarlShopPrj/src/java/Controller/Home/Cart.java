package Controller.Home;

import DAO.billDAO;
import DAO.productDAO;
import Entity.DiscountCode;
import Entity.Item;
import Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Cart extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");

        if (action == null) {
            Boolean check = false;
            Entity.Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Entity.Cart) o;
            } else {
                cart = new Entity.Cart();
            }
            String Squantity = request.getParameter("quantity");
            String product_id = request.getParameter("product_id");
            String size = request.getParameter("size");
            String color = request.getParameter("color");

            try {
                int quanity = Integer.parseInt(Squantity);
                productDAO pdao = new productDAO();
                Product product = pdao.getProductByID(product_id);
                Item item = new Item(product, quanity, size, color);
                cart.addItem(item);
                check = true;
            } catch (Exception e) {
                check = false;
                
            }
            List<Item> list = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalMoney());
            session.setAttribute("totalfinal", cart.getTotalMoney() + 30000);
            session.setAttribute("size", list.size());
            request.setAttribute("check", check);
            request.getRequestDispatcher("product?action=productdetail&product_id=" + product_id).forward(request, response);
        }
        if (action.equalsIgnoreCase("showcart")) {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
        if (action.equals("deletecart")) {
            Entity.Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Entity.Cart) o;
            } else {
                cart = new Entity.Cart();
            }
            String product_id = request.getParameter("product_id");
            cart.removeItem(product_id);
            List<Item> list = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalMoney());
            session.setAttribute("totalfinal", cart.getTotalMoney() + 30000);
            session.setAttribute("size", list.size());
            response.sendRedirect("cart.jsp");
        }
        if (action.equalsIgnoreCase("checkcode")) {
            HttpSession sesstion = request.getSession();
            String code = request.getParameter("code");
            String mess = "Code invalid!";
            billDAO dao = new billDAO();
            double total = (double) sesstion.getAttribute("total");
            int disc = 0;
            List<DiscountCode> list = dao.getCode();
            double discountTotal = total + 30000;
            for (DiscountCode dis : list) {
                if (dis.getCode().equals(code)) {
                    discountTotal = (total + 30000) * (100 - dis.getDiscount()) / 100;
                    mess = "Discount " +dis.getDiscount() +"%";
                    disc = dis.getDiscount();
                }
            }
            sesstion.setAttribute("totalfinal", discountTotal);
            sesstion.setAttribute("disc", disc);
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
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
