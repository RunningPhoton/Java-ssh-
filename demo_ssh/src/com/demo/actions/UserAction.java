package com.demo.actions;

import java.util.List;

import com.demo.database.data.TDemoUser;
import com.demo.services.IUserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 用户管理的业务控制器
 * @author Teacher
 * @createTime 2017年3月23日 上午9:13:08
 * @version 1.0.0
 */
public class UserAction extends ActionSupport {
	
	private IUserService iuserService;
	private TDemoUser user;		//属性驱动，将客户端提交的数据自动封装给属性，当前是属性user
	private int[] ids;			//删除时，选中记录的ID数组
	
	public IUserService getIuserService() {
		return iuserService;
	}

	public void setIuserService(IUserService iuserService) {
		this.iuserService = iuserService;
	}
	public TDemoUser getUser() {
		return user;
	}

	public void setUser(TDemoUser user) {
		this.user = user;
	}
	
	
	public int[] getIds() {
		return ids;
	}

	public void setIds(int[] ids) {
		this.ids = ids;
	}

	/**
	 * 入口方法user!list.action
	 */
	public String execute() {
		System.out.println("执行Action中代码!");
		return SUCCESS;
	}
	
	public String list() {
		//System.out.println("执行Action.list()中代码!");
		try {
			//查询获得所有用户数据
			List<TDemoUser> list = iuserService.query();
			//数据添加Dao请求范围，数据转发给下一个视图页面
			ActionContext.getContext().getContextMap().put("list", list);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ERROR;
	}
	
	public String add() {
		System.out.println("执行了add");
		//通过业务接口，添加新用户
		try {
			iuserService.add(user);
			return list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ERROR;
	}
	
	public String update() {
		System.out.println("执行Action.update()中代码!");
		return SUCCESS;
	}
	
	public String delete() {
		System.out.println("执行Action.delete()中代码!");
		try {
			iuserService.delete(ids);
			return SUCCESS;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ERROR;
	}
	
}
