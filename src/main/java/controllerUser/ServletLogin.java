package controllerUser;

import model.User;
import serviceuser.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Servlet-login",urlPatterns = "/login")
public class ServletLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        login(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("Username");
        String pass = request.getParameter("Password");

        User user = new UserService().getInformationUser(username);
        System.out.println(user);
        if (new UserService().checkLogin(username, pass)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            System.out.println("dang nhap thanh cong");
            try {
                response.sendRedirect("index.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("message","\n" +
                    "The account password is incorrect!" );
            try {
                RequestDispatcher dispatcher = request.getRequestDispatcher("user/dangnhap.jsp");
                dispatcher.forward(request, response);

            } catch (IOException e) {
                e.printStackTrace();
            } catch (ServletException e) {
                e.printStackTrace();
            }
            System.out.println("loi dang nhap");
        }
    }
}
