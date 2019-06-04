package SlotSwap;

import SlotSwap.Entity.SearchEntity;
import SlotSwap.Entity.SearchResultEntity;
import SlotSwap.Model.AdminDAL;
import SlotSwap.Model.UserDAL;
import SlotSwap.Utils.MyUtils;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class User
 */
@WebServlet("/User/Dashboard")
public class UserDashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        try {
            String getRequest = request.getParameter("getRequest");
            if ("getUserList".equals(getRequest)) {
                UserDAL userDAL;
                userDAL = new UserDAL();
                SearchResultEntity searchResult = userDAL.getSlotList(MyUtils.getLoginedUser(request.getSession()).getUserId());
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                Gson data = new Gson();
                String jsonObj = data.toJson(searchResult); // won't work if you don't assign it to a string.
                // jsonObj = "{total:100,rows:[]}";
                response.getWriter().write(jsonObj);
            } else {
                RequestDispatcher dispatcher = this.getServletContext()
                        .getRequestDispatcher("/WEB-INF/View/User/UserDashboard.jsp");
                dispatcher.forward(request, response);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminUserListServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
