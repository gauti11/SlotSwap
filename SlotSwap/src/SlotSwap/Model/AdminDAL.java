/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SlotSwap.Model;

import SlotSwap.Entity.AddUserEntity;
import SlotSwap.Entity.LoginEntity;
import SlotSwap.Entity.SearchEntity;
import SlotSwap.Entity.SearchResultEntity;
import SlotSwap.Entity.SlotEntity;
import SlotSwap.Entity.UserDetailEntity;
import SlotSwap.Utils.ConnectionUtils;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Paths;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.jdt.internal.compiler.parser.Parser;

/**
 *
 * @author amitk
 */
public class AdminDAL {

    private Connection conn = null;

    public AdminDAL() throws ClassNotFoundException, SQLException {
        conn = ConnectionUtils.getConnection();
    }

    public SearchResultEntity getUserList(SearchEntity searchEntity) throws SQLException {
        SearchResultEntity searchResult = new SearchResultEntity();
        List<UserDetailEntity> userlist = new ArrayList<UserDetailEntity>();
        try {

            CallableStatement cblStmt = conn.prepareCall("{call UserList(?,?,?,?,?)}");

            cblStmt.setInt(1, searchEntity.getPageNo() + 1);
            cblStmt.setInt(2, searchEntity.getPageSize());
            cblStmt.setString(3, searchEntity.getSortColumn());
            cblStmt.setBoolean(4, searchEntity.isIsSortOrderAsc());
            cblStmt.setString(5, searchEntity.getSearchBy());

            cblStmt.execute();
            ResultSet rSet = cblStmt.getResultSet();
            int total = 0;
            while (rSet.next()) {
                UserDetailEntity user = new UserDetailEntity();
                total = rSet.getInt("TotalCount");
                user.setEmail(rSet.getString("EmailId"));
                user.setFirstName(rSet.getString("FirstName"));
                user.setLastName(rSet.getString("LastName"));
                user.setEmpRole(rSet.getString("EmpRole"));
                user.setManager(rSet.getString("Manager"));
                user.setPerHourSalary(rSet.getInt("SalaryPerHour"));
                user.setUserId(rSet.getInt("UserId"));
                String currPath = System.getProperty("user.dir");
                CallableStatement cblStmt2 = conn.prepareCall("{call SlotList(?)}");
                cblStmt2.setInt(1, user.getUserId());
                cblStmt2.execute();
                ResultSet rSet2 = cblStmt2.getResultSet();

                String hsStr = "[";
                int count = 0;
                while (rSet2.next()) {
                    String tf = rSet2.getString("TimeFrom").substring(1, 2) ;
                    String tt = rSet2.getString("TimeTo").substring(1, 2); 
                    hsStr += "[" + count +","+ tf + "," + tt + "],";
                    count++;
                }
                hsStr = hsStr.substring(0, hsStr.length() - 1);
                if (!hsStr.equals("")) {
                    hsStr += "]";
                    currPath = "\"C:\\My Data\\PLProject\\SlotSwap\\SlotSwap\\Haskell\\haskell_functions.hs\"";

                    Process p = Runtime.getRuntime().exec("runghc " + currPath + " " + hsStr);
                    BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
                    String line = null;
                    while ((line = in.readLine()) != null) {
                        user.setWeeklyHours(java.lang.Math.abs(Integer.parseInt(line)));
                    }
                }
                userlist.add(user);

            }

            searchResult.setTotal(total);
            searchResult.setRows(userlist);

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            ConnectionUtils.closeConnection(conn);
        }
        return searchResult;
    }

    public void AddUser(AddUserEntity addUser) throws SQLException {
        try {

            CallableStatement cblStmt = conn.prepareCall("{call AddUser(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cblStmt.setString(1, addUser.getEmail());
            cblStmt.setString(4, addUser.getFirstName());
            cblStmt.setString(5, addUser.getLastName());
            cblStmt.setString(2, addUser.getPassword());
            cblStmt.setString(3, addUser.getRestaurant());
            cblStmt.setString(6, addUser.getMondayStartTime());
            cblStmt.setString(7, addUser.getTuesdayStartTime());
            cblStmt.setString(8, addUser.getWednesdayStartTime());
            cblStmt.setString(9, addUser.getThursdayStartTime());
            cblStmt.setString(10, addUser.getFridayStartTime());
            cblStmt.setString(11, addUser.getSaturdayStartTime());
            cblStmt.setString(12, addUser.getSundayStartTime());
            cblStmt.setString(13, addUser.getMondayEndTime());
            cblStmt.setString(14, addUser.getTuesdayEndTime());
            cblStmt.setString(15, addUser.getWednesdayEndTime());
            cblStmt.setString(16, addUser.getThursdayEndTime());
            cblStmt.setString(17, addUser.getFridayEndTime());
            cblStmt.setString(18, addUser.getSaturdayEndTime());
            cblStmt.setString(19, addUser.getSundayEndTime());
            cblStmt.execute();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            ConnectionUtils.closeConnection(conn);
        }
    }

    public void GetChart() throws SQLException, IOException {
        try {

            CallableStatement cblStmt = conn.prepareCall("{call TotalHours()}");
            cblStmt.execute();

            ResultSet rSet = cblStmt.getResultSet();
            int total = 0;
            String hsStr = "\"hours.svg\" [";
            while (rSet.next()) {
                hsStr += "(\"" + rSet.getString("WeekDay") + "\"," + rSet.getString("hrsavg") + ",e),";
            }
            hsStr = hsStr.substring(0, hsStr.length() - 1);
            hsStr += "]";
            String currPath = System.getProperty("user.dir");
            currPath = "\"C:\\My Data\\PLProject\\SlotSwap\\SlotSwap\\Haskell\\picharts.hs\" ";
            Process p = Runtime.getRuntime().exec("runghc " + currPath + hsStr);
            BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            ConnectionUtils.closeConnection(conn);
        }
    }

}
