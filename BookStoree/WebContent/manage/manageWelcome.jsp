<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title>�����������</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  
<body>
	<center>
		<jsp:include page="top.jsp"></jsp:include>	
		<div id="managePage">
			<div id="manageLeft">
				<jsp:include page="manageLeft.jsp"></jsp:include>	
			</div>
			<div id="manageWelcome">
				<div style="font-weight: bold;font-size: 16px;">��ӭ����
					<font style="color: green;font-size: 24px;"><s:property value="#session.managerLoginName"/></font>
				</div>
				<div style="margin-top: 100px;">
					���ǹ�˾�����������
					<hr style="width: 200px;"/>
					һ��Ϊ������&nbsp;&nbsp;&nbsp;&nbsp;Ϊ������һ��
				</div>
			</div>
		</div>
		<jsp:include page="bottom.html"></jsp:include>		
	</center>
</body>
</html>
