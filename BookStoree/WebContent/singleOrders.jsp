<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>�ҵĶ���</title>
    
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
			<s:action name="singleOrdersAction" executeResult="false"></s:action>
				<ul class="shoppingBookUl">
					<li class="shoppingBookHead">
						<s:property value="#request.orders.ordersNumber"/>
						&nbsp;&nbsp;&nbsp;&nbsp;
						�ܼƽ�<s:property value="#request.orders.totalMoney"/> Ԫ
						&nbsp;&nbsp;&nbsp;&nbsp;
						״̬��
						<s:if test='#request.orders.isDeal == "0"'>δ����</s:if>
						<s:else>�Ѵ���</s:else>
						&nbsp;&nbsp;&nbsp;&nbsp;
						���ڣ�<s:date name="#request.orders.ordersTime" format="yyyy-MM-dd HH:mm:ss"/>
					</li>
				</ul>
				<ul class="shoppingBookUl" style="background-color: yellow;">
					<li class="sequence">����</li>
					<li class="bookName">ͼ������</li>
					<li class="bookPrice">ͼ��۸�</li>
					<li class="bookAmount2">��������</li>
					<li class="bookPress">������</li>
				</ul>
				<s:iterator value="#request.bookList" status="st">
					<ul class="shoppingBookUl">
						<li class="sequence">
							<s:property value="#st.getIndex()+1"/>
						</li>
						<li class="bookName"><a class="bookName" href="singleBook.jsp?bookId=<s:property value="bookId" />"><s:property value="bookName"/></a></li>
						<li class="bookPrice"><s:property value="bookPrice"/> Ԫ</li>
						<li class="bookAmount2">
							<s:property value="bookAmount"/>
						</li>
						<li class="bookPress">
							<a class="aboutBook" href="oneType.jsp?searchType=bookPress&searchDescribe=<s:property value="bookPress"/>"><s:property value="bookPress"/></a>
						</li>
					</ul>
				</s:iterator>
			</div>
		</div>
		<jsp:include page="bottom.html"></jsp:include>
	</center>
</body>
</html>
