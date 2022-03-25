package controller;

import DAO.dao;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.account;


@MultipartConfig
public class addAvatar extends HttpServlet {

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        HttpSession session = request.getSession();
        try {
            account a = (account) session.getAttribute("AccLogin");
            //request.getRequestDispatcher("newjsp1.jsp").forward(request, response);
            Part pt = request.getPart("avatar");
            String realPath = "C:\\Users\\HP\\Desktop\\social_Network\\web\\userPhoto\\"+a.getUserId()+"\\avatar";
            if(!Files.exists(Paths.get(realPath))){
                Files.createDirectories(Paths.get(realPath));
            } 
            String filename = Paths.get(pt.getSubmittedFileName()).getFileName().toString();
            

            String namefile = "5";
            if(!filename.equals("")){
                pt.write(realPath+"/"+filename);
                namefile = "images/"+filename;
            } 
            dao d = new dao();
            boolean check = d.updateAvatar(a.getUserId(),filename);
            if(check){
                String newPostID = d.addImagePostByUser("", a.getUserId(),"avatar");
                d.addImageAttachment(newPostID, "avatar");
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
