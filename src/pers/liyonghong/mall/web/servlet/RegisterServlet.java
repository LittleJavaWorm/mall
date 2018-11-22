package pers.liyonghong.mall.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import pers.liyonghong.mall.beans.User;
import pers.liyonghong.mall.service.UserService;
import pers.liyonghong.mall.service.impl.UserServiceImpl;
import pers.liyonghong.mall.utils.UUIDGenerater;

/**
 * 注册Servlet
 */
//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserServiceImpl();
    
    public RegisterServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getParameter("method");
		System.out.println("method="+method);
		Map<String, String[]> params = request.getParameterMap();
		for(Map.Entry<String, String[]> entry : params.entrySet()) {
			System.out.println(entry.getKey());
		}
		
		User user = new User();
		try {
			BeanUtils.populate(user, params);
			
			user.setId(UUIDGenerater.getUUID());
			user.setGender(0);
			user.setBirthday("2018-12-4 12:11:34");
			user.setActivationCode("sgsgeyg");
			user.setIsActivated(0);
			user.setRegTime("2018-12-4 12:11:34");
			user.setHeadPortraitId("sdgsdg");
			user.setLastLoginTime("2018-12-4 12:11:34");
			user.setMemberLevel(1);
			
			userService.addUser(user);
		
		} catch (IllegalAccessException e1) {
			e1.printStackTrace();
		} catch (InvocationTargetException e1) {
			e1.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
