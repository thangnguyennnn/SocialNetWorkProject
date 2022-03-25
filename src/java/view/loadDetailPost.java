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
import model.Comment;
import model.Post;
import model.userInformation;

public class loadDetailPost extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        userInformation u = (userInformation) session.getAttribute("userInfor");
        PrintWriter out = response.getWriter();
        dao d = new dao();
        String postID = request.getParameter("postID");
        String index = request.getParameter("index");

        Post p = d.getPostByID(postID);
        if (index.equals("1")) {
            out.println("<figure><img style=\"max-height: 49px; max-width: 49px;\" src=\"" + p.getUserAvatar() + "\" alt=\"\"></figure>\n"
                    + "                                    <div class=\"user-information\">\n"
                    + "                                        <h4><a id=\"nameHost\" href=\"getUserInfor?userID=" + p.getUserID() + "\" title=\"\">" + p.getFullName() + "</a></h4>\n"
                    + "                                        <span>" +p.getUnitTime().getCountTime() + " "+ p.getUnitTime().getUnit()  + " trước</span>\n"
                    + "                                    </div>\n");
        }

        if (index.equals("2")) {
            if (p.isLike(u.getUserId())) {
                out.println("<ul>\n"
                        + "                                        <li>\n"
                        + "                                            <div id=\""+p.getPostID()+"\" onclick=\"likePost('"+p.getPostID()+"')\" title=\"Like/Dislike\" class=\"likes heart happy\">❤ <span id=\"t"+p.getPostID()+"\">" + p.getLikeTotal() + "</span></div>\n"
                        + "                                        </li>\n"
                        + "                                        <li>\n"
                        + "                                            <span title=\"Comments\" class=\"comment\">\n"
                        + "                                                <i class=\"fa fa-commenting\"></i>\n"
                        + "                                                <ins>" + p.getCommentTotal() + "</ins>\n"
                        + "                                            </span>\n"
                        + "                                        </li>\n"
                        + "                                    </ul>");
            }else{
                out.println("<ul>\n"
                        + "                                        <li>\n"
                        + "                                            <div id=\""+p.getPostID()+"\" onclick=\"likePost('"+p.getPostID()+"')\" title=\"Like/Dislike\" class=\"likes heart broken\">❤ <span id=\"t"+p.getPostID()+"\">" + p.getLikeTotal() + "</span></div>\n"
                        + "                                        </li>\n"
                        + "                                        <li>\n"
                        + "                                            <span title=\"Comments\" class=\"comment\">\n"
                        + "                                                <i class=\"fa fa-commenting\"></i>\n"
                        + "                                                <ins>" + p.getCommentTotal() + "</ins>\n"
                        + "                                            </span>\n"
                        + "                                        </li>\n"
                        + "                                    </ul>");
            }
        }

        if (index.equals("3")) {
            List<Comment> listCmnt = p.getAllCommentInpost();
            for (Comment c : listCmnt) {
                out.println("<li>\n"
                        + "                                            <div class=\"comet-avatar\">\n"
                        + "                                                <img alt=\"\" src=\"" + c.getUserAvatar() + "\">\n"
                        + "                                            </div>\n"
                        + "                                            <div class=\"we-comment\">\n"
                        + "                                                <h5><a title=\"\" href=\"time-line.html\">" + c.getFullName() + "</a></h5>\n"
                        + "                                                <p>" + c.getDetail() + "</p>\n"
                        + "                                                <div class=\"inline-itms\">\n"
                        + "                                                    <span>" + c.getUnitTime().getCountTime() +" " + c.getUnitTime().getUnit() + " trước</span>\n"
                        + "                                                    <a title=\"Reply\" href=\"#\" class=\"we-reply\"><i class=\"fa fa-reply\"></i></a>\n"
                        + "                                                    <a title=\"\" href=\"#\"><i class=\"fa fa-heart\"></i><span></span></a>\n"
                        + "                                                </div>\n"
                        + "                                            </div>\n"
                        + "\n"
                        + "                                        </li>");

            }
            out.println("<li>\n"
                    + "                                            <a class=\"showmore underline\" title=\"\" href=\"#\">xem thêm+</a>\n"
                    + "                                        </li>\n");
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
