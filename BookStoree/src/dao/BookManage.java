package dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.*;

import entity.*;

public class BookManage extends HibernateDaoSupport {

	// ����µ�ͼ��
	public int addBook(Book book) {
		int i = 0;
		try {
			this.getHibernateTemplate().save(book);
			i = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	// �޸�ͼ��
	public int updateBook(Book book) {
		int i = 0;
		try {
			this.getHibernateTemplate().update(book);
			i = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	// ����ͼ��ID��ѯ��ͼ��
	public Book findBook(int bookId) {
		try {
			Book book = (Book) this.getHibernateTemplate().get("entity.Book",bookId);
			return book;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// ��ѯ������õ�ͼ��
	@SuppressWarnings("unchecked")
	public List<Book> bestSellingBook(int pageNumber, int pageSize) {
		String hql = "from Book as book where book.bookSales > 0 and book.bookAmount > 0 order by book.bookSales desc ";
		try {
			List<Book> bestSellingBook = this.getHibernateTemplate().find(hql);
			return bestSellingBook;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// ��ѯ�����ϼܵ�ͼ��
	@SuppressWarnings("unchecked")
	public List<Book> latestBook(int pageNumber, int pageSize) {
		String hql = "from Book as book where book.bookAmount > 0 order by book.bookShelveTime desc ";
		try {
			List<Book> latestBook = this.getHibernateTemplate().find(hql);
			return latestBook;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// ��ѯ�Ƽ�ͼ��ID
	@SuppressWarnings("unchecked")
	public List<Recommended> allRecommended(int pageNumber, int pageSize) {
		String hql = "from Recommended as recommended ";
		try {
			List<Recommended> allRecommended = this.getHibernateTemplate().find(hql);
			return allRecommended;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// ��ѯ�ؼ�ͼ��ID
	@SuppressWarnings("unchecked")
	public List<Bargain> allBargain(int pageNumber, int pageSize) {
		String hql = "from Bargain as bargain ";
		try {
			List<Bargain> allBargain = this.getHibernateTemplate().find(hql);
			return allBargain;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// ����ͼ�����Ʋ�ѯͼ��
	@SuppressWarnings("unchecked")
	public List<Book> allBookByName(String bookName, int pageNumber,
			int pageSize) {
		String hql = "from Book as book where book.bookName like '%" + bookName + "%'";
		try {
			this.getHibernateTemplate().setMaxResults(pageSize);
			List<Book> allBookByName = this.getHibernateTemplate().find(hql);
			return allBookByName;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// �������߲�ѯͼ��
	@SuppressWarnings("unchecked")
	public List<Book> allBookByAuthor(String bookAuthor, int pageNumber, int pageSize) {
		String hql = "from Book as book where book.bookAuthor like '%" + bookAuthor + "%'";
		try {
			this.getHibernateTemplate().setMaxResults(pageSize);
			List<Book> allBookByAuthor = this.getHibernateTemplate().find(hql);
			return allBookByAuthor;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// ���ݳ������ѯͼ��
	@SuppressWarnings("unchecked")
	public List<Book> allBookByPress(String bookPress, int pageNumber, int pageSize) {
		String hql = "from Book as book where book.bookPress like '%" + bookPress + "%'";
		try {
			this.getHibernateTemplate().setMaxResults(pageSize);
			List<Book> allBookByPress = this.getHibernateTemplate().find(hql);
			return allBookByPress;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	//�������ID����ȡ���
	public Type findType(int typeId){
		try{
			Type type = (Type)this.getHibernateTemplate().get("entity.Type", typeId);
			return type;
		}catch(RuntimeException re){
			throw re;
		}
	}
	
	//����ͼ���������ѯͼ��
	@SuppressWarnings("unchecked")
	public List<Book> allBookByType(int typeId, int pageNumber, int pageSize){
		String hql = "from Book as book where book.type.typeId="+typeId;
		try{
			List<Book> allBookByType= this.getHibernateTemplate().find(hql);
			return allBookByType;
		}catch(RuntimeException re){
			throw re;
		}
	}
	
	//��ѯͼ���Ƿ�Ϊ�ؼ�ͼ��
	@SuppressWarnings("unchecked")
	public Bargain isBargain(int bookId){
		Bargain bargain = null;
		String hql = "from Bargain as bargain where bargain.book.bookId="+bookId;
		try{
			List<Bargain> bargainList = this.getHibernateTemplate().find(hql); 
			if(bargainList.size() > 0){
				bargain = bargainList.get(0);
			}
		}catch(RuntimeException re){
			throw re;
		}
		return bargain;
	}
}
