package com.demo.database.idao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.demo.database.idao.IDaoService;

/**
 * 数据库访问公共具体实现类
 * @author Teacher
 * @createTime 2017年3月10日 下午3:01:29
 * @version 1.0
 */
public class DaoServiceImpl implements IDaoService {

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	/**
	 * 打开并返回一个服务器与数据库的会话
	 * @return
	 */
	public Session getSession() {
		return sessionFactory.openSession();
	}

	@Override
	public List<? extends Object> query(String hql) throws Exception {
		//获得会话Session
		Session session = getSession();
		//创建查询数据的对象
		Query query = session.createQuery(hql);
		//查询返回数据集合
		List<? extends Object> list = query.list();
		//关闭session
		session.close();
		return list;
	}

	@Override
	public void save(Object object) throws Exception {
		Session session = getSession();
		//开启事务
		Transaction tx = session.beginTransaction();
		//对象与Session绑定
		session.save(object);
		//提交事务
		tx.commit();
		//关闭session
		session.close();
	}

	@Override
	public void update(Object object) throws Exception {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		session.update(object);
		tx.commit();
		session.close();
	}

	@Override
	public void delete(Object...objects) throws Exception {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		//遍历id数组，循环绑定要删除的对象
		for(Object object: objects) {
			//物理删除
			session.delete(object);
			//虚拟删除
//			session.update(object);
		}
		tx.commit();
		session.close();
	}

}
