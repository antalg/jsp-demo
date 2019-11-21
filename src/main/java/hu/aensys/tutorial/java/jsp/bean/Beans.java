package hu.aensys.tutorial.java.jsp.bean;

import javax.servlet.http.HttpServletRequest;

public class Beans {

    public static UserManager getUserManager(HttpServletRequest request) {
        return (UserManager) request.getServletContext().getAttribute("userManager");
    }

}
