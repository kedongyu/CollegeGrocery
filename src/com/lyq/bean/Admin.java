package com.lyq.bean;

public class Admin {
	private int id;
	private String phone;
	private String name;
	private String email;
	private String password;
	private short power;
	
	public Admin() {
		
	}
	public Admin(String phone, String name, String email, String password, short power) {
		this.phone = phone;
		this.name = name;
		this.email = email;
		this.password = password;
		this.power = power;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public short getPower() {
		return power;
	}
	public void setPower(short power) {
		this.power = power;
	}
	
}
