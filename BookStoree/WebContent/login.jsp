<%@ page language="java" pageEncoding="gb2312"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html> 
	<head>
		<title>�û���¼</title>
	</head>
	<body>
	<center>
		<jsp:include page="top.jsp"></jsp:include>
		<div id="login">
			<h1>�û���¼</h1><br/>
			<s:form action="loginAction">
				<s:textfield label="�û���" name="userName"></s:textfield>
				<s:password label="����" name="userPassword"></s:password>
				<s:submit value="��¼"></s:submit>
			</s:form>
		</div>
		<jsp:include page="bottom.html"></jsp:include>
	</center>
	</body>
</html>

