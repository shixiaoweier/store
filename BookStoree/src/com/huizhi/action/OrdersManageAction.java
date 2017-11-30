package com.huizhi.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.*;
import entity.*;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@SuppressWarnings("serial")
public class OrdersManageAction extends ActionSupport{

	private OrdersManage ordersManage;
	public void setOrdersManage(OrdersManage ordersManage) {
		this.ordersManage = ordersManage;
	}

	@SuppressWarnings("unchecked")
	public String execute(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		String updateType = request.getParameter("updateType");
		if("add".equals(updateType)){
			
			List<Book> shoppingBook = (List)session.getAttribute("shoppingBook");
			double totalMoney = (Double)session.getAttribute("totalMoney");
			User user = (User)session.getAttribute("loginUser");
			Orders orders = new Orders();
			orders.setUser(user);
			orders.setOrdersTime(new Timestamp(new Date().getTime()));
			orders.setIsDeal("0");
			orders.setTotalMoney(totalMoney);
			String ordersNumber = "DDBH";
			DateFormat format = new SimpleDateFormat("yyMMddHHmmss");
			String formatDate = format.format(new Date());
			int random = new Random().nextInt(100000);
			ordersNumber +=  formatDate+random;
			
			orders.setOrdersNumber(ordersNumber);
			int ordersId = ordersManage.addOrders(orders);
			Orders newOrders = ordersManage.findOrders(ordersId);
			for(Book book : shoppingBook){
				Ordersbook ordersbook = new Ordersbook();
				ordersbook.setBook(book);
				ordersbook.setBookAmount(book.getBookAmount());
				ordersbook.setOrders(newOrders);
				ordersManage.addOrdersbook(ordersbook);
			}
			session.removeAttribute("shoppingBook");
			session.removeAttribute("totalMoney");
			return "success";
		}
		if("delete".equals(updateType)){
			String ordersId = request.getParameter("ordersId");
			int i = 0;
			i = ordersManage.deleteOrders(Integer.parseInt(ordersId));
			if(i == 0){
				return "error";
			}else{
				return "success";
			}
		}
		return null;
	}
}
