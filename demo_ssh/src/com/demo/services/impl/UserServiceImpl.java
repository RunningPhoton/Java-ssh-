package com.demo.services.impl;

import java.sql.Timestamp;
import java.util.List;

import com.demo.database.data.TDemoUser;
import com.demo.database.idao.IDaoService;
import com.demo.services.IUserService;

/**
 * 用户管理的业务具体实现类
 * 
 * @author Teacher
 * @createTime 2017年3月23日 上午10:41:06
 * @version 1.0.0
 */
public class UserServiceImpl implements IUserService {

	private IDaoService idaoService;

	public IDaoService getIdaoService() {
		return idaoService;
	}

	public void setIdaoService(IDaoService idaoService) {
		this.idaoService = idaoService;
	}
	
	@Override
	public List<TDemoUser> query() throws Exception {
		//System.out.println("执行业务Bean中的query()方法!");
		//通过数据访问公共接口，查询用户数据
		List<TDemoUser> list = (List<TDemoUser>) 
				  idaoService.query("from TDemoUser "
				  		+ "where isdel='0' order by opertime desc"); //from TDemoUser    HQL语句
		return list;
	}

	@Override
	public void add(TDemoUser user) throws Exception {
		//封装用户通用字段数据
		user.setIsdel("0");
		user.setOpertime(new Timestamp(System.currentTimeMillis()));
		//访问数据库，保存新用户数据
		idaoService.save(user);
	}

	@Override
	public void delete(int... ids) throws Exception {
		//定义查询所有选中用户的sql语句
		String hql = "from TDemoUser where userId in(";
		//遍历数组
		for(int i = 0; i < ids.length; i++) {
			hql += ids[i];
			if(i < ids.length - 1) {
				hql += ",";
			}
		}
		hql += ")";
		//查询获得用户的集合
		List<TDemoUser> list = (List<TDemoUser>) idaoService.query(hql);
		//获得用户的数组
		Object[] objects = list.toArray();
		//访问数据库删除用户
		idaoService.delete(objects);
	}

}
