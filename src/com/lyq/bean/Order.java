package com.lyq.bean;

import java.util.Date;

public class Order {
	private int id;
	private int owerId;
	private int goodsId;
	private String address;
	private int goodsCount;
	private String remark;
	private Date date;
	private short state;
	
	public Order() {
		
	}
	
	
	public Order(int id, int owerId, int goodsId, String address, int goodsCount, String remark,Date date ,short state) {
		super();
		this.id = id;
		this.owerId = owerId;
		this.goodsId = goodsId;
		this.address = address;
		this.goodsCount = goodsCount;
		this.remark = remark;
		this.state = state;
		this.date=date;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOwerId() {
		return owerId;
	}
	public void setOwerId(int owerId) {
		this.owerId = owerId;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getGoodsCount() {
		return goodsCount;
	}
	public void setGoodsCount(int goodsCount) {
		this.goodsCount = goodsCount;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public short getState() {
		return state;
	}
	public void setState(short state) {
		this.state = state;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
