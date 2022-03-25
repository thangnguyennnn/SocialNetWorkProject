package controller;

import DAO.dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.account;
import model.notification;

public class taskWithNotification extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();

        account a = (account) session.getAttribute("AccLogin");
        dao d = new dao();
        String notiID = request.getParameter("notiid");
        String index = request.getParameter("index");

        if (index.equals("1")) {
            d.updateNotificationStatus("1", notiID);
        }
        if (index.equals("2")) {
            d.deleteNotification(notiID);
        }
        if (index.equals("3")) {
            List<notification> listA = d.getUnreadNotification(a.getUserId());
            for (notification object : listA) {
                d.updateNotificationStatus("0", object.getNotiID());
            }
        }
        List<notification> listB = d.getNotification(a.getUserId(), 100);
        for (notification o : listB) {
            if ((o.getAvatar() == null || o.getAvatar().equals("")) && o.getStatus().equals("1")) {
                out.println("<li>\n"
                        + "      <a href=\"" + o.getLink() + "\" title=\"\">\n"
                        + "           <figure>\n"
                        + "                 <img class=\"fiximg\" src=\"images/avatardefault.png\">\n"
                        + "           </figure>\n"
                        + "           <div class=\"notifi-meta\">\n"
                        + "                 <p style=\"color: #fa6342;\">" + o.getMessage() + "</p>\n"
                        + "                 <span><i class=\"" + o.getIcon() + "\"></i> " + o.getDate() + "</span>\n"
                        + "           </div>\n"
                        + "      </a>\n"
                        + "      <div class=\"more\">\n"
                        + "           <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                        + "                 <ul>\n"
                        + "                       <li onclick=\"taskNoti('" + o.getNotiID() + "', '1')\"><i class=\"fa fa-bell-o\"></i>Đánh dấu là chưa đọc</li>\n"
                        + "                       <li onclick=\"taskNoti('" + o.getNotiID() + "', '2')\"><i class=\"fa fa-trash-o\"></i>Gỡ thông báo này</li>\n"
                        + "                 </ul>\n"
                        + "           </div>\n"
                        + "      </div>\n"
                        + "</li>");
            } else if ((o.getAvatar() == null || o.getAvatar().equals("")) && o.getStatus().equals("0")) {
                out.println("<li>\n"
                        + "      <a href=\"" + o.getLink() + "\" title=\"\">\n"
                        + "           <figure>\n"
                        + "                 <img class=\"fiximg\" src=\"images/avatardefault.png\">\n"
                        + "           </figure>\n"
                        + "           <div class=\"notifi-meta\">\n"
                        + "                 <p>" + o.getMessage() + "</p>\n"
                        + "                 <span><i class=\"" + o.getIcon() + "\"></i> " + o.getDate() + "</span>\n"
                        + "           </div>\n"
                        + "      </a>\n"
                        + "      <div class=\"more\">\n"
                        + "           <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                        + "                 <ul>\n"
                        + "                       <li onclick=\"taskNoti('" + o.getNotiID() + "', '1')\"><i class=\"fa fa-bell-o\"></i>Đánh dấu là chưa đọc</li>\n"
                        + "                       <li onclick=\"taskNoti('" + o.getNotiID() + "', '2')\"><i class=\"fa fa-trash-o\"></i>Gỡ thông báo này</li>\n"
                        + "                 </ul>\n"
                        + "           </div>\n"
                        + "      </div>\n"
                        + "</li>");
            } else if ((o.getAvatar() != null && !o.getAvatar().equals("")) && o.getStatus().equals("1")) {
                out.println("<li>\n"
                        + "      <a href=\"" + o.getLink() + "\" title=\"\">\n"
                        + "           <figure>\n"
                        + "                 <img class=\"fiximg\" src=\"userPhoto/" + o.getdelivererID() + "/avatar/" + o.getAvatar() + "\" alt=\"\">\n"
                        + "           </figure>\n"
                        + "           <div class=\"notifi-meta\">\n"
                        + "                 <p style=\"color: #fa6342;\">" + o.getMessage() + "</p>\n"
                        + "                 <span><i class=\"" + o.getIcon() + "\"></i> " + o.getDate() + "</span>\n"
                        + "           </div>\n"
                        + "      </a>\n"
                        + "      <div class=\"more\">\n"
                        + "           <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                        + "                 <ul>\n"
                        + "                       <li onclick=\"taskNoti('" + o.getNotiID() + "', '1')\"><i class=\"fa fa-bell-o\"></i>Đánh dấu là chưa đọc</li>\n"
                        + "                       <li onclick=\"taskNoti('" + o.getNotiID() + "', '2')\"><i class=\"fa fa-trash-o\"></i>Gỡ thông báo này</li>\n"
                        + "                 </ul>\n"
                        + "           </div>\n"
                        + "      </div>\n"
                        + "</li>");
            } else {
                out.println("<li>\n"
                        + "      <a href=\"" + o.getLink() + "\" title=\"\">\n"
                        + "           <figure>\n"
                        + "                 <img class=\"fiximg\" src=\"userPhoto/" + o.getdelivererID() + "/avatar/" + o.getAvatar() + "\" alt=\"\">\n"
                        + "           </figure>\n"
                        + "           <div class=\"notifi-meta\">\n"
                        + "                 <p>" + o.getMessage() + "</p>\n"
                        + "                 <span><i class=\"" + o.getIcon() + "\"></i> " + o.getDate() + "</span>\n"
                        + "           </div>\n"
                        + "      </a>\n"
                        + "      <div class=\"more\">\n"
                        + "           <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                        + "                 <ul>\n"
                        + "                       <li onclick=\"taskNoti('" + o.getNotiID() + "', '1')\"><i class=\"fa fa-bell-o\"></i>Đánh dấu là chưa đọc</li>\n"
                        + "                       <li onclick=\"taskNoti('" + o.getNotiID() + "', '2')\"><i class=\"fa fa-trash-o\"></i>Gỡ thông báo này</li>\n"
                        + "                 </ul>\n"
                        + "           </div>\n"
                        + "      </div>\n"
                        + "</li>");
            }
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
