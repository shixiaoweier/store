<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�޸�ͼ��</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">

  </head>
  
<body>
	<center>
		<jsp:include page="top.jsp"></jsp:include>
		<div id="managePage">
			<div id="manageLeft">
				<jsp:include page="manageLeft.jsp"></jsp:include>
			</div>	
			<div id="addBook">
			<s:action name="singleBookAction" executeResult="false"></s:action>
				<h1>�޸�ͼ��</h1><br/>
				<s:form action="updateBookAction" method="post" enctype="multipart/form-data">
					<s:hidden name="bookId" value="%{#request.singleBook.bookId}"></s:hidden>
					<s:textfield label="����" name="bookName" value="%{#request.singleBook.bookName}"></s:textfield>
					<s:textfield label="����" name="bookAuthor" value="%{#request.singleBook.bookAuthor}"></s:textfield>
					<s:textfield label="������" name="bookPress" value="%{#request.singleBook.bookPress}"></s:textfield>
					<s:file label="ͼƬ" name="doc"></s:file>
					<s:select label="���" name="typeId" value="%{#request.singleBook..type.typeId}" list="#{'1':'��ѧ','2':'��ʷ','3':'����','4':'����','5':'����'}"></s:select>
					<s:textfield label="�۸�" name="bookPrice" value="%{#request.singleBook.bookPrice}"></s:textfield>
					<s:textfield label="����" name="bookAmount" value="%{#request.singleBook.bookAmount}"></s:textfield>
					<s:textarea label="���" name="bookRemark" value="%{#request.singleBook.bookRemark}"></s:textarea>
					<s:submit value="�޸�"></s:submit>
				</s:form>
			</div>
		</div>
		<jsp:include page="bottom.html"></jsp:include>		
	</center>
</body>
</html>
