/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SlotSwap.Model;

import SlotSwap.Entity.LoginEntity;
import SlotSwap.Entity.SearchEntity;
import SlotSwap.Entity.SearchResultEntity;
import SlotSwap.Entity.SlotEntity;
import SlotSwap.Entity.UserDetailEntity;
import SlotSwap.Utils.ConnectionUtils;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.file.Paths;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author amitk
 */
public class UserDAL {

    private Connection conn = null;

    public UserDAL() throws ClassNotFoundException, SQLException {
        conn = ConnectionUtils.getConnection();
    }

    public SearchResultEntity getSlotList(int userId) throws SQLException {
        SearchResultEntity searchResult = new SearchResultEntity();
        List<SlotEntity> slotList = new ArrayList<SlotEntity>();
        try {

            CallableStatement cblStmt = conn.prepareCall("{call SlotList(?)}");

            cblStmt.setInt(1, userId);

            boolean a = cblStmt.execute();
            ResultSet rSet = cblStmt.getResultSet();
            int total = 0;
            while (rSet.next()) {
                SlotEntity slot = new SlotEntity();
                total = rSet.getInt("TotalCount");
                slot.setTimeFrom(rSet.getString("TimeFrom"));
                slot.setTimeTo(rSet.getString("TimeTo"));
                slot.setWeekDay(rSet.getString("WeekDay"));
                slot.setSlotDate(rSet.getString("SlotDate"));
                slot.setIsActive(Boolean.parseBoolean(rSet.getString("IsActive")));
                slotList.add(slot);
            }

            searchResult.setTotal(total);
            searchResult.setRows(slotList);

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            ConnectionUtils.closeConnection(conn);
        }
        return searchResult;
    }
}
