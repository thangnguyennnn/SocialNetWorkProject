package view;

import DAO.dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.account;
import model.containerChat;
import model.userInformation;

public class loadNumMess extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        dao d = new dao();
        account a= (account) session.getAttribute("AccLogin");
        userInformation user = d.getUserInfo(a.getUserId());
        List<userInformation> listConver = d.getListFriendContacYet(a.getUserId());
        List<containerChat> listChat = new ArrayList<>();
        for (userInformation i : listConver) {
            containerChat cc = d.getConverByUser(user, i);
            listChat.add(cc);
        }
        int n = listChat.size();
        for (containerChat chat : listChat) {
            if(chat.getC().getSenderID().equals(a.getUserId())){
                n = n-1;
            }
            else if(chat.getC().getReaded().equals("1")){
                n = n -1;
            }
        }
        out.println(n);
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
