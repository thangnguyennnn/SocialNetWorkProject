package view;

import DAO.dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.report;

/**
 *
 * @author HP
 */
public class loadRealRPNoti extends HttpServlet {

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
        List<report> listReport = new dao().getReport(5);
        for (report r : listReport) {
            if ((r.getAvatar() == null || r.getAvatar().equals("")) && r.getStatus().equals("1")) {
                out.println("<li onclick=\"readReport('" + r.getReportID() + "')\">\n"
                        + "      <a href=\"" + r.getLink() + "\" title=\"\" >\n"
                        + "           <figure>\n"
                        + "                <img class=\"fiximg\" src=\"images/avatardefault.png\">\n"
                        + "                <span class=\"status f-online\"></span>\n"
                        + "           </figure>\n"
                        + "           <div class=\"mesg-meta\">\n"
                        + "                <h6>" + r.getAccuserName()+ "</h6>\n"
                        + "                    <span style=\"max-width: 100%; color: #fa6342;\">" + r.getMessage() + "</span><br>\n"
                        + "                    <span><i style=\"color: #fa6342; font-size: 13px;\" class=\"fa fa-flag\"></i></span>\n"
                        + "            <span>" + r.getDate() + "</span>"
                        + "           </div>\n"
                        + "      </a>\n"
                        + " </li>");
            } else if ((r.getAvatar() == null || r.getAvatar().equals("")) && r.getStatus().equals("0")) {
                out.println("<li onclick=\"readReport('" + r.getReportID()+ "')\">\n"
                        + "      <a href=\"" + r.getLink() + "\" title=\"\">\n"
                        + "           <figure>\n"
                        + "                <img class=\"fiximg\" src=\"images/avatardefault.png\">\n"
                        + "                <span class=\"status f-online\"></span>\n"
                        + "           </figure>\n"
                        + "           <div class=\"mesg-meta\">\n"
                        + "                <h6>" + r.getAccuserName()+ "</h6>\n"
                        + "                    <span style=\"max-width: 100%;\">" + r.getMessage() + "</span><br>\n"
                        + "                    <span><i style=\"color: #7580a2; font-size: 13px;\" class=\"fa fa-flag\"></i></span>\n"
                        + "            <span>" + r.getDate() + "</span>"
                        + "           </div>\n"
                        + "      </a>\n"
                        + " </li>");
            } else if ((r.getAvatar() != null && !r.getAvatar().equals("")) && r.getStatus().equals("1")) {
                out.println("<li onclick=\"readReport('" + r.getReportID()+ "')\">\n"
                        + "      <a href=\"" + r.getLink() + "\" title=\"\">\n"
                        + "           <figure>\n"
                        + "                <img class=\"fiximg\" src=\"userPhoto/" + r.getAccuser()+ "/avatar/" + r.getAvatar() + "\" alt=\"\">\n"
                        + "                <span class=\"status f-online\"></span>\n"
                        + "           </figure>\n"
                        + "           <div class=\"mesg-meta\">\n"
                        + "                <h6>" + r.getAccuserName()+ "</h6>\n"
                        + "                    <span style=\"max-width: 100%; color: #fa6342;\">" + r.getMessage() + "</span><br>\n"
                        + "                    <span><i style=\"color: #fa6342; font-size: 13px;\" class=\"fa fa-flag\"></i></span>\n"
                        + "<span>" + r.getDate() + "</span>"
                        + "           </div>\n"
                        + "      </a>\n"
                        + " </li>");
            } else {
                out.println("<li onclick=\"readReport('" + r.getReportID() + "')\">\n"
                        + "      <a href=\"" + r.getLink() + "\" title=\"\">\n"
                        + "           <figure>\n"
                        + "                <img class=\"fiximg\" src=\"userPhoto/" + r.getAccuser() + "/avatar/" + r.getAvatar() + "\" alt=\"\">\n"
                        + "                <span class=\"status f-online\"></span>\n"
                        + "           </figure>\n"
                        + "           <div class=\"mesg-meta\">\n"
                        + "                <h6>" + r.getAccuserName() + "</h6>\n"
                        + "                    <span style=\"max-width: 100%;\">" + r.getMessage() + "</span><br>\n"
                        + "                    <span><i style=\"color: #7580a2; font-size: 13px;\" class=\"fa fa-flag\"></i></span>\n"
                        + "<span>" + r.getDate() + "</span>"
                        + "           </div>\n"
                        + "      </a>\n"
                        + " </li>");
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
