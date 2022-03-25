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
import model.account;
import model.friend;

public class loadRequest extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        dao d = new dao();
        account a= (account) session.getAttribute("AccLogin");
        List<friend> listRequest = d.getListRequestByUser(a);
        for (friend f : listRequest) {
            int mutual = d.getNumberMutualFriend(a.getUserId(), f.getFriendId());
            out.println("<li>\n" +
"                                <div>\n" +
"                                    <figure>\n" +
"                                        <img style=\"height: 40px\" src=\"userPhoto/"+f.getFriendId()+"/avatar/"+f.getAvatar()+"\" alt=\"\">\n" +
"                                    </figure>\n" +
"                                    <div class=\"mesg-meta\">\n" +
"                                        <h6><a href=\"getUserInfor?userID="+f.getFriendId()+"\" title=\"\">"+f.getFullname()+"</a></h6>\n" +
"                                        <span><b>"+mutual+"</b> bạn chung</span>\n" +
"                                    </div>\n" +
"                                    <div class=\"add-del-friends\">\n" +
"                                       <a style=\"cursor: pointer\" onclick=\"acceptF('"+f.getFriendId()+"')\" title=\"Xác nhận\"><i class=\"fa fa-user-plus\"></i></a>\n" +
"                                        <a style=\"cursor: pointer\" onclick=\"deleteF('"+f.getFriendId()+"')\" title=\"Xóa\"><i class=\"fa fa-trash\"></i></a>" +
"                                    </div>\n" +
"                                </div>	\n" +
"                            </li>");
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
