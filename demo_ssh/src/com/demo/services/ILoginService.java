package com.demo.services;

import java.util.List;

import com.demo.database.data.TDemoUser;


/**
 * 用户登录的业务接口
 * @author runningphoton
 *
 */
public interface ILoginService {
	/**
	 * 登录返回登录用户值list中
	 * @param userName
	 * @param password
	 * @return
	 * @throws Exception
	 */
	public List<TDemoUser> login(String userName, String password) throws Exception;
}
