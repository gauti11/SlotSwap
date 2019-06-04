/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SlotSwap;

import SlotSwap.Entity.AddUserEntity;
import SlotSwap.Entity.LoginEntity;
import SlotSwap.Model.AdminDAL;
import java.io.IOException;
import java.io.PrintWriter;
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
 *
 * @author amitk
 */
@WebServlet("/Admin/AddUser")
public class AddUserServlet extends HttpServlet {

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
        RequestDispatcher dispatcher = this.getServletContext()
                .getRequestDispatcher("/WEB-INF/View/Admin/AddUser.jsp");
        dispatcher.forward(request, response);
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
        AddUserEntity addUser = new AddUserEntity();
        addUser.setRestaurant(request.getParameter("restaurantId"));        
        addUser.setEmail(request.getParameter("email"));
        addUser.setFirstName(request.getParameter("firstName"));
        addUser.setMondayStartTime(request.getParameter("mStartTime"));
        addUser.setMondayEndTime(request.getParameter("mEndTime"));
        addUser.setLastName(request.getParameter("lastName"));
        addUser.setFridayStartTime(request.getParameter("fStartTime"));
        addUser.setFridayEndTime(request.getParameter("fEndTime"));
        addUser.setPassword(request.getParameter("password"));
        addUser.setSaturdayEndTime(request.getParameter("stEndTime"));
        addUser.setSaturdayStartTime(request.getParameter("stStartTime"));
        addUser.setSundayEndTime(request.getParameter("sEndTime"));
        addUser.setSundayStartTime(request.getParameter("sStartTime"));
        addUser.setThursdayStartTime(request.getParameter("thStartTime"));
        addUser.setThursdayEndTime(request.getParameter("thEndTime"));
        addUser.setTuesdayEndTime(request.getParameter("tEndTime"));
        addUser.setTuesdayStartTime(request.getParameter("tStartTime"));
        addUser.setWednesdayEndTime(request.getParameter("wEndTime"));
        addUser.setWednesdayStartTime(request.getParameter("wStartTime"));
        AdminDAL adminDAL;
        try {
            adminDAL = new AdminDAL();
            adminDAL.AddUser(addUser);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("/SlotSwap/Admin/UserList");
        


    }
}
