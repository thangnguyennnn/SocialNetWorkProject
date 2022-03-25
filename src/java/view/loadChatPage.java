package view;

import DAO.dao;
import java.io.IOException;
import java.util.ArrayList;
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

public class loadChatPage extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        account a = (account) session.getAttribute("AccLogin");
        dao d = new dao();
        String id = request.getParameter("idU");
        userInformation user = d.getUserInfo(a.getUserId());
        List<userInformation> listConver = d.getListFriendContacYet(id);
        List<containerChat> listChat = new ArrayList<>();
        for (userInformation i : listConver) {
            containerChat cc = d.getConverByUser(user, i);
            listChat.add(cc);
        }
        List<friend> listFriend = d.getListFriendNotContacYet(a.getUserId());
        
        session.setAttribute("listFr", listFriend);
        session.setAttribute("listChat", listChat);
        request.getRequestDispatcher("chat.jsp").forward(request, response);
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
