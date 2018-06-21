package com.lyq.manager;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.lyq.bean.Admin;
import com.lyq.bean.Goods;

public class GoodsManager {
	private SessionFactory factory;
	public GoodsManager() {
		try{
			 factory = new Configuration().configure()
		        		.addAnnotatedClass(Admin.class)
		        		.buildSessionFactory();	      
			 }catch (Throwable ex) { 
	         System.err.println("Failed to create sessionFactory object." + ex);
	         throw new ExceptionInInitializerError(ex); 
	      }
	} 
	public List<Goods> GetGoodList() {
		List<Goods> list=new ArrayList<Goods>();
		Session session=factory.openSession();
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			String hql="Form com.lyq.bean.Goods";	
			List l=session.createQuery(hql).list();
			for(Iterator it=l.iterator();it.hasNext();)
			{
				Goods goods=(Goods)it.next();
				list.add(goods);
			}
			tx.commit();
		}
		catch(HibernateException he) {
			if(tx!=null) tx.rollback();
			he.printStackTrace();
		}
		finally {
			session.close();
		}
		return list;
	}
	public List<Goods> GetGood(int adminId) {
		List<Goods> list=new ArrayList<Goods>();
		Session session=factory.openSession();
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			String hql="From com.lyq.bean.Goods G ";
			List l=session.createQuery(hql).list();
			for(Iterator it=l.iterator();it.hasNext();)
			{
				Goods goods=(Goods)it.next();
				if(goods.getManger_id()==adminId)
					list.add(goods);
			}
			tx.commit();
		}
		catch(HibernateException he) {
			if(tx!=null) tx.rollback();
			he.printStackTrace();
		}
		finally {
			session.close();
		}
		return list;
	}
}
