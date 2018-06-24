package com.lyq.manager;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.lyq.bean.*;

public class OrderManager {
private static SessionFactory factory; 

	
	public OrderManager() {
		 try{
			 factory = new Configuration().configure()
		        		.addAnnotatedClass(Order.class)
		        		.buildSessionFactory();	      
			 }catch (Throwable ex) { 
	         System.err.println("Failed to create sessionFactory object." + ex);
	         throw new ExceptionInInitializerError(ex); 
	      }
	}
	public Integer addOrder(Order order) {
		Integer result=null;
		Session session=factory.openSession();
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			result=(Integer)session.save(order);
			tx.commit();
		}
		catch(HibernateException he) {
			if(tx!=null) tx.rollback();
			he.printStackTrace();
		}
		finally {
			session.close();
		}
		return result;
	}
	public List<Order> getOrderListByOwerid(int OwerId){
		List<Order> list=new ArrayList<Order>();
		Session session=factory.openSession();
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			String hql="From com.lyq.bean.Order O where O.owerId = "+OwerId;
			List li = session.createQuery(hql).list();
			for(Iterator it=li.iterator();it.hasNext();)
			{
				Order order = (Order)it.next();
				list.add(order);
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
	public List<Order> getOrderListByGoodsId(int goodsId){
		List<Order> list=new ArrayList<Order>();
		Session session=factory.openSession();
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			String hql="From com.lyq.bean.Order O where O.goodsId = "+goodsId;
			List li = session.createQuery(hql).list();
			for(Iterator it=li.iterator();it.hasNext();)
			{
				Order order = (Order)it.next();
				list.add(order);
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

	 public void deleteOrder(Integer id){
	      Session session = factory.openSession();
	      Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         Order order = 
	                   (Order)session.get(Order.class, id); 
	         session.delete(order); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	   }
}
