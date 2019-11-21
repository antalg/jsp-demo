package hu.aensys.tutorial.java.jsp.action;

import hu.aensys.tutorial.java.jsp.bean.Beans;
import hu.aensys.tutorial.java.jsp.bean.UserManager;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/saveUser")
public class SaveUserAction extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");

        UserManager userManager = Beans.getUserManager(request);

        if (id == null) {
            userManager.add(username, fullName);
        } else {
            userManager.update(Long.parseLong(id), username, fullName);
        }

        response.sendRedirect("users.jsp");
    }

}
