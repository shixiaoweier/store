<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>���ﳵ</title>
    
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
		<div id="shoppingCart">
			<div id="left">
				<jsp:include page="left.jsp"></jsp:include>
			</div>
			<div id="shoppingBook" style="padding-top: 20px;padding-left: 8px;">
				<ul class="shoppingBookUl">
					<li class="shoppingBookHead">�ҵĹ��ﳵ</li>
				</ul>
				<ul class="shoppingBookUl" style="background-color: yellow;">
					<li class="sequence">����</li>
					<li class="bookName">ͼ������</li>
					<li class="bookPrice">ͼ��۸�</li>
					<li class="bookAmount" style="padding-top: 5px;">��������</li>
					<li class="delete" style="padding-top: 5px;">ɾ��ͼ��</li>
				</ul>
				<s:if test="%{#session.shoppingBook != null}">
					<s:iterator value="#session.shoppingBook" status="st">
						<ul class="shoppingBookUl">
							<li class="sequence">
								<s:property value="#st.getIndex()+1"/>
							</li>
							<li class="bookName"><a class="bookName" href="singleBook.jsp?bookId=<s:property value="bookId" />"><s:property value="bookName"/></a></li>
							<li class="bookPrice"><s:property value="bookPrice"/> Ԫ</li>
							<li class="bookAmount">
								<input type="text" id="bookAmount<s:property value="bookId"/>" value='<s:property value="bookAmount"/>'/>
								<input type="button" value="�޸�" onclick="updateBookAmount('<s:property value="bookId"/>')">
							</li>
							<li class="delete">
								<input type="button" value="ɾ��" onclick="deleteBook('<s:property value="bookId"/>')">
							</li>
						</ul>
					</s:iterator>
					<ul class="shoppingBookUl">
						<li class="shoppingBookHead">
						<s:if test="%{#session.shoppingBook.size() > 0}">
							<input type="button" value="ȷ������" onclick="addOrders()">
						</s:if>
							�ܼƽ�<s:property value="#session.totalMoney"/> Ԫ
						</li>
					</ul>
				</s:if>
			</div>
		</div>
		<jsp:include page="bottom.html"></jsp:include>
	</center>
</body>
<SCRIPT type="text/javascript">
<!--
	function updateBookAmount(bookId){
		var pattern = /^[1-9][0-9]{0,}$/;
		var bookAmount = document.getElementById("bookAmount"+bookId).value;
		if(pattern.test(bookAmount)){
			location.href = "com.huizhi.action/updateCartAction.action?updateType=update&bookId="+bookId+"&bookAmount="+bookAmount;
		}
	}
	function deleteBook(bookId){
		if(confirm("ȷ��Ҫɾ����")){
			location.href = "com.huizhi.action/updateCartAction.action?updateType=delete&bookId="+bookId;
		}
	}
	function addOrders(){
		if(confirm("ȷ��Ҫ������")){
			location.href = "com.huizhi.action/ordersManageAction.action?updateType=add";
		}
	}
//-->
</SCRIPT>
</html>
