package com.lyq.action;

import java.util.Map;

import com.lyq.bean.Admin;
import com.lyq.bean.User;
import com.lyq.manager.AdminManager;
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
	private Map<String,Object> request;
	
	public LoginAction() {
		aManager=new AdminManager();
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
		request =(Map<String,Object>)ActionContext.getContext().get("request");
		System.out.println(user.getPhone()+" "+user.getPassword());
		Admin admin=aManager.login(user.getPhone(), user.getPassword());
		if(admin==null)
			return ERROR;
		request.put("admin", admin);
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
}
