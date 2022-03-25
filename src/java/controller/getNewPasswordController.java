package controller;

import DAO.dao;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.confirmCode;

public class getNewPasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession(true);
        confirmCode cc =  (confirmCode)session.getAttribute("code");
        
        //String code = cc.getCode();
        
        //String _code = request.getParameter("confirmCode");
        String email = session.getAttribute("email") + "";
        
        Date date = new Date();
        int _hour = date.getHours();
        int _minute = date.getMinutes();
        int _second = date.getSeconds();
        
        String timeAt = cc.getTime();
        String[] listComponeTime = timeAt.split(":");
        int hour = Integer.parseInt(listComponeTime[0]);        
        int minute = Integer.parseInt(listComponeTime[1]);
        int second = Integer.parseInt(listComponeTime[2]);
        
        int totalWaitTime = (_hour - hour) *60*60 + (_minute - minute)*60 + (+second - second);
        //String time = _hour+"/"+_minute+"/"+_second;
        if(totalWaitTime > 300){
            request.setAttribute("timeOver", true);
            request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
        }else{
            String code = request.getParameter("confirmCode");
            if(code.equals(cc.getCode())){
                session.setAttribute("email", email);
                request.getRequestDispatcher("setNewPass.jsp").forward(request, response); 
            }else{
                request.setAttribute("confirmFail", false);
                request.getRequestDispatcher("confirmForgetPass.jsp").forward(request, response);
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
