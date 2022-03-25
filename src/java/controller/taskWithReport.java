package controller;

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
public class taskWithReport extends HttpServlet {

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

        dao d = new dao();
        String reportID = request.getParameter("reportid");
        String index = request.getParameter("index");

        if (index.equals("1")) {
            d.updateReportStatus("1", reportID);
        }
        if (index.equals("2")) {
            d.deleteReport(reportID);
        }
        if (index.equals("3")) {
            List<report> listA = d.getUnreadReport();
            for (report object : listA) {
                d.updateReportStatus("0", object.getReportID());
            }
        }
        List<report> listB = d.getReport(100);
        for (report o : listB) {
            if ((o.getAvatar() == null || o.getAvatar().equals("")) && o.getStatus().equals("1")) {
                out.println("<li>\n"
                        + "      <a href=\"" + o.getLink() + "\" title=\"\">\n"
                        + "           <figure>\n"
                        + "                 <img class=\"fiximg\" src=\"images/avatardefault.png\">\n"
                        + "           </figure>\n"
                        + "           <div class=\"notifi-meta\">\n"
                        + "                 <p style=\"color: #fa6342;\">" + o.getMessage() + "</p>\n"
                        + "                 <span><i class=\"fa fa-flag\"></i> " + o.getDate() + "</span>\n"
                        + "           </div>\n"
                        + "      </a>\n"
                        + "      <div class=\"more\">\n"
                        + "           <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                        + "                 <ul>\n"
                        + "                       <li onclick=\"taskReport('" + o.getReportID()+ "', '1')\"><i class=\"fa fa-bell-o\"></i>Đánh dấu là chưa đọc</li>\n"
                        + "                       <li onclick=\"taskReport('" + o.getReportID() + "', '2')\"><i class=\"fa fa-trash-o\"></i>Gỡ thông báo này</li>\n"
                        + "                 </ul>\n"
                        + "           </div>\n"
                        + "      </div>\n"
                        + "</li>");
            } else if ((o.getAvatar() == null || o.getAvatar().equals("")) && o.getStatus().equals("0")) {
                out.println("<li>\n"
                        + "      <a href=\"" + o.getLink() + "\" title=\"\">\n"
                        + "           <figure>\n"
                        + "                 <img class=\"fiximg\" src=\"images/avatardefault.png\">\n"
                        + "           </figure>\n"
                        + "           <div class=\"notifi-meta\">\n"
                        + "                 <p>" + o.getMessage() + "</p>\n"
                        + "                 <span><i class=\"fa fa-flag\"></i> " + o.getDate() + "</span>\n"
                        + "           </div>\n"
                        + "      </a>\n"
                        + "      <div class=\"more\">\n"
                        + "           <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                        + "                 <ul>\n"
                        + "                       <li onclick=\"taskReport('" + o.getReportID() + "', '1')\"><i class=\"fa fa-bell-o\"></i>Đánh dấu là chưa đọc</li>\n"
                        + "                       <li onclick=\"taskReport('" + o.getReportID() + "', '2')\"><i class=\"fa fa-trash-o\"></i>Gỡ thông báo này</li>\n"
                        + "                 </ul>\n"
                        + "           </div>\n"
                        + "      </div>\n"
                        + "</li>");
            } else if ((o.getAvatar() != null && !o.getAvatar().equals("")) && o.getStatus().equals("1")) {
                out.println("<li>\n"
                        + "      <a href=\"" + o.getLink() + "\" title=\"\">\n"
                        + "           <figure>\n"
                        + "                 <img class=\"fiximg\" src=\"userPhoto/" + o.getAccuser() + "/avatar/" + o.getAvatar() + "\" alt=\"\">\n"
                        + "           </figure>\n"
                        + "           <div class=\"notifi-meta\">\n"
                        + "                 <p style=\"color: #fa6342;\">" + o.getMessage() + "</p>\n"
                        + "                 <span><i class=\"fa fa-flag\"></i> " + o.getDate() + "</span>\n"
                        + "           </div>\n"
                        + "      </a>\n"
                        + "      <div class=\"more\">\n"
                        + "           <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                        + "                 <ul>\n"
                        + "                       <li onclick=\"taskReport('" + o.getReportID() + "', '1')\"><i class=\"fa fa-bell-o\"></i>Đánh dấu là chưa đọc</li>\n"
                        + "                       <li onclick=\"taskReport('" + o.getReportID() + "', '2')\"><i class=\"fa fa-trash-o\"></i>Gỡ thông báo này</li>\n"
                        + "                 </ul>\n"
                        + "           </div>\n"
                        + "      </div>\n"
                        + "</li>");
            } else {
                out.println("<li>\n"
                        + "      <a href=\"" + o.getLink() + "\" title=\"\">\n"
                        + "           <figure>\n"
                        + "                 <img class=\"fiximg\" src=\"userPhoto/" + o.getAccuser()+ "/avatar/" + o.getAvatar() + "\" alt=\"\">\n"
                        + "           </figure>\n"
                        + "           <div class=\"notifi-meta\">\n"
                        + "                 <p>" + o.getMessage() + "</p>\n"
                        + "                 <span><i class=\"fa fa-flag\"></i> " + o.getDate() + "</span>\n"
                        + "           </div>\n"
                        + "      </a>\n"
                        + "      <div class=\"more\">\n"
                        + "           <div class=\"more-post-optns\"><i class=\"ti-more-alt\"></i>\n"
                        + "                 <ul>\n"
                        + "                       <li onclick=\"taskReport('" + o.getReportID() + "', '1')\"><i class=\"fa fa-bell-o\"></i>Đánh dấu là chưa đọc</li>\n"
                        + "                       <li onclick=\"taskReport('" + o.getReportID() + "', '2')\"><i class=\"fa fa-trash-o\"></i>Gỡ thông báo này</li>\n"
                        + "                 </ul>\n"
                        + "           </div>\n"
                        + "      </div>\n"
                        + "</li>");
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
