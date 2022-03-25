package view;

import DAO.dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.containerChat;
import model.messages;
import model.userInformation;

public class loadMessage2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        dao d = new dao();

        //account a = d.checkLogin("thang24052001nguyen@gmail.com", "123456");
        //account a2 = d.checkLogin("huynhbaphu2001@gmail.com", "123456");
        String uID = request.getParameter("id");

        HttpSession session = request.getSession();
        //session.setAttribute("currentID", uID);
        userInformation u1 = (userInformation) session.getAttribute("userInfor");
        userInformation u2 = d.getUserInfo(uID);
        containerChat cc = d.getConverByUser(u1, u2);
        if(cc.getC() == null){
            out.println("");
        }else{
        
        String converID = cc.getC().getConverID();
        String idUser2 = d.getUser2InConversation(converID, u1.getUserId());
        List<messages> listMess = d.getListMessages(converID);
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
