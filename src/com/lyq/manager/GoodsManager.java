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
		        		.addAnnotatedClass(Goods.class)
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
	public List<Goods> GetGoodByManagerId(int adminId) {
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
	public List<Goods> GetGood(String key) {
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
				if(goods.getDescribe().contains(key)||goods.getName().contains(key))
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
	public boolean correct(Integer goodsId, String type, Object object) {
		boolean result=false;
		 Session session= factory.openSession();
		 Transaction tx=null;
		 try {
			 tx=session.beginTransaction();
			 Goods gs=(Goods)session.get(Goods.class, goodsId);
			 switch(type) {
			 case "NAME":
				 gs.setName((String)object);
				 break;
			 case "PRICE":
				 gs.setPrice((Float)object);
				 break;
			 case "PATH":
				 gs.setPath((String)object);
				 break;
			 case "DESCRIBE":
				 gs.setDescribe((String)object);
				 break;
			 }
			 session.update(gs);
			 tx.commit();
			 result=true;
		 }
		 catch(HibernateException e) {
			 if(tx!=null) tx.rollback();
			 e.printStackTrace();
		 }
		 finally {
			 session.close();
		 }
		return result;
	 }
}
