package controller;

import DAO.dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.userInformation;

public class searchUser extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
            request.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            String txtSearch = request.getParameter("txtSearch");
            dao d = new dao();
            List<userInformation> listU = d.getListUserByName(txtSearch);
            for (userInformation i : listU) {
                out.println("<li>\n" +
"                            <a href=\"getUserInfor?userID="+i.getUserId()+"\" title=\"\">\n" +
"                                <figure>\n" +
"                                    <img class=\"fixImg2\" src=\"userPhoto/"+i.getUserId()+"/avatar/"+i.getAvatar()+"\" alt=\"\">\n" +
"                                    <span class=\"status f-online\"></span>\n" +
"                                </figure>\n" +
"                                <div class=\"mesg-meta\">\n" +
"                                    <h6>"+i.getLastName()+" "+i.getMiddleName() +" "+i.getFirstName() +"</h6>\n" +
"                                    <span>"+i.getAddress()+"</span>\n" +
"                                </div>\n" +
"                            </a>\n" +
"                        </li>");
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
