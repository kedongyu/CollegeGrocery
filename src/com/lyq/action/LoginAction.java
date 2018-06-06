package com.lyq.action;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5637850056897650959L;
	private final String SUCCESS="SUCCESS"; 
	public String login() {
		return SUCCESS;
	}
}
