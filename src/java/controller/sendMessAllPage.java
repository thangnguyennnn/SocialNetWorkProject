package controller;

import DAO.dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.account;
import model.messages;
import model.userInformation;

public class sendMessAllPage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String reciveID = request.getParameter("id");
        HttpSession session = request.getSession();
        account a = (account) session.getAttribute("AccLogin");
        dao d = new dao();
        String checkChatBoxExist = d.getChatBox(a.getUserId(), reciveID);
        if (checkChatBoxExist.equals("")) {
            String id = d.createID("C");
            boolean checkCreateBoxChat = d.creatBoxChat(id);
            if (checkCreateBoxChat) {
                boolean checkUpdatePart = d.updateParticipant(a.getUserId(), reciveID, id);
                boolean checkUpdtaePart_ = d.updateParticipant(reciveID, a.getUserId(), id);
                if (checkUpdatePart && checkUpdtaePart_) {
                    String content = request.getParameter("content");
                    Date date = new Date();
                    int day = date.getDate();
                    int month = date.getMonth() + 1;
                    int year = date.getYear() + 1900;
                    int hour = date.getHours();
                    int minute = date.getMinutes();
                    int second = date.getSeconds();
                    String time = day + "/" + month + "/" + year + "-" + hour + "/" + minute + "/" + second;

                    messages cc = new messages(id, a.getUserId(), content, time, d.getNUmofTotalMessage(id), 1, 2, 1);
                    boolean checkSend = d.sendMessage(cc);
                    if (checkSend) {

                        request.getRequestDispatcher("loadChatPage").forward(request, response);
                    } else {

                        out.println("Có lỗi xảy ra vui lòng thử lại 1!!!");
                    }
                } else {

                    out.println("Có lỗi xảy ra vui lòng thử lại 2!!!");
                }
            } else {

                request.getRequestDispatcher("newjsp1.jsp").forward(request, response);
            }
        } else {
            String content = request.getParameter("content");
            Date date = new Date();
            int day = date.getDate();
            int month = date.getMonth() + 1;
            int year = date.getYear() + 1900;
            int hour = date.getHours();
            int minute = date.getMinutes();
            int second = date.getSeconds();
            String time = day + "/" + month + "/" + year + "-" + hour + "/" + minute + "/" + second;

            messages cc = new messages(checkChatBoxExist, a.getUserId(), content, time, d.getNUmofTotalMessage(checkChatBoxExist) + 1, 1, 2, 1);
            boolean checkSend = d.sendMessage(cc);
            if (checkSend) {
                userInformation u1 = (userInformation) session.getAttribute("userInfor");
                String idUser2 = d.getUser2InConversation(checkChatBoxExist, u1.getUserId());
                userInformation u2 = d.getUserInfo(idUser2);
                List<messages> listMess = d.getListMessages(checkChatBoxExist);
                for (messages m : listMess) {
                    if (m.getSenderID().trim().equals(u1.getUserId().trim())) {
                        if (m.getReaded1() == 1) {
                            out.println("<li class=\"you\">\n"
                                    + "                        <div class=\"chat-thumb\"><img src=\"userPhoto/" + u1.getUserId() + "/avatar/" + u1.getAvatar() + "\" alt=\"\"></div>\n"
                                    + "                        <div class=\"notification-event\">\n"
                                    + "                            <span class=\"chat-message-item\" style=\"width: 100%\">\n"
                                    + "                                " + m.getContent() + "\n"
                                    + "                            </span>\n"
                                    + "                            <span class=\"notification-date\"><time datetime=\"2004-07-24T18:18\" class=\"entry-date updated\">" + m.getTime() + "</time></span>\n"
                                    + "                        </div>\n"
                                    + "                    </li>");
                        } else {
                            out.println("<li class=\"you\" >\n"
                                    + "                        <div class=\"chat-thumb\"><img src=\"userPhoto/" + u1.getUserId() + "/avatar/" + u1.getAvatar() + "\" alt=\"\"></div>\n"
                                    + "                        <div class=\"notification-event\">\n"
                                    + "                            <span class=\"chat-message-item\" style=\"width: 100%\">\n"
                                    + "                                " + m.getContent() + "\n"
                                    + "                            </span>\n"
                                    + "                            <span class=\"notification-date\"><time datetime=\"2004-07-24T18:18\" class=\"entry-date updated\">" + m.getTime() + "</time></span>\n"
                                    + "                        </div>\n"
                                    + "                    </li>");
                        }
                    }

                    if (m.getSenderID().trim().equals(u2.getUserId().trim())) {
                        out.println("<li class=\"me\">\n"
                                + "                        <div class=\"chat-thumb\"><img src=\"userPhoto/" + u2.getUserId() + "/avatar/" + u2.getAvatar() + "\" alt=\"\"></div>\n"
                                + "                        <div class=\"notification-event\">\n"
                                + "                            <span class=\"chat-message-item\">\n"
                                + "                                " + m.getContent() + "\n"
                                + "                            </span>\n"
                                + "                            <span class=\"notification-date\"><time datetime=\"2004-07-24T18:18\" class=\"entry-date updated\">" + m.getTime() + "</time></span>\n"
                                + "                        </div>\n"
                                + "                    </li>");
                    }
                }
            } else {
                out.println("Có lỗi xảy ra vui lòng thử lại !!!");
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
