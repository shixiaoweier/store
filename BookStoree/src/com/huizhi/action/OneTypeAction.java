package com.huizhi.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.*;
import dao.*;
import entity.*;

@SuppressWarnings("serial")
public class OneTypeAction extends ActionSupport{
	
	private BookManage bookManage;
	public void setBookManage(BookManage bookManage) {
		this.bookManage = bookManage;
	}
	
	public String execute(){
		String page = "oneType";
		List<Book> bookList = new ArrayList<Book>();
		String typeDescribe = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		String searchType = request.getParameter("searchType");
		String searchDescribe = request.getParameter("searchDescribe");

		if(searchType == null || "".equals(searchType.trim())){
			page = "error";
		}
		else {
			if(searchDescribe == null || "".equals(searchDescribe.trim())){
				page = "error";
			}else{
				if("bookName".equals(searchType)){//��ͼ������
					bookList = bookManage.allBookByName(searchDescribe, 1, 10);
					typeDescribe = searchDescribe;
				}
				else if("bookAuthor".equals(searchType)){//����������
					bookList = bookManage.allBookByAuthor(searchDescribe, 1, 10);
					typeDescribe = searchDescribe;
				}
				else if("bookPress".equals(searchType)){//��������
					bookList = bookManage.allBookByPress(searchDescribe, 1, 10);
					typeDescribe = searchDescribe;
				}
				else if("bookType".equals(searchType)){//���鱾���
					int typeId = Integer.parseInt(searchDescribe);
					Type type = bookManage.findType(typeId);
					bookList = bookManage.allBookByType(typeId, 1, 10);
					typeDescribe = type.getTypeName();
				}
				else if("bookStatus".equals(searchType)){//���鱾��״��ָ�ؼۡ����������¡��Ƽ�
					if("bestSelling".equals(searchDescribe)){
						//������
						typeDescribe = "����ͼ��";
						bookList = bookManage.bestSellingBook(1, 10);
					}
					else if("latest".equals(searchDescribe)){
						//������
						typeDescribe = "����ͼ��";
						bookList = bookManage.latestBook(1, 10);
					}
					else if("recommended".equals(searchDescribe)){
						//�Ƽ���
						typeDescribe = "�Ƽ�ͼ��";
						List<Recommended> allRecommended = bookManage.allRecommended(1, 6);
						for(Recommended recommended : allRecommended){
							Book book = new Book();
							book = recommended.getBook();
							bookList.add(book);
						}
					}
					else if("bargain".equals(searchDescribe)){
						//�ؼ���
						typeDescribe = "�ؼ�ͼ��";
						List<Bargain> allBargain = bookManage.allBargain(1, 6);
						for(Bargain bargain : allBargain){
							Book book = new Book();
							book = bargain.getBook();
							bookList.add(book);
						}
					}else{
						page = "error";
					}
				}else{
					page = "error";
				}
			}
		}
		request.setAttribute("typeDescribe", typeDescribe);
		request.setAttribute("bookList", bookList);
		return page;
	}

}


