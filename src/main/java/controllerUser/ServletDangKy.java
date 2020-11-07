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
import java.sql.SQLException;

@WebServlet(name = "Servlet-dangky",urlPatterns = "/dangky")
public class ServletDangKy extends HttpServlet {
    User user = new User();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
       dangKy(request,response);
    }

    public void dangKy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String userName = request.getParameter("Username");
        String pass = request.getParameter("Password");

        user = new User(name, userName, pass);

        try {
            if (new UserService().checkDangKy(userName)) {
                request.setAttribute("message", "username already exists! ");
                RequestDispatcher dispatcher = request.getRequestDispatcher("user/dangky.jsp");
                dispatcher.forward(request,response);
            } else {
                if (new UserService().addAccount(user)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    request.setAttribute("message", "Sign Up Success");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("user/dangnhap.jsp");
                    dispatcher.forward(request, response);
//                response.sendRedirect("user/dangnhap.jsp");
                    request.setAttribute("message", "Sign Up Success");
                } else {
                    request.setAttribute("message", "lỗi đăng ký");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
