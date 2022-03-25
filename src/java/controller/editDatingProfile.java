/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.account;
import model.datingDetail;
import model.datingProfile;

/**
 *
 * @author PC
 */
@MultipartConfig
@WebServlet(name = "editDatingProfile", urlPatterns = {"/editDatingProfile"})
public class editDatingProfile extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        try {
            account a = (account) session.getAttribute("AccLogin");
            datingDetail oldProfile = new dao().getDatingDetail(a.getUserId());
            Part pt1 = request.getPart("image1");
            Part pt2 = request.getPart("image2");
            Part pt3 = request.getPart("image3");
            Part pt4 = request.getPart("image4");
            Part pt5 = request.getPart("image5");
            String realPath = "C:\\Users\\HP\\Desktop\\social_Network\\web\\userPhoto\\" + a.getUserId() + "\\datingImage";
            
            String filename1 = Paths.get(pt1.getSubmittedFileName()).getFileName().toString();
            String filename2 = Paths.get(pt2.getSubmittedFileName()).getFileName().toString();
            String filename3 = Paths.get(pt3.getSubmittedFileName()).getFileName().toString();
            String filename4 = Paths.get(pt4.getSubmittedFileName()).getFileName().toString();
            String filename5 = Paths.get(pt5.getSubmittedFileName()).getFileName().toString();
            
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }
            String namefile1 = "5";
            String namefile2 = "5";
            String namefile3 = "5";
            String namefile4 = "5";
            String namefile5 = "5";
            if(oldProfile.getImage1() != null)
                namefile1 = oldProfile.getImage1();
            if(oldProfile.getImage2() != null)
                namefile2 = oldProfile.getImage2();
            if(oldProfile.getImage3() != null)
                namefile3 = oldProfile.getImage3();
            if(oldProfile.getImage4() != null)
                namefile4 = oldProfile.getImage4();
            if(oldProfile.getImage5() != null)
                namefile5 = oldProfile.getImage5();
            
            if (!filename1.equals("")) {
                pt1.write(realPath + "/" + filename1);
                namefile1 = filename1;
            }
            
            if (!filename2.equals("")) {
                pt2.write(realPath + "/" + filename2);
                namefile2 =  filename2;
            }
            
            if (!filename3.equals("")) {
                pt3.write(realPath + "/" + filename3);
                namefile3 =  filename3;
            }
            
            if (!filename4.equals("")) {
                pt4.write(realPath + "/" + filename4);
                namefile4 = filename4;
            }
            
            if (!filename5.equals("")) {
                pt5.write(realPath + "/" + filename5);
                namefile5 = filename5;
            }

            String nickName = request.getParameter("nickName");
            String location = request.getParameter("location");
            String birthDate = request.getParameter("birthDate");
            String sex = request.getParameter("sex");
            String child = request.getParameter("child");
            String gender = request.getParameter("gender");
            String education = request.getParameter("education");
            String job = request.getParameter("job");
            String hobbie = request.getParameter("hobbie");
            String detail = request.getParameter("detail");

            dao d = new dao();
            datingProfile profile = new datingProfile(a.getUserId(), nickName, location, birthDate, sex, child, gender, education, job, hobbie, detail,
                    namefile1, namefile2, namefile3, namefile4, namefile5, "2");
            d.updateDatingProfile1(profile);
            d.updateDatingProfile2(profile);
            request.getRequestDispatcher("loadDatingPage?userID=" + a.getUserId()).forward(request, response);

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
