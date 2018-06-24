package com.lyq.action;

import java.util.Map;

import com.lyq.bean.Admin;
import com.lyq.bean.Student;
import com.lyq.bean.User;
import com.lyq.manager.AdminManager;
import com.lyq.manager.StudentManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements ModelDriven<User> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5637850056897650959L;
	private final String SUCCESS="SUCCESS"; 
	private final String ERROR="ERROR"; 
	
	
	private AdminManager aManager=null;
	private StudentManager sManager=null;
	private Map<String,Object> session;
	
	public LoginAction() {
		aManager=new AdminManager();
		sManager=new StudentManager();
	}
	
	/*
	 * µÇÂ½
	 */
	private User user=new User();
	public User getModel() {
		return user;
	}
	@SuppressWarnings("unchecked")
	public String login() {
		session =(Map<String,Object>)ActionContext.getContext().getSession();
		System.out.println(user.getPhone()+" "+user.getPassword());
		Admin admin=aManager.login(user.getPhone(), user.getPassword());
		if(admin==null)
			return ERROR;
		session.put("admin", admin);
		return SUCCESS;
	}
	/*
	 * ×¢²á
	 */
	private Admin admin=new Admin();
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public String register() {
		admin.setPower((short)2);
		System.out.println(admin.getEmail()+" "+admin.getPassword()+" "+admin.getPhone()+" "+admin.getName());
		Integer userId=aManager.addAdmin(admin);
		if(userId!=null) {
			return SUCCESS;
		}
		else
			return ERROR;
	}
	/**
	 * ÐÞ¸ÄÃÜÂë
	 * @return
	 */
	public String correctPassword() {
		System.out.println("id:"+2+" password:"+admin.getPassword());
		aManager.correctPassword(2, admin.getPassword());
		return SUCCESS;
	}
	public String correctUsername() {
		System.out.println("id:"+2);
		aManager.correctUsername(2, admin.getName());
		return SUCCESS;
	}
	public String correctPhone() {
		System.out.println("id:"+2);
		aManager.correctPhone(2, admin.getPhone());
		return SUCCESS;
	}
	public String correctEmail() {
		System.out.println("id:"+2);
		aManager.correctEmail(2, admin.getEmail());
		return SUCCESS;
	}
	private Student stu;
	private Admin adm;

	public String correctInfo() {
		session =(Map<String,Object>)ActionContext.getContext().getSession();
		Admin admin=(Admin)session.get("admin");
		aManager.correctPhone(admin.getId(), adm.getPhone());
		aManager.correctEmail(admin.getId(), adm.getEmail());
		aManager.correctUsername(admin.getId(), adm.getName());
		Integer id=sManager.correctStudent(admin.getId(), stu);
		adm=aManager.login(adm.getPhone(), user.getPassword());
		if(adm!=null)
			session.put("admin", adm);
		System.out.println(stu.getSchool()+stu.getCollege()+stu.getStuClass()+stu.getStuNum());
		if(id>0)
			return SUCCESS;
		else
			return SUCCESS;
	}
	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
	public Admin getAdm() {
		return adm;
	}
	public void setAdm(Admin adm) {
		this.adm = adm;
	}
	public String logout() {
		session =(Map<String,Object>)ActionContext.getContext().getSession();
		session.remove("admin");
		return SUCCESS;
	}
}
