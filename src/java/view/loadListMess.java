package view;

import DAO.dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.account;
import model.containerChat;
import model.friend;
import model.userInformation;

public class loadListMess extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        account a = (account) session.getAttribute("AccLogin");
        PrintWriter out = response.getWriter();
        dao d = new dao();
        userInformation user = d.getUserInfo(a.getUserId());
        List<userInformation> listConver = d.getListFriendContacYet(a.getUserId());
        List<containerChat> listChat = new ArrayList<>();
        for (userInformation i : listConver) {
            containerChat cc = d.getConverByUser(user, i);
            listChat.add(cc);
        }
        Collections.sort(listChat, new Comparator<containerChat>() {
            @Override
            public int compare(containerChat c1, containerChat c2) {
                if(c1.getC().getCountTime().getTotalSecond() > c2.getC().getCountTime().getTotalSecond()){
                    return 1;
                }
                if(c1.getC().getCountTime().getTotalSecond() < c2.getC().getCountTime().getTotalSecond()){
                    return -1;
                }
                if(c1.getC().getCountTime().getTotalSecond() == c2.getC().getCountTime().getTotalSecond()){
                    return 0;
                }
                return 0;
            }
        });
        List<friend> listFriend = d.getListFriendNotContacYet(a.getUserId());
        for (containerChat c : listChat) {
            if (c.getC().getSenderID().equals(a.getUserId())) {
                if (c.getC().getIsActive().equals("1")) {
                    out.println("<li class=\"nav-item\">\n"
                            + "                                                        <a class=\"\" href=\"#u" + c.getU().getUserId() + "\" onclick=\"showMessage('" + c.getC().getConverID() + "', '" + c.getU().getUserId() + "');\" data-toggle=\"tab\">\n"
                            + "                                                            <figure><img src=\"userPhoto/" + c.getU().getUserId() + "/avatar/" + c.getU().getAvatar() + "\" alt=\"\">\n"
                            + "                                                                <span class=\"status f-online\"></span>\n"
                            + "                                                            </figure>\n"
                            + "                                                            <div class=\"user-name\">\n"
                            + "                                                                <h6 class=\"\">" + c.getU().getLastName()+ " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "</h6>\n"
                            + "                                                                <span class=\"editp\">" + c.getC().getSenderName() + ": " + c.getC().getNewMessage() + "</span><span>"+c.getC().getCountTime().getCountTime()+" "+ c.getC().getCountTime().getUnit() +" trước"+"</span>\n"
                            + "                                                            </div>\n"
                            + "                                                            <div class=\"more\">\n"
                            + "                                                                <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                            + "                                                                    <ul>\n"
                            + "                                                                        <li><i class=\"fa fa-bell-slash-o\"></i>Mute</li>\n"
                            + "                                                                        <li><i class=\"ti-trash\"></i>Delete</li>\n"
                            + "                                                                        <li><i class=\"fa fa-folder-open-o\"></i>Archive</li>\n"
                            + "                                                                        <li><i class=\"fa fa-ban\"></i>Block</li>\n"
                            + "                                                                        <li><i class=\"fa fa-eye-slash\"></i>Ignore Message</li>\n"
                            + "                                                                        <li><i class=\"fa fa-envelope\"></i>Mark Unread</li>\n"
                            + "                                                                    </ul>\n"
                            + "                                                                </div>\n"
                            + "                                                            </div>\n"
                            + "                                                        </a>\n"
                            + "                                                    </li>");
                } else {
                    out.println("<li class=\"nav-item\">\n"
                            + "                                                        <a class=\"\" href=\"#u" + c.getU().getUserId() + "\" onclick=\"showMessage('" + c.getC().getConverID() + "', '" + c.getU().getUserId() + "');\" data-toggle=\"tab\">\n"
                            + "                                                            <figure><img src=\"userPhoto/" + c.getU().getUserId() + "/avatar/" + c.getU().getAvatar() + "\" alt=\"\">\n"
                            + "                                                                <span class=\"status f-offline\"></span>\n"
                            + "                                                            </figure>\n"
                            + "                                                            <div class=\"user-name\">\n"
                            + "                                                                <h6 class=\"\">" + c.getU().getLastName()+ " " + c.getU().getMiddleName() + " " + c.getU().getFirstName()+ "</h6>\n"
                            + "                                                                <span class=\"editp\">" + c.getC().getSenderName() + ": " + c.getC().getNewMessage() + "</span><span>"+c.getC().getCountTime().getCountTime()+" "+ c.getC().getCountTime().getUnit() +" trước"+"</span>\n"
                            + "                                                            </div>\n"
                            + "                                                            <div class=\"more\">\n"
                            + "                                                                <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                            + "                                                                    <ul>\n"
                            + "                                                                        <li><i class=\"fa fa-bell-slash-o\"></i>Mute</li>\n"
                            + "                                                                        <li><i class=\"ti-trash\"></i>Delete</li>\n"
                            + "                                                                        <li><i class=\"fa fa-folder-open-o\"></i>Archive</li>\n"
                            + "                                                                        <li><i class=\"fa fa-ban\"></i>Block</li>\n"
                            + "                                                                        <li><i class=\"fa fa-eye-slash\"></i>Ignore Message</li>\n"
                            + "                                                                        <li><i class=\"fa fa-envelope\"></i>Mark Unread</li>\n"
                            + "                                                                    </ul>\n"
                            + "                                                                </div>\n"
                            + "                                                            </div>\n"
                            + "                                                        </a>\n"
                            + "                                                    </li>");
                }
            } else {
                if (c.getC().getIsActive().equals("1")) {
                    if (c.getC().getReaded().equals("2")) {
                        out.println("<li class=\"nav-item unread\">\n"
                                + "                                                        <a class=\"\" href=\"#u" + c.getU().getUserId() + "\" onclick=\"showMessage('" + c.getC().getConverID() + "', '" + c.getU().getUserId() + "');readMessage('" + c.getC().getConverID() + "');\" data-toggle=\"tab\">\n"
                                + "                                                            <figure><img src=\"userPhoto/" + c.getU().getUserId() + "/avatar/" + c.getU().getAvatar() + "\" alt=\"\">\n"
                                + "                                                                <span class=\"status f-online\"></span>\n"
                                + "                                                            </figure>\n"
                                + "                                                            <div class=\"user-name\">\n"
                                + "                                                                <h6 class=\"\">" + c.getU().getLastName()+ " " + c.getU().getMiddleName() + " " + c.getU().getFirstName()+ "</h6>\n"
                                + "                                                                <span class=\"editp\">" + c.getC().getSenderName() + ": " + c.getC().getNewMessage() + "</span><span>"+c.getC().getCountTime().getCountTime()+" "+ c.getC().getCountTime().getUnit() +" trước"+"</span>\n"
                                + "                                                            </div>\n"
                                + "                                                            <div class=\"more\">\n"
                                + "                                                                <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                                + "                                                                    <ul>\n"
                                + "                                                                        <li><i class=\"fa fa-bell-slash-o\"></i>Mute</li>\n"
                                + "                                                                        <li><i class=\"ti-trash\"></i>Delete</li>\n"
                                + "                                                                        <li><i class=\"fa fa-folder-open-o\"></i>Archive</li>\n"
                                + "                                                                        <li><i class=\"fa fa-ban\"></i>Block</li>\n"
                                + "                                                                        <li><i class=\"fa fa-eye-slash\"></i>Ignore Message</li>\n"
                                + "                                                                        <li><i class=\"fa fa-envelope\"></i>Mark Unread</li>\n"
                                + "                                                                    </ul>\n"
                                + "                                                                </div>\n"
                                + "                                                            </div>\n"
                                + "                                                        </a>\n"
                                + "                                                    </li>");
                    } else {
                        out.println("<li class=\"nav-item\">\n"
                                + "                                                        <a class=\"\" href=\"#u" + c.getU().getUserId() + "\" onclick=\"showMessage('" + c.getC().getConverID() + "', '" + c.getU().getUserId() + "');readMessage('" + c.getC().getConverID() + "');\" data-toggle=\"tab\">\n"
                                + "                                                            <figure><img src=\"userPhoto/" + c.getU().getUserId() + "/avatar/" + c.getU().getAvatar() + "\" alt=\"\">\n"
                                + "                                                                <span class=\"status f-online\"></span>\n"
                                + "                                                            </figure>\n"
                                + "                                                            <div class=\"user-name\">\n"
                                + "                                                                <h6 class=\"\">" + c.getU().getLastName()+ " " + c.getU().getMiddleName() + " " + c.getU().getFirstName()+ "</h6>\n"
                                + "                                                                <span class=\"editp\">" + c.getC().getSenderName() + ": " + c.getC().getNewMessage() + "</span><span>"+c.getC().getCountTime().getCountTime()+" "+ c.getC().getCountTime().getUnit() +" trước"+"</span>\n"
                                + "                                                            </div>\n"
                                + "                                                            <div class=\"more\">\n"
                                + "                                                                <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                                + "                                                                    <ul>\n"
                                + "                                                                        <li><i class=\"fa fa-bell-slash-o\"></i>Mute</li>\n"
                                + "                                                                        <li><i class=\"ti-trash\"></i>Delete</li>\n"
                                + "                                                                        <li><i class=\"fa fa-folder-open-o\"></i>Archive</li>\n"
                                + "                                                                        <li><i class=\"fa fa-ban\"></i>Block</li>\n"
                                + "                                                                        <li><i class=\"fa fa-eye-slash\"></i>Ignore Message</li>\n"
                                + "                                                                        <li><i class=\"fa fa-envelope\"></i>Mark Unread</li>\n"
                                + "                                                                    </ul>\n"
                                + "                                                                </div>\n"
                                + "                                                            </div>\n"
                                + "                                                        </a>\n"
                                + "                                                    </li>");
                    }
                } else {
                    if (c.getC().getReaded().equals("2")) {
                        out.println("<li class=\"nav-item unread\">\n"
                                + "                                                        <a class=\"\" href=\"#u" + c.getU().getUserId() + "\" onclick=\"showMessage('" + c.getC().getConverID() + "', '" + c.getU().getUserId() + "');readMessage('" + c.getC().getConverID() + "');\" data-toggle=\"tab\">\n"
                                + "                                                            <figure><img src=\"userPhoto/" + c.getU().getUserId() + "/avatar/" + c.getU().getAvatar() + "\" alt=\"\">\n"
                                + "                                                                <span class=\"status f-offline\"></span>\n"
                                + "                                                            </figure>\n"
                                + "                                                            <div class=\"user-name\">\n"
                                + "                                                                <h6 class=\"\">" + c.getU().getLastName()+ " " + c.getU().getMiddleName() + " " + c.getU().getFirstName()+ "</h6>\n"
                                + "                                                                <span class=\"editp\">" + c.getC().getSenderName() + ": " + c.getC().getNewMessage() + "</span><span>"+c.getC().getCountTime().getCountTime()+" "+ c.getC().getCountTime().getUnit() +" trước"+"</span>\n"
                                + "                                                            </div>\n"
                                + "                                                            <div class=\"more\">\n"
                                + "                                                                <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                                + "                                                                    <ul>\n"
                                + "                                                                        <li><i class=\"fa fa-bell-slash-o\"></i>Mute</li>\n"
                                + "                                                                        <li><i class=\"ti-trash\"></i>Delete</li>\n"
                                + "                                                                        <li><i class=\"fa fa-folder-open-o\"></i>Archive</li>\n"
                                + "                                                                        <li><i class=\"fa fa-ban\"></i>Block</li>\n"
                                + "                                                                        <li><i class=\"fa fa-eye-slash\"></i>Ignore Message</li>\n"
                                + "                                                                        <li><i class=\"fa fa-envelope\"></i>Mark Unread</li>\n"
                                + "                                                                    </ul>\n"
                                + "                                                                </div>\n"
                                + "                                                            </div>\n"
                                + "                                                        </a>\n"
                                + "                                                    </li>");
                    } else {
                        out.println("<li class=\"nav-item\">\n"
                                + "                                                        <a class=\"\" href=\"#u" + c.getU().getUserId() + "\" onclick=\"showMessage('" + c.getC().getConverID() + "', '" + c.getU().getUserId() + "');readMessage('" + c.getC().getConverID() + "');\" data-toggle=\"tab\">\n"
                                + "                                                            <figure><img src=\"userPhoto/" + c.getU().getUserId() + "/avatar/" + c.getU().getAvatar() + "\" alt=\"\">\n"
                                + "                                                                <span class=\"status f-offline\"></span>\n"
                                + "                                                            </figure>\n"
                                + "                                                            <div class=\"user-name\">\n"
                                + "                                                                <h6 class=\"\">" + c.getU().getLastName()+ " " + c.getU().getMiddleName() + " " + c.getU().getFirstName()+ "</h6>\n"
                                + "                                                                <span class=\"editp\">" + c.getC().getSenderName() + ": " + c.getC().getNewMessage() + "</span><span>"+c.getC().getCountTime().getCountTime()+" "+ c.getC().getCountTime().getUnit() +" trước"+"</span>\n"
                                + "                                                            </div>\n"
                                + "                                                            <div class=\"more\">\n"
                                + "                                                                <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                                + "                                                                    <ul>\n"
                                + "                                                                        <li><i class=\"fa fa-bell-slash-o\"></i>Mute</li>\n"
                                + "                                                                        <li><i class=\"ti-trash\"></i>Delete</li>\n"
                                + "                                                                        <li><i class=\"fa fa-folder-open-o\"></i>Archive</li>\n"
                                + "                                                                        <li><i class=\"fa fa-ban\"></i>Block</li>\n"
                                + "                                                                        <li><i class=\"fa fa-eye-slash\"></i>Ignore Message</li>\n"
                                + "                                                                        <li><i class=\"fa fa-envelope\"></i>Mark Unread</li>\n"
                                + "                                                                    </ul>\n"
                                + "                                                                </div>\n"
                                + "                                                            </div>\n"
                                + "                                                        </a>\n"
                                + "                                                    </li>");
                    }
                }
            }
        }
        for (friend f : listFriend) {
            if (f.getActive() == 1) {
                out.println("<li class=\"nav-item\">\n"
                        + "                                                    <a class=\"\" onclick=\"\" href=\"#u" + f.getFriendId() + "\" data-toggle=\"tab\">\n"
                        + "                                                        <figure><img src=\"userPhoto/" + f.getFriendId() + "/avatar/" + f.getAvatar() + "\" alt=\"\">\n"
                        + "                                                            <span class=\"status f-online\"></span>\n"
                        + "                                                        </figure>\n"
                        + "                                                        <div class=\"user-name\">\n"
                        + "                                                            <h6 class=\"unread\">" + f.getFullname() + "</h6>\n"
                        + "                                                            <span>Hãy bắt đầu nhắn tin với " + f.getFullname() + "</span>\n"
                        + "                                                        </div>\n"
                        + "                                                        <div class=\"more\">\n"
                        + "                                                            <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                        + "                                                                <ul>\n"
                        + "                                                                    <li><i class=\"fa fa-bell-slash-o\"></i>Mute</li>\n"
                        + "                                                                    <li><i class=\"ti-trash\"></i>Delete</li>\n"
                        + "                                                                    <li><i class=\"fa fa-folder-open-o\"></i>Archive</li>\n"
                        + "                                                                    <li><i class=\"fa fa-ban\"></i>Block</li>\n"
                        + "                                                                    <li><i class=\"fa fa-eye-slash\"></i>Ignore Message</li>\n"
                        + "                                                                    <li><i class=\"fa fa-envelope\"></i>Mark Unread</li>\n"
                        + "                                                                </ul>\n"
                        + "                                                            </div>\n"
                        + "                                                        </div>\n"
                        + "                                                    </a>\n"
                        + "                                                </li>");
            }else{
                out.println("<li class=\"nav-item\">\n"
                        + "                                                    <a class=\"\" onclick=\"\" href=\"#u" + f.getFriendId() + "\" data-toggle=\"tab\">\n"
                        + "                                                        <figure><img src=\"userPhoto/" + f.getFriendId() + "/avatar/" + f.getAvatar() + "\" alt=\"\">\n"
                        + "                                                            <span class=\"status f-offline\"></span>\n"
                        + "                                                        </figure>\n"
                        + "                                                        <div class=\"user-name\">\n"
                        + "                                                            <h6 class=\"unread\">" + f.getFullname() + "</h6>\n"
                        + "                                                            <span>Hãy bắt đầu nhắn tin với " + f.getFullname() + "</span>\n"
                        + "                                                        </div>\n"
                        + "                                                        <div class=\"more\">\n"
                        + "                                                            <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                        + "                                                                <ul>\n"
                        + "                                                                    <li><i class=\"fa fa-bell-slash-o\"></i>Mute</li>\n"
                        + "                                                                    <li><i class=\"ti-trash\"></i>Delete</li>\n"
                        + "                                                                    <li><i class=\"fa fa-folder-open-o\"></i>Archive</li>\n"
                        + "                                                                    <li><i class=\"fa fa-ban\"></i>Block</li>\n"
                        + "                                                                    <li><i class=\"fa fa-eye-slash\"></i>Ignore Message</li>\n"
                        + "                                                                    <li><i class=\"fa fa-envelope\"></i>Mark Unread</li>\n"
                        + "                                                                </ul>\n"
                        + "                                                            </div>\n"
                        + "                                                        </div>\n"
                        + "                                                    </a>\n"
                        + "                                                </li>");
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
