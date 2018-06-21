package com.lyq.bean;

public class Goods {
	private int id;
	private int name;
	private float price;
	private String path;
	private int manger_id;
	private String describe;
	public Goods() {
		
	}
	
	public Goods(int id, int name, float price, String path, int manger_id, String describe) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.path = path;
		this.manger_id = manger_id;
		this.describe = describe;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getName() {
		return name;
	}
	public void setName(int name) {
		this.name = name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getManger_id() {
		return manger_id;
	}
	public void setManger_id(int manger_id) {
		this.manger_id = manger_id;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	
}
