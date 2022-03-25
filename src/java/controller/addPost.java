package controller;

import DAO.dao;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.userInformation;

@MultipartConfig
public class addPost extends HttpServlet {

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
        userInformation user = (userInformation) session.getAttribute("userInfor");

        String numOfImg = request.getParameter("stt");
        int num = Integer.parseInt(numOfImg);
        String contentPost = request.getParameter("contentPost");
        dao d = new dao();
        if (num == 0) {
            d.addTextPostByUser(contentPost, user.getUserId());
        } else {
            String newPostID = d.addImagePostByUser(contentPost, user.getUserId(),"image");
            String realPath = "C:\\Users\\HP\\Desktop\\social_Network\\web\\userPhoto\\" + user.getUserId() + "\\photo";
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }
            for (int i = 1; i <= num; i++) {
                Part pt = request.getPart("image"+i);
                String nameFile = Paths.get(pt.getSubmittedFileName()).getFileName().toString();

                pt.write(realPath + "/" + nameFile);
                d.addImageAttachment(newPostID, nameFile);
            }
        }
        request.getRequestDispatcher("loadHomePage").forward(request, response);

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
