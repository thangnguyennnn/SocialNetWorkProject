package view;

import DAO.dao;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.account;
import model.friend;
import model.userInformation;

public class getUserInfor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        dao d = new dao();
        HttpSession session = request.getSession(true);
        session.removeAttribute("myInfor");
        account a = (account)session.getAttribute("AccLogin");
        String uID = request.getParameter("userID");
        
        userInformation u = d.getUserInfo(uID);
        String status = d.getStatusParticipant(a.getUserId(), uID);
        List<friend> listFriend = d.getListFriendByUser(a);
        List<friend> listRequest = d.getListRequestByUser(a);
        
        request.setAttribute("PostsByUser", d.getListPostsByUser(uID));
        session.setAttribute("listRequest", listRequest);
        session.setAttribute("numOfRequest", listRequest.size());
        session.setAttribute("friends", listFriend);
        session.setAttribute("GInfor", u);
        session.setAttribute("status", status);
        request.setAttribute("idPage", 1);
        request.getRequestDispatcher("timeline.jsp").forward(request, response);
        
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
