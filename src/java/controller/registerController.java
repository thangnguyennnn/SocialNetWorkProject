package controller;

import DAO.dao;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.account;
import model.confirmCode;
import model.datingProfile;
import model.userInformation;

/**
 *
 * @author HP
 */
public class registerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MessagingException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession(true);
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("ConfirmPassword");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        
        dao d = new dao();
        boolean exitEmail = d.checkEmailExit(email);
        if(exitEmail){
            if(password.endsWith(confirmPassword)){
                String code = d.ramdomCofirmCode();
                confirmCode cc = d.sendCofrimCode(email, code);
                
                String id = d.creatIDUser();
                account a = new account(id, email, password, 0, "False");
                
                Date da = new Date();
                int day = da.getDate();
                int month = da.getMonth()+1;
                int year = da.getYear()+1900;
                String ms;
                ms = day+"/"+month+"/"+year;
                userInformation u = new userInformation(id, "Null", "Null", firstname, "", lastname, "", "", "", email, "", "", "", "", "", "", "", "", "", "",ms);
                datingProfile p = new datingProfile(id, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "1");
                
                //boolean c = d.updateDatingProfile2(p);                
                
                session.setAttribute("datingInfor", p);
                session.setAttribute("info", u);
                session.setAttribute("confirmCode", cc);
                session.setAttribute("tempAcc", a);
                request.getRequestDispatcher("confirmRegister.jsp").forward(request, response);
            }else{
                session.setAttribute("errolCofirm", false);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }else{
            session.setAttribute("exitEmail", exitEmail);
            request.getRequestDispatcher("register.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(registerController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(registerController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
