/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class addNewInputImg extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String stt = request.getParameter("stt");
        //String[] getStt = stt.split("-");
        int n = Integer.parseInt(stt);
        int nextN = n + 1;
        out.println("<div id=\"containerImg"+nextN+"\" class=\"fooImbaFixed col-lg-4\">\n" +
"                                                        <img id=\"hinh"+nextN+"\" alt=\"avatar\" src=\"images/anhNen.png\">\n" +
"                                                    <div class=\"fooEdit-dp\">\n" +
"                                                        <label class=\"fileContainer\" id=\"saveImg"+nextN+"\">\n" +
"                                                            <i class=\"fa fa-camera\"></i>\n" +
"                                                            <input type=\"file\" name=\"image"+nextN+"\" onchange=\"readURLPostImg(this, 'hinh"+nextN+"', '"+nextN+"')\"/>\n" +
"                                                        </label>               \n" +
"                                                    </div>\n" +
"                                                </div>");
        
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
