package com.lyq.bean;

public class Student {
	private int id;
	private String school;
	private String college;
	private String stuClass;
	private String stuNum;
	private int userId;
	
	public Student() {
		
	}
	
	public Student(int id, String school, String college, String stuclass, String stuNum, int userId) {
		super();
		this.id = id;
		this.school = school;
		this.college = college;
		this.stuClass = stuclass;
		this.stuNum = stuNum;
		this.userId = userId;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getStuClass() {
		return stuClass;
	}
	public void setStuClass(String stuclass) {
		this.stuClass = stuclass;
	}
	public String getStuNum() {
		return stuNum;
	}
	public void setStuNum(String stuNum) {
		this.stuNum = stuNum;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
