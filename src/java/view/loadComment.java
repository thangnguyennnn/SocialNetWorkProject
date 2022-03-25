/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import DAO.dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Comment;

/**
 *
 * @author HP
 */
public class loadComment extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //Servlet nay load comment ra bang ajax ko phai load lai trang
        dao d = new dao();

        //1. Lay du lieu add comment truoc
        String postID = request.getParameter("postID");
        String userID = request.getParameter("userID");
        String detail = request.getParameter("detail");

        d.addCommentToPost(postID, userID, detail); 
        String content = "Bạn có một bình luận mới!";
        String ID = d.createNotificationID();
        String host = d.getHostByPostID(postID);
        List<String> listCare = d.getListCarePost(postID, host);
        if (!host.equals(userID)) {
            d.createNotification(ID, host, userID, content, "loadPostDetailPage?postID=" + postID, "fa fa-comment");
        }
        for (String u : listCare) {
            if (!u.equals(userID)) {
                d.createNotification(d.createNotificationID(), u, userID, "Bài viết bạn quan tâm có một bình luận mới!", "loadPostDetailPage?postID=" + postID, "fa fa-comment");
            } 
        }

        //2. Sau khi add comment thanh cong, load lai ajax
        Comment c = d.getLastestComment(postID);

        PrintWriter out = response.getWriter();

        out.println("<li>"
                + "<div class=\"comet-avatar\">"
                + "     <img alt=\"\" src=\"" + c.getUserAvatar() + "\">"
                + "</div>"
                + "<div class=\"we-comment\">"
                + "     <h5><a title=\"\" href=\"time-line.html\">" + c.getFullName() + "</a></h5>"
                + "     <p>" + c.getDetail() + "</p>"
                + "     <div class=\"inline-itms\"><span>" + c.getUnitTime().getCountTime() + " " + c.getUnitTime().getUnit() + "trước</span><a title=\"Reply\" href=\"#\" class=\"we-reply\"><i class=\"fa fa-reply\"></i></a><a title=\"\" href=\"#\"><i class=\"fa fa-heart\"></i></a>"
                + "     </div>"
                + "</div>"
                + "</li>");
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
