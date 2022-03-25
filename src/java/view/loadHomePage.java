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
import model.Post;
import model.account;
import model.containerChat;
import model.friend;
import model.notification;
import model.report;
import model.userInformation;

public class loadHomePage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        account a_login = (account) session.getAttribute("AccLogin");
        
        dao d = new dao();
        userInformation u = d.getInforSessionLogin(a_login);
        List<friend> listFriend = d.getListFriendByUser(a_login);
        List<friend> listRequest = d.getListRequestByUser(a_login);
        
        //Xử lý up bài viết ở đây
        userInformation user = d.getUserInfo(a_login.getUserId());
        List<userInformation> listConver = d.getListFriendContacYet(a_login.getUserId());
        List<containerChat> listChat = new ArrayList<>();
        List<notification> listNoti = d.getUnreadNotification(a_login.getUserId());
        List<notification> listAllNoti = d.getNotification(a_login.getUserId(), 8);
        for (userInformation i : listConver) {
            containerChat cc = d.getConverByUser(user, i);
            listChat.add(cc);
        }
        int n = listChat.size();
        for (containerChat chat : listChat) {
            if(chat.getC().getSenderID().equals(a_login.getUserId())){
                n = n-1;
            }
            else if(chat.getC().getReaded().equals("1")){
                n = n -1;
            }
        }
        List<report> listReport = d.getReport(5);
        List<report> listReportNum = d.getUnreadReport();
        List<Post> listFriendPost = d.getFriendPosts(u.getUserId());
        //request.setAttribute("friendPosts", d.getFriendPosts( u.getUserId() ) );
        // end xử lý up bài viết
        
        session.setAttribute("report", listReport);
        session.setAttribute("reportNum", listReportNum.size());
        request.setAttribute("reccentBirtDate", d.getReccentBitrhDate(u.getUserId()));
        session.setAttribute("PostsByUser", listFriendPost);
        session.setAttribute("noti", listAllNoti);
        session.setAttribute("notiNum", listNoti.size());
        session.setAttribute("sizeMess", n);
        session.setAttribute("listConer", listChat);
        session.setAttribute("avt", u.getAvatar());
        session.setAttribute("listRequest", listRequest);
        session.setAttribute("numOfRequest", listRequest.size());
        session.setAttribute("friends", listFriend);
        session.setAttribute("userInfor", u);
        request.getRequestDispatcher("newsfeed.jsp").forward(request, response);
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
