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
import model.datingDetail;
import model.notification;

/**
 *
 * @author HP
 */
public class notificateDating extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();

        account a = (account) session.getAttribute("AccLogin");
        dao d = new dao();
        String userID2 = request.getParameter("userid");

        if (d.checkDatingMatch(userID2, a.getUserId())) {
            datingDetail detail1 = d.getDatingDetail(userID2);
            datingDetail detail2 = d.getDatingDetail(a.getUserId());
            String message1 = "Bạn và " + detail1.getName() + " đã được se duyên!";
            String message2 = "Bạn và " + detail2.getName() + " đã được se duyên!";
            String notiID1 = d.createNotificationID();
            String notiID2 = d.createNotificationID();
            d.createNotification(notiID1, a.getUserId(), userID2, message1, "loadDatingDetail?userID=" + userID2 + "&notiID=" + notiID1, "fa fa-heart");
            d.createNotification(notiID2, userID2, a.getUserId(), message2, "loadDatingDetail?userID=" + a.getUserId() + "&notiID=" + notiID2, "fa fa-heart");
            List<notification> listNoti = d.getNotification(a.getUserId(), 5);
            List<notification> listNotiNum = d.getUnreadNotification(a.getUserId());

            session.setAttribute("noti", listNoti);
            session.setAttribute("notiNum", listNotiNum.size());

            for (notification o : listNoti) {
                if ((o.getAvatar() == null || o.getAvatar().equals("")) && o.getStatus().equals("1")) {
                    out.println("<li>\n"
                            + "      <a href=\"" + o.getLink() + "\" title=\"\">\n"
                            + "           <figure>\n"
                            + "                <img class=\"fiximg\" src=\"images/avatardefault.png\">\n"
                            + "                <span class=\"status f-online\"></span>\n"
                            + "           </figure>\n"
                            + "           <div class=\"mesg-meta\">\n"
                            + "                <h6>" + o.getName() + "</h6>\n"
                            + "                    <span style=\"max-width: 100%; color: #fa6342;\">" + o.getMessage() + "</span>\n"
                            + "                    <span><i style=\"color: #fa6342; font-size: 13px;\" class=\"" + o.getIcon() + "\"></i> " + o.getDate() + "</span>\n"
                            + "           </div>\n"
                            + "      </a>\n"
                            + " </li>");
                } else if ((o.getAvatar() == null || o.getAvatar().equals("")) && o.getStatus().equals("0")) {
                    out.println("<li>\n"
                            + "      <a href=\"" + o.getLink() + "\" title=\"\">\n"
                            + "           <figure>\n"
                            + "                <img class=\"fiximg\" src=\"images/avatardefault.png\">\n"
                            + "                <span class=\"status f-online\"></span>\n"
                            + "           </figure>\n"
                            + "           <div class=\"mesg-meta\">\n"
                            + "                <h6>" + o.getName() + "</h6>\n"
                            + "                    <span style=\"max-width: 100%;\">" + o.getMessage() + "</span>\n"
                            + "                    <span><i style=\"color: #7580a2; font-size: 13px;\" class=\"" + o.getIcon() + "\"></i> " + o.getDate() + "</span>\n"
                            + "           </div>\n"
                            + "      </a>\n"
                            + " </li>");
                } else if ((o.getAvatar() != null && !o.getAvatar().equals("")) && o.getStatus().equals("1")) {
                    out.println("<li>\n"
                            + "      <a href=\"" + o.getLink() + "\" title=\"\">\n"
                            + "           <figure>\n"
                            + "                <img class=\"fiximg\" src=\"userPhoto/" + o.getdelivererID() + "/avatar/" + o.getAvatar() + "\" alt=\"\">\n"
                            + "                <span class=\"status f-online\"></span>\n"
                            + "           </figure>\n"
                            + "           <div class=\"mesg-meta\">\n"
                            + "                <h6>" + o.getName() + "</h6>\n"
                            + "                    <span style=\"max-width: 100%; color: #fa6342;\">" + o.getMessage() + "</span>\n"
                            + "                    <span><i style=\"color: #fa6342; font-size: 13px;\" class=\"" + o.getIcon() + "\"></i> " + o.getDate() + "</span>\n"
                            + "           </div>\n"
                            + "      </a>\n"
                            + " </li>");
                } else {
                    out.println("<li>\n"
                            + "      <a href=\"" + o.getLink() + "\" title=\"\">\n"
                            + "           <figure>\n"
                            + "                <img class=\"fiximg\" src=\"userPhoto/" + o.getdelivererID() + "/avatar/" + o.getAvatar() + "\" alt=\"\">\n"
                            + "                <span class=\"status f-online\"></span>\n"
                            + "           </figure>\n"
                            + "           <div class=\"mesg-meta\">\n"
                            + "                <h6>" + o.getName() + "</h6>\n"
                            + "                    <span style=\"max-width: 100%;\">" + o.getMessage() + "</span>\n"
                            + "                    <span><i style=\"color: #7580a2; font-size: 13px;\" class=\"" + o.getIcon() + "\"></i> " + o.getDate() + "</span>\n"
                            + "           </div>\n"
                            + "      </a>\n"
                            + " </li>");
                }
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
