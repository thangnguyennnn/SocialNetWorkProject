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
import model.report;

/**
 *
 * @author HP
 */
public class sendReport extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();

        account a = (account) session.getAttribute("AccLogin");
        dao d = new dao();
        String accused = request.getParameter("accused");
        String postID = request.getParameter("postId");
        String reason = request.getParameter("reason");
        String message = "Báo cáo bài viết của " + d.getFullName(accused);
        String link = "loadPostDetailPage?postID=" + postID + "&reason=" + reason;

        boolean check = d.createReport(postID, a.getUserId(), accused, reason, message, link);
        if (check) {
            List<report> listReport = d.getReport(5);
            List<report> listReportNum = d.getUnreadReport();

            session.setAttribute("report", listReport);
            session.setAttribute("reportNum", listReportNum.size());

            request.getRequestDispatcher("loadHomePage").forward(request, response);
        }else{
            request.getRequestDispatcher("newjsp1.jsp").forward(request, response);
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
