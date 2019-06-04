package SlotSwap;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SlotSwap.Entity.LoginEntity;
import SlotSwap.Entity.UserDetailEntity;
import SlotSwap.Model.LoginDAL;
import SlotSwap.Utils.MyUtils;
import SlotSwap.Utils.RoleEnum;

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    LoginDAL loginDAL;

    public LoginServlet() throws ClassNotFoundException, SQLException {
        super();
        loginDAL = new LoginDAL();
    }

    // Show Login page.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("logout") != null) {
            request.getSession().invalidate();
            //HttpSession session = request.getSession(false);
        }
        // Forward to /WEB-INF/views/loginView.jsp
        // (Users can not access directly into JSP pages placed in WEB-INF)
        request.getSession().invalidate();
        HttpSession session = request.getSession(false);
        RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/WEB-INF/View/Login.jsp");

        dispatcher.forward(request, response);

    }

    // When the user enters userName & password, and click Submit.
    // This method will be executed.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            LoginEntity loginEntity = new LoginEntity();
            loginEntity.setEmail(request.getParameter("email"));
            loginEntity.setPassword(request.getParameter("password"));

            UserDetailEntity user = null;
            boolean hasError = false;
            String errorString = null;
            if (loginEntity.getEmail() == null || loginEntity.getPassword() == null
                    || loginEntity.getEmail().length() == 0 || loginEntity.getPassword().length() == 0) {
                hasError = true;
                errorString = "Required email and password!";
            } else {

                user = loginDAL.isValidUser(loginEntity);
                System.out.println("dddsa");
                if (user == null) {
                    hasError = true;
                    errorString = "email or password invalid";
                }
            }

            // If error, forward to /WEB-INF/login.jsp
            if (hasError) {
                // Store information in request attribute, before forward.
                request.setAttribute("errorString", errorString);
                request.setAttribute("loginEntity", loginEntity);

                // Forward to /WEB-INF/views/login.jsp
                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/View/Login.jsp");

                dispatcher.forward(request, response);
            } // If no error
            // Store user information in Session
            // And redirect to userInfo page.
            else {
                HttpSession session = request.getSession();
                MyUtils.storeLoginedUser(session, user);
                // Redirect to userInfo page.
                if (user.getRoleId() == RoleEnum.Admin.index()) {
                    response.sendRedirect(request.getContextPath() + "/Admin/UserList");
                } else {
                    response.sendRedirect(request.getContextPath() + "/User/Dashboard");

                }
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
}
