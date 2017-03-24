package com.demo.actions;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.demo.database.data.TDemoUser;
import com.demo.services.ILoginService;
import com.demo.services.IUserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 用户管理的业务控制器
 * 
 * @author Teacher
 * @createTime 2017年3月23日 上午9:13:08
 * @version 1.0.0
 */
public class LoginAction extends ActionSupport {

	private ILoginService iloginService;
	private TDemoUser user;

	// 实现接口中的方法

	public ILoginService getIloginService() {
		return iloginService;
	}

	public void setIloginService(ILoginService iloginService) {
		this.iloginService = iloginService;
	}
	
	public TDemoUser getUser() {
		return user;
	}

	public void setUser(TDemoUser user) {
		this.user = user;
	}

	/**
	 * 入口方法
	 * 
	 * @throws Exception
	 */
	public String execute() {
		System.out.println("执行66666Action中代码!");
		try {
			System.out.println("userName : " + user.getUserName() + 
					" userPassword: " + user.getUserPassword());
			
			List<TDemoUser> list = iloginService.login(user.getUserName(), user.getUserPassword());
			if(list.size() > 0) return SUCCESS;
			return "loginFail";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
	}

}
