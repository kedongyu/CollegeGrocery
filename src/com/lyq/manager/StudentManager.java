package com.lyq.manager;

import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.lyq.bean.Admin;
import com.lyq.bean.Student;

public class StudentManager {
private static SessionFactory factory; 

	
	public StudentManager() {
		 try{
			 factory = new Configuration().configure()
		        		.addAnnotatedClass(Student.class)
		        		.buildSessionFactory();	      
			 }catch (Throwable ex) { 
	         System.err.println("Failed to create sessionFactory object." + ex);
	         throw new ExceptionInInitializerError(ex); 
	      }
		 
	}
	public Student getStudentByUserId(int userId) {
		Session session =factory.openSession();
		Transaction tx=null;
		Student student=null;
		try {
			tx=session.beginTransaction();
			String hql="From com.lyq.bean.Student S Where S.userId = "+userId;
			List list=session.createQuery(hql).list();
			for(Iterator it=list.iterator();it.hasNext();)
			{
				student=(Student)it.next();
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
		return student;
	}
	public List<Student> getStudentList() {
		Session session =factory.openSession();
		Transaction tx=null;
		List<Student> lists=null;
		try {
			tx=session.beginTransaction();
			String hql="From com.lyq.bean.Student S ";
			List list=session.createQuery(hql).list();
			for(Iterator it=list.iterator();it.hasNext();)
			{
				Student student=(Student)it.next();
				lists.add(student);
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
		return lists;
	}
	public Integer correctStudent(Integer userId,Student student) {
		Session session=factory.openSession();
		Transaction tx=null;		
		Integer id=null;
		try {
			tx=session.beginTransaction();
			String hql="From com.lyq.bean.Student S Where S.userId = "+userId;
			List list = session.createQuery(hql).list();
			for(Iterator it=list.iterator();it.hasNext();) {
				Student stu=(Student)it.next();
				stu.setCollege(student.getCollege());
				stu.setSchool(student.getSchool());
				stu.setStuClass(student.getStuClass());
				stu.setStuNum(student.getStuNum());
				id=(Integer)session.save(stu);
			}
			if(id==null)
			{
				student.setUserId(userId);
				id=(Integer)session.save(student);
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
		return id;
	}
}
