/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fillter;

import DAO.dao;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.account;
import model.containerChat;
import model.friend;
import model.notification;
import model.userInformation;

/**
 *
 * @author HP
 */
public class processFillter implements Filter {
    
    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
    public processFillter() {
    }    
    
    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("processFillter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }    
    
    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("processFillter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        if (debug) {
            log("processFillter:doFilter()");
        }
        
        doBeforeProcessing(request, response);
        HttpServletRequest rq = (HttpServletRequest) request;
        HttpServletResponse rp = (HttpServletResponse) response;
        HttpSession session = rq.getSession();
        account a = (account) session.getAttribute("AccLogin");
        String url = rq.getServletPath();
        if (!url.endsWith("login_controller") && !url.endsWith("register.jsp") && !url.endsWith("forgetPassword.jsp")&& !url.endsWith("registerController") && !url.endsWith("confirmAccount") && !url.endsWith("forgetPasswordController") && !url.endsWith("getNewPasswordController") && !url.endsWith("setNewPass")) {
            if (a == null) {
                session.invalidate();
                dao d = new dao();
                //d.updateActive("2",a);
                rq.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                dao d = new dao();
                userInformation u = d.getInforSessionLogin(a);
                List<friend> listFriend = d.getListFriendByUser(a);
                List<friend> listRequest = d.getListRequestByUser(a);

                //Xử lý up bài viết ở đây
                userInformation user = d.getUserInfo(a.getUserId());
                List<userInformation> listConver = d.getListFriendContacYet(a.getUserId());
                List<containerChat> listChat = new ArrayList<>();
                List<notification> listNoti = d.getUnreadNotification(a.getUserId());
                List<notification> listAllNoti = d.getNotification(a.getUserId(), 8);
                for (userInformation i : listConver) {
                    containerChat cc = d.getConverByUser(user, i);
                    listChat.add(cc);
                }
                int n = listChat.size();
                for (containerChat chat : listChat) {
                    if (chat.getC().getSenderID().equals(a.getUserId())) {
                        n = n - 1;
                    } else if (chat.getC().getReaded().equals("1")) {
                        n = n - 1;
                    }
                }
                //userInformation user2 = d.getUserInfo(a.getUserId());
                //List<userInformation> listConver = d.getListFriendContacYet(id);
                //List<containerChat> listChat = new ArrayList<>();
                //for (userInformation i : listConver) {
                //    containerChat cc = d.getConverByUser(user2, i);
                //    listChat.add(cc);
                //}
                List<friend> listFriend2 = d.getListFriendNotContacYet(a.getUserId());

                session.setAttribute("listFr", listFriend2);
                session.setAttribute("listChat", listChat);

                // end xử lý up bài viết
                session.setAttribute("noti", listAllNoti);
                session.setAttribute("notiNum", listNoti.size());
                session.setAttribute("sizeMess", n);
                session.setAttribute("listConer", listChat);
                session.setAttribute("avt", u.getAvatar());
                session.setAttribute("listRequest", listRequest);
                session.setAttribute("numOfRequest", listRequest.size());
                session.setAttribute("friends", listFriend);
                session.setAttribute("userInfor", u);
            }
        }
        Throwable problem = null;
        try {
            chain.doFilter(request, response);
        } catch (Throwable t) {
            // If an exception is thrown somewhere down the filter chain,
            // we still want to execute our after processing, and then
            // rethrow the problem after that.
            problem = t;
            t.printStackTrace();
        }
        
        doAfterProcessing(request, response);

        // If there was a problem, we want to rethrow it if it is
        // a known type, otherwise log it.
        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {        
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {                
                log("processFillter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("processFillter()");
        }
        StringBuffer sb = new StringBuffer("processFillter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);                
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
    
}
