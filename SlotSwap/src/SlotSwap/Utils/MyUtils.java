package SlotSwap.Utils;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author GautiSpurs
 */

import SlotSwap.Entity.UserDetailEntity;
import javax.servlet.http.HttpSession;

public class MyUtils {

	// Store user info in Session.
	public static void storeLoginedUser(HttpSession session, UserDetailEntity userDetailEntity) {
		// On the JSP can access via ${loginedUser}
		session.setAttribute("loginedUser", userDetailEntity);
	}

	// Get the user information stored in the session.
	public static UserDetailEntity getLoginedUser(HttpSession session) {
		UserDetailEntity loginedUser = (UserDetailEntity) session.getAttribute("loginedUser");
		return loginedUser;
	}

}