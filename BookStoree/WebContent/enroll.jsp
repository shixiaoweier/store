<%@ page language="java" pageEncoding="gb2312"%>
<%@taglib uri="/struts-tags" prefix="s"%>
 
<html> 
	<head>
		<title>�û�ע��</title>
	</head>
	<body>
		<center>
			<jsp:include page="top.jsp"></jsp:include>
			<div id="enroll">
				<h1>�û�ע��</h1><br/>
				<s:form action="enrollAction">
					<s:textfield label="�û���" name="userName"></s:textfield>
					<s:password label="����" name="userPassword"></s:password>
					<s:password label="�ظ�����" name="userRePassword"></s:password>
					<s:textfield label="����" name="userEmail"></s:textfield>
					<s:submit value="ע��"></s:submit>					
				</s:form>
			</div>
			<jsp:include page="bottom.html"></jsp:include>
		</center>
	</body>
</html>

