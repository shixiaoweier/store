package dao;

import java.util.*;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import entity.*;

public class PersonManage extends HibernateDaoSupport {

	//����Ա��¼��֤
	@SuppressWarnings("unchecked")
	public boolean checkManager(String managerName,String managerPassword){
		boolean flag = false;
		String hql = "from Manager as manager where manager.managerName = '"+managerName+"' and manager.managerPassword = '"+managerPassword+"'";
		List<Manager> managerList = this.getHibernateTemplate().find(hql);
		if(managerList.size()>0){
			flag = true;
		}
		return flag;
	}
	
	//��ȡ�û���Ϣ
	public User findUser(int userId){
		try{
			User user = (User)this.getHibernateTemplate().get("entity.User", userId);
			return user;
		}catch(RuntimeException re){
			throw re;
		}
	}
	
	//��ͨ�û���¼��֤
	@SuppressWarnings("unchecked")
	public User checkUser(String userName,String userPassword){
		String hql = "from User as user where user.userName = '"+userName+"' and user.userPassword = '"+userPassword+"'";
		User user = null;
		try{
			List<User> userList = this.getHibernateTemplate().find(hql);
			if(userList.size() > 0){
				user = new User();
				user = userList.get(0);
			}
		}catch(RuntimeException re){
			throw re;
		}
		return user;
	}
	//���ע���û����Ƿ��Ѿ�����
	@SuppressWarnings("unchecked")
	public boolean isUserNameExist(String userName){
		boolean flag = true;
		String hql = "from User as user where user.userName = '"+userName+"'";
		try{
			List<User> userList= this.getHibernateTemplate().find(hql);
			if(userList.size() == 0){
				flag = false;
			}
			return flag;
		}catch (RuntimeException re) {
			throw re;
		}
	}
	//���һ���û���Ϣ
	public int addUser(User user){
		int i = 0;
		try{
			this.getHibernateTemplate().save(user);
			i = 1;
		}catch(RuntimeException re){
			throw re;
		}
		return i ;
	}
	//�޸�һ���û���Ϣ
	public int updateUserInfor(User user){
		int i = 0;
		try{
			this.getHibernateTemplate().update(user);
			i = 1;
		}catch (RuntimeException re) {
			throw re;
		}
		return i;
	}
	//����sexId��ѯSex
	public Sex findSex(int sexId){
		try{
			Sex sex = (Sex)this.getHibernateTemplate().get("entity.Sex", sexId);
			return sex;
		}catch (RuntimeException re) {
			throw re;
		}
	}
}
