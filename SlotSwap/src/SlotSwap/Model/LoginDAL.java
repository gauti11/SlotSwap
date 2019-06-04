package SlotSwap.Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.jasper.tagplugins.jstl.core.Catch;

import SlotSwap.Entity.LoginEntity;
import SlotSwap.Entity.UserDetailEntity;
import SlotSwap.Utils.ConnectionUtils;

public class LoginDAL {
	private Connection conn = null;

	public LoginDAL() throws ClassNotFoundException, SQLException {
		conn = ConnectionUtils.getConnection();
	}

	public UserDetailEntity isValidUser(LoginEntity loginEntity) throws SQLException {
		UserDetailEntity user = null;
		try {
			
			CallableStatement cblStmt = conn.prepareCall("{call isValidUser(?,?)}");

			cblStmt.setString(1, loginEntity.getEmail());
			cblStmt.setString(2, loginEntity.getPassword());
			cblStmt.execute();
			ResultSet rSet = cblStmt.getResultSet();
			if (rSet.next()) {
				user = new UserDetailEntity();
				user.setEmail(rSet.getString("Email"));
				user.setRoleId(rSet.getInt("RoleId"));
				user.setFirstName(rSet.getString("FirstName"));
				user.setLastName(rSet.getString("LastName"));
                                user.setUserId(rSet.getInt("UserId"));
			}

		} catch (Exception ex) {
			//ConnectionUtils.closeConnection(conn);
		}
		finally {
			//ConnectionUtils.closeConnection(conn);
		}
		return user;
	}
}
