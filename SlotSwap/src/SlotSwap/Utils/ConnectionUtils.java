package SlotSwap.Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtils {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		String hostName = "DESKTOP-764BF1R\\SQLEXPRESS";
		String instanceName = "SQLEXPRESS";
		String databaseName = "Scheduler";
		String userName = "sa";
		String password = "amit";

		String connectionURL = "jdbc:sqlserver://" + hostName + ";instance=" + instanceName + ";databaseName="
				+ databaseName;

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

		Connection conn = DriverManager.getConnection(connectionURL, userName, password);

		return conn;
	}

	public static void closeConnection(Connection conn) {
		try {
			conn.close();
		} catch (Exception e) {
		}
	}

	public static void rollBackConnection(Connection conn) {
		try {
			conn.rollback();
		} catch (Exception e) {
		}
	}
}
