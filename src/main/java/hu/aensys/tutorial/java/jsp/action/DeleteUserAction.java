package hu.aensys.tutorial.java.jsp.action;

import hu.aensys.tutorial.java.jsp.bean.Beans;
import hu.aensys.tutorial.java.jsp.bean.UserManager;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteUser")
public class DeleteUserAction extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Long id = Long.parseLong(request.getParameter("id"));

        UserManager userManager = Beans.getUserManager(request);
        userManager.delete(id);

        response.sendRedirect("users.jsp");
    }

}
