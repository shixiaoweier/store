<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>�޸�����</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styles.css">

  </head>
  
<body>
	<center>
		<jsp:include page="top.jsp"></jsp:include>
		<div id="updatePassword">
		<s:if test="%{#session.loginUser != null}">
			<h1>�޸�����</h1><br/>
			<s:form action="updatePasswordAction" method="post">
				<s:password label="ԭ����" name="userPassword"></s:password>
				<s:password label="������" name="newUserPassword"></s:password>
				<s:password label="�ظ�����" name="reNewUserPassword"></s:password>
				<s:submit value="�޸�"></s:submit>
			</s:form>
		</s:if>
		<s:else>
			<jsp:forward page="firstPage.jsp"></jsp:forward>
		</s:else>
		</div>
		<jsp:include page="bottom.html"></jsp:include>
	</center>
</body>
</html>
