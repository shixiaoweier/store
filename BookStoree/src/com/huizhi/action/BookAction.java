package com.huizhi.action;

import java.io.File;
import java.sql.Timestamp;
import java.text.*;
import java.util.*;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import dao.BookManage;
import entity.*;

@SuppressWarnings("serial")
public class BookAction extends ActionSupport{

	private String bookName;
	private String bookAuthor;
	private String bookPress;
	private String bookRemark;
	private int typeId;
	private int bookAmount;
	private double bookPrice;
	private BookManage bookManage;
	
	private File doc;
	private String fileName;
	private String contentType;
	private String dir;
	private String targetFileName;

	public void setDoc(File file) {
		this.doc = file;
	}

	public void setDocFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setDocContentType(String contentType) {
		this.contentType = contentType;
	}
	
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getTargetFileName() {
		return targetFileName;
	}
	public void setTargetFileName(String targetFileName) {
		this.targetFileName = targetFileName;
	}
	private String generateFileName(String fileName){
		DateFormat format = new SimpleDateFormat("yyMMddHHmmss");
		String formatDate = format.format(new Date());
		int random = new Random().nextInt(100000);
		int position = fileName.lastIndexOf(".");
		String extension = fileName.substring(position);
		return formatDate+random+extension;
	}
	
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public String getBookPress() {
		return bookPress;
	}
	public void setBookPress(String bookPress) {
		this.bookPress = bookPress;
	}
	public String getBookRemark() {
		return bookRemark;
	}
	public void setBookRemark(String bookRemark) {
		this.bookRemark = bookRemark;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public int getBookAmount() {
		return bookAmount;
	}
	public void setBookAmount(int bookAmount) {
		this.bookAmount = bookAmount;
	}
	public double getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(double bookPrice) {
		this.bookPrice = bookPrice;
	}
	public void setBookManage(BookManage bookManage) {
		this.bookManage = bookManage;
	}
	@SuppressWarnings("deprecation")
	public String execute(){
		String page = "success";
		String realPath = ServletActionContext.getRequest().getRealPath("/upload");
		String targetDirectory = realPath;
		targetFileName  =generateFileName(fileName);
		setDir(targetDirectory+"\\"+targetFileName);
		File target = new File(targetDirectory,targetFileName);
		try {
			FileUtils.copyFile(doc, target);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Book book = new Book();
		book.setBookName(bookName);
		book.setBookAuthor(bookAuthor);
		book.setBookPress(bookPress);
		book.setBookPicture(targetFileName);//ͼƬ��ַ
		book.setBookRemark(bookRemark);
		book.setBookPrice(bookPrice);
		book.setBookAmount(bookAmount);
		Type type = bookManage.findType(typeId);
		book.setType(type);//���
		book.setBookSales(0);
		
		String bookNumber = "TSBH";
		DateFormat format = new SimpleDateFormat("yyMMddHHmmss");
		String formatDate = format.format(new Date());
		int random = new Random().nextInt(100000);
		bookNumber += formatDate + random;
		
		book.setBookNumber(bookNumber);
		book.setBookShelveTime(new Timestamp(new Date().getTime()));
		bookManage.addBook(book);
		return page;
	}
}
