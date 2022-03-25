package controller;

import DAO.dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.account;

/**
 *
 * @author HP
 */
@MultipartConfig
public class addBackground extends HttpServlet {

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
        HttpSession session = request.getSession();
        try {
            account a = (account) session.getAttribute("AccLogin");
            //request.getRequestDispatcher("newjsp1.jsp").forward(request, response);
            Part pt = request.getPart("background");
            String realPath = "C:\\Users\\HP\\Desktop\\social_Network\\web\\userPhoto\\"+a.getUserId()+"\\background";
            
            String filename = Paths.get(pt.getSubmittedFileName()).getFileName().toString();
            if(!Files.exists(Paths.get(realPath))){
                Files.createDirectories(Paths.get(realPath));
            } 

            String namefile = "5";
            if(!filename.equals("")){
                pt.write(realPath+"/"+filename);
                namefile = "images/"+filename;
            } 
            dao d = new dao();
            boolean check = d.updateBackground(a.getUserId(),filename);
            if(check){
                String newPostID = d.addImagePostByUser("", a.getUserId(),"background");
                d.addImageAttachment(newPostID, "background");
            }
            request.getRequestDispatcher("loadManagerUserInforPage").forward(request, response);
            
        } catch (Exception e) {
            
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
