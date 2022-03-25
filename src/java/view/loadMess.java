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
import model.userInformation;

public class loadMess extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        dao d = new dao();
        account a = (account) session.getAttribute("AccLogin");
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
        session.setAttribute("listConer", listChat);
        for (containerChat c : listChat) {
            if (c.getC().getSenderID().equals(a.getUserId())) {
                if (c.getC().getIsActive().equals("1")) {
                    if (c.getC().getReaded().equals("2")) {
                        out.println("<li>\n"
                                + "                                    <a class=\"show-mesg\" href=\"#\" title=\"\" onclick=\"showBox2('" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "'); loadMessage2('" + c.getU().getUserId() + "')\">\n"
                                + "                                        <figure>\n"
                                + "                                            <img class=\"imgst\" src=\"userPhoto/" + c.getU().getUserId() + "/avatar/" + c.getU().getAvatar() + "\" alt=\"\">\n"
                                + "                                            <span class=\"status f-online\"></span>\n"
                                + "                                        </figure>\n"
                                + "                                        <div class=\"mesg-meta\">\n"
                                + "                                            <h6>" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "</h6>\n"
                                + "                                            <span class=\"editp\">" + c.getC().getSenderName() + ": " + c.getC().getNewMessage() + "</span>\n"
                                + "                                            <i>"+c.getC().getCountTime().getCountTime()+" "+ c.getC().getCountTime().getUnit() +" trước"+"</i>\n"
                                + "                                        </div>\n"
                                + "                                    </a>\n"
                                + "                                </li>");
                    }else{
                        out.println("<li>\n"
                                + "                                    <a class=\"show-mesg\" href=\"#\" title=\"\" onclick=\"showBox2('" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "'); loadMessage2('" + c.getU().getUserId() + "')\">\n"
                                + "                                        <figure>\n"
                                + "                                            <img class=\"imgst\" src=\"userPhoto/" + c.getU().getUserId() + "/avatar/" + c.getU().getAvatar() + "\" alt=\"\">\n"
                                + "                                            <span class=\"status f-online\"></span>\n"
                                + "                                        </figure>\n"
                                + "                                        <div class=\"mesg-meta\">\n"
                                + "                                            <h6>" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "</h6>\n"
                                + "                                            <span class=\"editp\"><i class=\"ti-check\"></i>" + c.getC().getSenderName() + ": " + c.getC().getNewMessage() + "</span>\n"
                                + "                                            <i>"+c.getC().getCountTime().getCountTime()+" "+ c.getC().getCountTime().getUnit() +" trước"+"</i>\n"
                                + "                                        </div>\n"
                                + "                                    </a>\n"
                                + "                                </li>");
                    }
                } else {
                    out.println("<li>\n"
                            + "                                    <a class=\"show-mesg\" href=\"#\" title=\"\" onclick=\"showBox2('" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "'); loadMessage2('" + c.getU().getUserId() + "')\">\n"
                            + "                                        <figure>\n"
                            + "                                            <img class=\"imgst\" src=\"userPhoto/" + c.getU().getUserId() + "/avatar/" + c.getU().getAvatar() + "\" alt=\"\">\n"
                            + "                                            <span class=\"status f-offline\"></span>\n"
                            + "                                        </figure>\n"
                            + "                                        <div class=\"mesg-meta\">\n"
                            + "                                            <h6>" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "</h6>\n"
                            + "                                            <span class=\"editp\"><i></i>" + c.getC().getSenderName() + ": " + c.getC().getNewMessage() + "</span>\n"
                            + "                                            <i>"+c.getC().getCountTime().getCountTime()+" "+ c.getC().getCountTime().getUnit() +" trước"+"</i>\n"
                            + "                                        </div>\n"
                            + "                                    </a>\n"
                            + "                                </li>");
                }
            } else {
                if (c.getC().getIsActive().equals("1")) {
                    if (c.getC().getReaded().equals("2")) {
                        out.println("<li>\n"
                                + "                                    <a class=\"show-mesg\" href=\"#\" title=\"\" onclick=\"showBox2('" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "')\">\n"
                                + "                                        <figure>\n"
                                + "                                            <img class=\"imgst\" src=\"userPhoto/" + c.getU().getUserId() + "/avatar/" + c.getU().getAvatar() + "\" alt=\"\">\n"
                                + "                                            <span class=\"status f-online\"></span>\n"
                                + "                                        </figure>\n"
                                + "                                        <div class=\"mesg-meta\">\n"
                                + "                                            <h6>" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "</h6>\n"
                                + "                                            <span class=\"editp\" style=\"color: red\">" + c.getC().getSenderName() + ": " + c.getC().getNewMessage() + "</span>\n"
                                + "                                            <i>"+c.getC().getCountTime().getCountTime()+" "+ c.getC().getCountTime().getUnit() +" trước"+"</i>\n"
                                + "                                        </div>\n"
                                + "                                    </a>\n"
                                + "                                </li>");
                    } else {
                        out.println("<li>\n"
                                + "                                    <a class=\"show-mesg\" href=\"#\" title=\"\" onclick=\"showBox2('" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "')\">\n"
                                + "                                        <figure>\n"
                                + "                                            <img class=\"imgst\" src=\"userPhoto/" + c.getU().getUserId() + "/avatar/" + c.getU().getAvatar() + "\" alt=\"\">\n"
                                + "                                            <span class=\"status f-online\"></span>\n"
                                + "                                        </figure>\n"
                                + "                                        <div class=\"mesg-meta\">\n"
                                + "                                            <h6>" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "</h6>\n"
                                + "                                            <span class=\"editp\">" + c.getC().getSenderName() + ": " + c.getC().getNewMessage() + "</span>\n"
                                + "                                            <i>"+c.getC().getCountTime().getCountTime()+" "+ c.getC().getCountTime().getUnit() +" trước"+"</i>\n"
                                + "                                        </div>\n"
                                + "                                    </a>\n"
                                + "                                </li>");
                    }
                } else {
                    if (c.getC().getReaded().equals("2")) {
                        out.println("<li>\n"
                                + "                                    <a class=\"show-mesg\" href=\"#\" title=\"\" onclick=\"showBox2('" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "')\">\n"
                                + "                                        <figure>\n"
                                + "                                            <img class=\"imgst\" src=\"userPhoto/" + c.getU().getUserId() + "/avatar/" + c.getU().getAvatar() + "\" alt=\"\">\n"
                                + "                                            <span class=\"status f-offline\"></span>\n"
                                + "                                        </figure>\n"
                                + "                                        <div class=\"mesg-meta\">\n"
                                + "                                            <h6>" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "</h6>\n"
                                + "                                            <span class=\"editp\" style=\"color: red\">" + c.getC().getSenderName() + ": " + c.getC().getNewMessage() + "</span>\n"
                                + "                                            <i>"+c.getC().getCountTime().getCountTime()+" "+ c.getC().getCountTime().getUnit() +" trước"+"</i>\n"
                                + "                                        </div>\n"
                                + "                                    </a>\n"
                                + "                                </li>");
                    } else {
                        out.println("<li>\n"
                                + "                                    <a class=\"show-mesg\" href=\"#\" title=\"\" onclick=\"showBox2('" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "')\">\n"
                                + "                                        <figure>\n"
                                + "                                            <img class=\"imgst\" src=\"userPhoto/" + c.getU().getUserId() + "/avatar/" + c.getU().getAvatar() + "\" alt=\"\">\n"
                                + "                                            <span class=\"status f-offline\"></span>\n"
                                + "                                        </figure>\n"
                                + "                                        <div class=\"mesg-meta\">\n"
                                + "                                            <h6>" + c.getU().getLastName() + " " + c.getU().getMiddleName() + " " + c.getU().getFirstName() + "</h6>\n"
                                + "                                            <span class=\"editp\">" + c.getC().getSenderName() + ": " + c.getC().getNewMessage() + "</span>\n"
                                + "                                            <i>"+c.getC().getCountTime().getCountTime()+" "+ c.getC().getCountTime().getUnit() +" trước"+"</i>\n"
                                + "                                        </div>\n"
                                + "                                    </a>\n"
                                + "                                </li>");
                    }
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
