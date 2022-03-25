package controller;

import DAO.dao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Post;
import model.account;

public class deletePost extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String postID = request.getParameter("postID");
        account a = (account) request.getSession().getAttribute("AccLogin");
        dao d = new dao();

        if (a.getRole().equals("1")) {
            String reason = request.getSession().getAttribute("reason") + "";
            String message = "Bài viết của bạn đã bị xóa vì bị báo cáo là: " + reason;
            String link = "loadNotificationPage";
            String icon = "fa fa-trash";
            String notiID = d.createNotificationID();
            Post p = d.getPostByID(postID);

            d.createNotification(notiID, p.getUserID(), a.getUserId(), message, link, icon);
            d.deleteReport(d.getReportID(postID));
            
        }

        d.deleteLikeOfPost(postID);
        d.deleteCmtOfPost(postID);
        d.deleteRelaFile(postID);
        d.deletePost(postID);
        if (a.getRole().equals("1")) {
            request.getRequestDispatcher("loadReportPage").forward(request, response);
        } else {
            request.getRequestDispatcher("getUserInfor?userID=" + a.getUserId()).forward(request, response);
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
