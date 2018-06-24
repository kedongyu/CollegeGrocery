package com.lyq.action;

import com.lyq.bean.Order;
import com.lyq.manager.GoodsManager;
import com.lyq.manager.OrderManager;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport {
	private final String SUCCESS="SUCCESS"; 
	private final String ERROR="ERROR";
	
	
	private OrderManager oManager;
	public OrderAction() {  
		oManager=new OrderManager();
	}
	
	private Order order;
	
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public String addOrder() {
		System.out.println(order.getAddress()+" "+order.getGoodsCount()+" "+order.getRemark()+" "+order.getGoodsId()+" "+order.getOwerId());
		
		
		Integer result=oManager.addOrder(order);
		if(result>0)
			return SUCCESS;
		else
			return SUCCESS;
	}
}
