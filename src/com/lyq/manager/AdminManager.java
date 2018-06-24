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
		if(admin!=null&&admin.getPassword().equals(password)) {
			return admin;
		}
		else {
			return null;
		}
	}
	/**
	 * 修改密码
	 */
	 public void correctPassword(Integer AdminID, String password ){
	      Session session = factory.openSession();
	      Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         Admin admin = (Admin)session.get(Admin.class, AdminID); 
	         admin.setPassword(password);
	         session.update(admin); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	   }
	 
	 public Admin getAdmin(Integer AdminId) {
		 Session session = factory.openSession();
	      Transaction tx = null;
	      Admin admin=null;
	      try{
	         tx = session.beginTransaction();
	         admin = (Admin)session.get(Admin.class, AdminId); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	      return admin;
	 }
	 
	 
	 /**
	  * 修改号码
	  * @param adminId
	  * @param phone
	  */
	 public void correctPhone(Integer adminId,String phone) {
		 Session session = factory.openSession();
		 Transaction tx=null;
		 try {
			 tx=session.beginTransaction();
			 Admin admin = (Admin)session.get(Admin.class,adminId);
			 admin.setPhone(phone);
			 session.update(admin);
			 tx.commit();
		 }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	 }
	 /**
	  * 修改邮箱
	  * @param adminId
	  * @param email
	  */
	 public void correctEmail(Integer adminId, String email) {
		 Session session= factory.openSession();
		 Transaction tx=null;
		 try {
			 tx=session.beginTransaction();
			 Admin admin=(Admin)session.get(Admin.class, adminId);
			 admin.setEmail(email);
			 session.update(admin);
			 tx.commit();
		 }
		 catch(HibernateException e) {
			 if(tx!=null) tx.rollback();
			 e.printStackTrace();
		 }
		 finally {
			 session.close();
		 }
	 }
	 /**
	  * 修改用户名
	  */
	 public void correctUsername(Integer adminId, String name) {
		 Session session= factory.openSession();
		 Transaction tx=null;
		 try {
			 tx=session.beginTransaction();
			 Admin admin=(Admin)session.get(Admin.class, adminId);
			 admin.setName(name);
			 session.update(admin);
			 tx.commit();
		 }
		 catch(HibernateException e) {
			 if(tx!=null) tx.rollback();
			 e.printStackTrace();
		 }
		 finally {
			 session.close();
		 }
	 }
	@Override
	protected void finalize() throws Throwable {
		// TODO 自动生成的方法存根
		super.finalize();
	}
	
}
