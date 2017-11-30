<%@ page language="java" pageEncoding="gb2312"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styles.css">

  </head>

<body background="image/body.gif">
	<center>
		<div id="top">
			<div id="logo">
				<a href="http://www.itzcn.com"><img src="image/logo.gif"/></a>
			</div>
			<div id="logoLink">
				���ã���
				<a href="http://school.itzcn.com/register.html" target="_top">ע��</a> | <a href="http://school.itzcn.com/login.php" target="_top">��¼</a> | <a href="http://school.itzcn.com/help.html" target="_blank">��������</a>
				| <a onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.itzcn.com');" href="#">��Ϊ��ҳ</a> | <a href="javascript:window.external.AddFavorite('http://www.itzcn.com')">�����ղ�</a>
			</div>
			<div id="searchBook">
				<a href="firstPage.jsp">��ҳ</a>
				<s:if test="%{#session.loginUser == null}">
					<font style="color:red;font-weight: bold">�ο�</font> 
					���ã���ӭ���ٻ������ <a href="enroll.jsp">ע��</a> <a href="login.jsp">��¼</a>
				</s:if>
				<s:else>
					<font style="color:green;font-weight: bold">
						 <s:property value="#session.loginUser.userName"/>
					</font>
					���ã���ӭ���ٻ������
					<a href="personalInformation.jsp">������Ϣ</a> <a href="shoppingCart.jsp">�ҵĹ��ﳵ</a> <a href="allOrders.jsp">�ҵĶ���</a> <a href="com.huizhi.action/userExitAction.action?userType=ordinaryUser">��ȫ�˳�</a>
				</s:else>
					&nbsp;&nbsp;&nbsp;&nbsp;��
					<input type="radio" name="searchType" value="bookName" checked="checked"/>����
					<input type="radio" name="searchType" value="bookAuthor"/>����
					<input type="radio" name="searchType" value="bookPress"/>������
					<input type="text" name="searchDescribe" id="searchDescribeID" />
					<input type="button" value="����ͼ��" onclick="searchBook()"/>
			</div>
			<hr/>
		</div>
	</center>
</body>
<SCRIPT type="text/javascript">
<!--
	function searchBook(){
		var searchType = "";
		for (i=0;i<document.all.searchType.length;i++){
		    if (document.all.searchType[i].checked){
		    	searchType = document.all.searchType[i].value;
		    }
	    }
		var searchDescribe = document.getElementById("searchDescribeID").value;
		location.href="oneType.jsp?searchType="+searchType+"&searchDescribe="+searchDescribe;
	}
//-->
</SCRIPT>
</html>