<%@ page language="java" pageEncoding="gb2312"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
  <head>
	<link rel="stylesheet" type="text/css" href="css/style.css">

  </head>

<body background="../image/body.gif">
	<center>
		<div id="top">
			<div id="logo">
				<a href="http://www.itzcn.com"><img src="../image/logo.gif"/></a>
			</div>
			<div id="logoLink">
				���ã���
				<a href="http://school.itzcn.com/register.html" target="_top">ע��</a> | <a href="http://school.itzcn.com/login.php" target="_top">��¼</a> | <a href="http://school.itzcn.com/help.html" target="_blank">��������</a>
				| <a onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.itzcn.com');" href="#">��Ϊ��ҳ</a> | <a href="javascript:window.external.AddFavorite('http://www.itzcn.com')">�����ղ�</a>
			</div>
			<div id="welcome">
				<font style="color:green;font-weight: bold">
					 <s:property value="#session.managerLoginName"/>
				</font>
				���ã���ӭ���ٻ������ <a href="../com.huizhi.action/userExitAction.action?userType=manager">��ȫ�˳�</a>
			</div>
			<hr/>
		</div>
	</center>
</body>
