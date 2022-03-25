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
import model.friend;
import model.userInformation;

public class acceptFriend extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(true);
        account a = (account) session.getAttribute("AccLogin");
        dao d = new dao();

        String idFunction = request.getParameter("id");
        if (idFunction.equals("1")) {
            String userID2 = request.getParameter("userid");
            boolean checkAccept = d.processPaticipant(a.getUserId(), userID2, "1");
            if (checkAccept) {
                d.processPaticipant(userID2, a.getUserId(), "1");
                String notiID = d.createNotificationID();
                userInformation you = d.getUserInfo(a.getUserId());
                String message = you.getFirstName()+ " đã đồng ý lời mời kết bạn của bạn!";
                d.createNotification(notiID, userID2,a.getUserId(), message, "getUserInfor?userID=" + a.getUserId(), "fa fa-heart");
                out.println("<a href='#' title='Hủy bạn bè' data-toggle=\"tooltip\"><i class=\"fa fa-user-times\">");
            }
        }

        if (idFunction.equals("2")) {
            List<friend> listRequest = d.getListRequestByUser(a);
            session.setAttribute("listRequest", listRequest);
            session.setAttribute("numOfRequest", listRequest.size());
            out.println(listRequest.size());
        }

        if (idFunction.equals("3")) {
            List<friend> listRequest = d.getListRequestByUser(a);
            for (friend r : listRequest) {
                if (r.getAvatar() == null) {
                    out.println("<li>\n"
                            + "<div>\n"
                            + "<figure>\n"
                            + "         <img style=\"height: 40px\" src=\"images/avatardefault.png\" alt=\"\">\n"
                            + "		</figure>\n"
                            + "		<div class=\"mesg-meta\">\n"
                            + "		<h6><a href=\"getUserInfor?userID=" + r.getFriendId() + "\" title=\"\">" + r.getFullname() + "</a></h6>\n"
                            + "		<span><b>Amy</b> is mutule friend</span>\n"
                            + "		<i>yesterday</i>\n"
                            + "		</div>\n"
                            + "		<div class=\"add-del-friends\">\n"
                            + "		<a href=\"#\" title=\"\"><i class=\"fa fa-heart\"></i></a>\n"
                            + "		<a href=\"#\" title=\"\"><i class=\"fa fa-trash\"></i></a>\n"
                            + "		</div>\n"
                            + "	</div>	\n"
                            + "</li>");
                }else{
                    out.println("<li>\n"
                            + "<div>\n"
                            + "<figure>\n"
                            + "         <img style=\"height: 40px\" src=\"images/avatardefault.png\" alt=\"\">\n"
                            + "		</figure>\n"
                            + "		<div class=\"mesg-meta\">\n"
                            + "		<h6><a href=\"getUserInfor?userID=" + r.getFriendId() + "\" title=\"\">" + r.getFullname() + "</a></h6>\n"
                            + "		<span><b>Amy</b> is mutule friend</span>\n"
                            + "		<i>yesterday</i>\n"
                            + "		</div>\n"
                            + "		<div class=\"add-del-friends\">\n"
                            + "		<a href=\"#\" title=\"\"><i class=\"fa fa-heart\"></i></a>\n"
                            + "		<a href=\"#\" title=\"\"><i class=\"fa fa-trash\"></i></a>\n"
                            + "		</div>\n"
                            + "	</div>	\n"
                            + "</li>");
                }
            }
        }

        if (idFunction.equals("4")) {
            List<friend> listRequest = d.getListRequestByUser(a);
            out.println(listRequest.size() + " yêu cầu mới <a href=\"#\" title=\"\">Xem tất cả</a>");
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
