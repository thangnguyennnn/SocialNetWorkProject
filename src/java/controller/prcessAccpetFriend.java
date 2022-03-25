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
import model.friend;

public class prcessAccpetFriend extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        dao d = new dao();
        account a = (account) session.getAttribute("AccLogin");
        
        List<friend> listRequest = d.getListRequestByUser(a);
        
        session.setAttribute("listRequest", listRequest);
        session.setAttribute("numOfRequest", listRequest.size());
        
        out.println("<a href=\"#\" title=\"Yêu cầu kết bạn\" data-ripple=\"\">\n" +
"						<i class=\"fa fa-user\"></i>\n" +
"                                                <em style=\"display:" +listRequest.size()+" ? \"none\":\"\"} \" class=\"bg-red\">"+listRequest.size()+"</em>\n" +
"					</a>\n" +
"					<div class=\"dropdowns\">\n" +
"                                            <span>"+listRequest.size()+" yêu cầu mới <a href=\"#\" title=\"\">Xem tất cả</a></span>\n" +
"						<ul class=\"drops-menu\">\n" +
"                                                    <c:forEach items=\"${sessionScope.listRequest}\" var=\"f\">\n" +
"                                                        <li>\n" +
"								<div>\n" +
"									<figure>\n" +
"                                                                            <img style=\"height: 40px\" src=\"images/avatardefault.png\" alt=\"\">\n" +
"									</figure>\n" +
"									<div class=\"mesg-meta\">\n" +
"										<h6><a href=\"getUserInfor?userID=${f.friendId}\" title=\"\">${f.fullname}</a></h6>\n" +
"										<span><b>Amy</b> is mutule friend</span>\n" +
"										<i>yesterday</i>\n" +
"									</div>\n" +
"									<div class=\"add-del-friends\">\n" +
"										<a href=\"#\" title=\"\"><i class=\"fa fa-heart\"></i></a>\n" +
"										<a href=\"#\" title=\"\"><i class=\"fa fa-trash\"></i></a>\n" +
"									</div>\n" +
"								</div>	\n" +
"							</li>\n" +
"                                                    </c:forEach>\n" +
"							\n" +
"						</ul>\n" +
"						<a href=\"friend-requests.html\" title=\"\" class=\"more-mesg\">Xem tất cả</a>\n" +
"					</div>");
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
