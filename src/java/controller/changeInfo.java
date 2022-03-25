package controller;

import DAO.dao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.userInformation;

public class changeInfo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        //account a = (account)session.getAttribute("AccLogin");
        userInformation old = (userInformation)session.getAttribute("userInfor");
        
        String firstname = request.getParameter("firstname");
        String middlename = request.getParameter("middlename");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String birtdate = request.getParameter("birthdate");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String education = request.getParameter("education");
        String job = request.getParameter("job");
        String hobbie = request.getParameter("hobbie");
        String other = request.getParameter("other");
        String linkfb = request.getParameter("fblink");
        String linkig = request.getParameter("iglink");
        String linktw = request.getParameter("twitterlink");
        userInformation new_u = new userInformation(old.getUserId(), old.getAvatar(), old.getBackground(), lastname, middlename, firstname, birtdate, gender, phone, email, address, education, job, hobbie, other, old.getImgfile(), linkfb, linkig, "", linktw, old.getCreatAt());
        dao d = new dao();
        boolean check = d.updateInfor(new_u);
        if(check){
            request.getRequestDispatcher("loadUserAbout?userID="+new_u.getUserId()).forward(request, response);
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
