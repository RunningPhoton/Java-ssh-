package com.demo.services.impl;

import java.util.List;

import com.demo.database.data.TDemoUser;
import com.demo.database.idao.IDaoService;
import com.demo.services.ILoginService;

public class LoginServiceImpl implements ILoginService {
	
	private IDaoService idaoService;
	
	public IDaoService getIdaoService() {
		return idaoService;
	}

	public void setIdaoService(IDaoService idaoService) {
		this.idaoService = idaoService;
	}
	public List<TDemoUser> login(String userName, String password) throws Exception {
		String hql = "from TDemoUser where userName='"+userName+"' and userPassword='"+password+"'";
		System.out.println(hql);
		List<TDemoUser> list = (List<TDemoUser>) idaoService.query(hql);
		return list;
	}
}
