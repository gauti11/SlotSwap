package SlotSwap;

import SlotSwap.Entity.SearchEntity;
import SlotSwap.Entity.SearchResultEntity;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SlotSwap.Entity.UserDetailEntity;
import SlotSwap.Model.AdminDAL;
import com.google.gson.Gson;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/Admin/UserList")
@MultipartConfig
public class AdminUserListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUserListServlet() {
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

                SearchEntity searchEntity = new SearchEntity();
                searchEntity.setPageNo(Integer.parseInt(request.getParameter("pageNumber")));
                searchEntity.setPageSize(Integer.parseInt(request.getParameter("pageSize")));
                searchEntity.setSearchBy(request.getParameter("searchText"));
                searchEntity.setSortColumn(request.getParameter("sortName"));
                searchEntity.setIsSortOrderAsc(Boolean.parseBoolean(request.getParameter("sortOrder")));
                SearchResultEntity searchResult = getUserList(searchEntity);
                List<UserDetailEntity> user = (List<UserDetailEntity> )searchResult.getRows();
                AdminDAL admindal = new AdminDAL();
//                for(int i=0; i< user.size(); i++){
//                   user.get(i).setWeeklyHours(admindal.callweekHours(user.get(i).getUserId()));
//                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                Gson data = new Gson();
                String jsonObj = data.toJson(searchResult); // won't work if you don't assign it to a string.
               // jsonObj = "{total:100,rows:[]}";
                response.getWriter().write(jsonObj);
            } else {
                RequestDispatcher dispatcher = this.getServletContext()
                        .getRequestDispatcher("/WEB-INF/View/Admin/AdminUserList.jsp");
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

    protected SearchResultEntity getUserList(SearchEntity searchEntity) throws ClassNotFoundException, SQLException {
        AdminDAL adminDAL;
        adminDAL = new AdminDAL();
        return adminDAL.getUserList(searchEntity);
    }

}
