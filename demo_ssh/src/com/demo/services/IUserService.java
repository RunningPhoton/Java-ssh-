package com.demo.services;

import java.util.List;

import com.demo.database.data.TDemoUser;

/**
 * 用户管理的业务接口
 * @author Teacher
 * @createTime 2017年3月23日 上午10:37:45
 * @version 1.0.0
 */
public interface IUserService {

	/**
	 * 查询所有用户数据
	 * @return
	 * @throws Exception
	 */
	public List<TDemoUser> query() throws Exception;
	public void add(TDemoUser user) throws Exception;
	public void delete(int...ids) throws Exception;
}
