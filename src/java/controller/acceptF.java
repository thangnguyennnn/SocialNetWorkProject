package controller;

import DAO.dao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.account;
import model.userInformation;

public class acceptF extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        account a = (account) session.getAttribute("AccLogin");
        dao d = new dao();
        String userID2 = request.getParameter("id");
        PrintWriter out = response.getWriter();
        boolean checkAccept = d.processPaticipant(a.getUserId(), userID2, "1");
        if (checkAccept) {
            d.processPaticipant(userID2, a.getUserId(), "1");
            String notiID = d.createNotificationID();
            userInformation you = d.getUserInfo(a.getUserId());
            String message = you.getFirstName() + " đã đồng ý lời mời kết bạn của bạn!";
            d.createNotification(notiID, userID2, a.getUserId(), message, "getUserInfor?userID=" + a.getUserId(), "fa fa-heart");
            out.println("Đã là bạn bè.");
        }else{
            out.println("Vui lòng thử lại!");
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
