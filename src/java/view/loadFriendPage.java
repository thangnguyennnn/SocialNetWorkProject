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
import model.information;
import model.userInformation;

public class loadFriendPage extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession sesion = request.getSession();
        dao d = new dao();
        account a = (account)sesion.getAttribute("AccLogin");
        userInformation u = d.getUserInfo(request.getParameter("userID"));
        List<userInformation> listFriendU = d.getListAllFriend(request.getParameter("userID"));
        List<information> listFriendRela = new ArrayList<information>();
        for (userInformation i : listFriendU) {
            String isFriend = d.getFriendByID(a.getUserId(),i.getUserId());
            listFriendRela.add(new information(i, isFriend));
        }
        
        request.setAttribute("sizeListF", listFriendRela.size());
        request.setAttribute("idPage", 3);
        sesion.setAttribute("ListFriend", listFriendRela);
        sesion.setAttribute("GInfor", u);
        request.getRequestDispatcher("friend.jsp").forward(request, response);
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
