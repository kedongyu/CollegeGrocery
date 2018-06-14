package com.lyq.manager;

import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.lyq.bean.Admin;

public class AdminManager {
	private static SessionFactory factory; 

	
	public AdminManager() {
		 try{
			 factory = new Configuration().configure()
		        		.addAnnotatedClass(Admin.class)
		        		.buildSessionFactory();	      
			 }catch (Throwable ex) { 
	         System.err.println("Failed to create sessionFactory object." + ex);
	         throw new ExceptionInInitializerError(ex); 
	      }
		 
	}
	/**
	 * 注册功能
	 * @param admin
	 * @return
	 */
	public Integer addAdmin(Admin admin){
	      Session session = factory.openSession();
	      Transaction tx = null;
	      Integer adminID = null;
	      try{
	         tx = session.beginTransaction();
	         adminID = (Integer) session.save(admin); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	      return adminID;
	   }
	/**
	 * 登陆功能
	 */
	public Admin login(String phone,String password) {
		Session session = factory.openSession();
		Transaction tx=null;
		Admin admin=null;
		try {
			tx= session.beginTransaction();
			String hql = "FROM com.lyq.bean.Admin A WHERE A.phone = "+phone;
			List admins = session.createQuery(hql).list(); 
			for(Iterator it=admins.iterator();it.hasNext();)
			{
				admin=(Admin)it.next();
			}
			tx.commit();
		}
		catch(HibernateException e) {
			if(tx!=null) tx.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		if(admin.getPassword().equals(password)) {
			return admin;
		}
		else {
			return null;
		}
	}
	@Override
	protected void finalize() throws Throwable {
		// TODO 自动生成的方法存根
		super.finalize();
	}
	
}
