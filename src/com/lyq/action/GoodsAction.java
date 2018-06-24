package com.lyq.action;

import java.util.List;

import com.lyq.bean.Goods;
import com.lyq.bean.Order;
import com.lyq.manager.GoodsManager;
import com.lyq.manager.OrderManager;
import com.opensymphony.xwork2.ActionSupport;

public class GoodsAction extends ActionSupport {
	private final String SUCCESS="SUCCESS"; 
	private final String ERROR="ERROR";
	
	
	private GoodsManager gManager;
	public GoodsAction() {  
		gManager=new GoodsManager();
	}
	
	
	
	public Goods goods;
	
	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public String addGoods() {
		Integer result=gManager.addGoods(goods);
		
		if(result!=null) {
			return SUCCESS;
		}
		else {
			return ERROR;
		}
	}
	public String correctGoods() {
		System.out.println(goods.getId()+" "+goods.getName()+" "+goods.getDescribe()+" "+goods.getPrice());
		gManager.correct(goods.getId(), "NAME", goods.getName());
		gManager.correct(goods.getId(), "PRICE", goods.getPrice());
		gManager.correct(goods.getId(), "DESCRIBE", goods.getDescribe());
		return SUCCESS;
	}
	public String deleteGoods() {
		OrderManager oManager=new OrderManager();
		List<Order> list=oManager.getOrderListByGoodsId(goods.getId());
		for(Order o:list) {
			oManager.deleteOrder(o.getId());
		}
		gManager.deleteGoods(goods.getId());
		return SUCCESS;
	}
}
