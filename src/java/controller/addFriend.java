package controller;

import DAO.dao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.account;

public class addFriend extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        account a = (account) session.getAttribute("AccLogin");
        dao d = new dao();
        String userID2 = request.getParameter("userid");
        String ConverID = d.getConverID(a.getUserId(), userID2);
        if (ConverID.equals("")) {
            String partID = d.createID("P");
            boolean check = d.creatRela(partID, a.getUserId(), userID2, "3");
            if (check) {
                d.creatRela(d.createID("P"), userID2, a.getUserId(), "2");
                out.println("<a title=\"Hủy lời mời kết bạn\" data-toggle=\"tooltip\"><i class=\"fa fa-user-times\"></i></a>");
            }
        } else {
            boolean check = d.UpdateStatusFriend(userID2, a.getUserId(), "2");
            if (check) {
                d.UpdateStatusFriend(a.getUserId(), userID2, "3");
                out.println("<a title=\"Hủy lời mời kết bạn\" data-toggle=\"tooltip\"><i class=\"fa fa-user-times\"></i></a>");
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
