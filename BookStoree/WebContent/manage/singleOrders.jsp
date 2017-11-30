<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>������Ϣ</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  
<body>
	<center>
    	<jsp:include page="top.jsp"></jsp:include>	
		<div id="managePage">
			<div id="manageLeft">
				<jsp:include page="manageLeft.jsp"></jsp:include>
			</div>
			<div id="singleOrders">
			<s:action name="singleOrdersAction" executeResult="false"></s:action>
				<ul class="singleOrdersBook" style="background-color: rgb(23,157,244);">
					<li class="singleOrdersHead" style="color: white;text-align: left;padding-left: 10px;padding-top: 5px;">
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
				<ul class="singleOrdersBook" style="background-color: yellow;">
					<li class="sequence">����</li>
					<li class="bookName">ͼ������</li>
					<li class="bookPrice">ͼ��۸�</li>
					<li class="bookAmount">��������</li>
					<li class="bookPress">������</li>
				</ul>
				<s:iterator value="#request.bookList" status="st">
					<ul class="singleOrdersBook">
						<li class="sequence">
							<s:property value="#st.getIndex()+1"/>
						</li>
						<li class="bookName"><a class="bookName" href="singleBook.jsp?bookId=<s:property value="bookId" />"><s:property value="bookName"/></a></li>
						<li class="bookPrice"><s:property value="bookPrice"/> Ԫ</li>
						<li class="bookAmount">
							<s:property value="bookAmount"/>
						</li>
						<li class="bookPress">
							<a class="aboutBook" href="oneType.jsp?searchType=bookPress&searchDescribe=<s:property value="bookPress"/>"><s:property value="bookPress"/></a>
						</li>
					</ul>
				</s:iterator>
				<ul class="singleOrdersFoot">
					<li class="singleOrdersFoot">
						<s:if test='%{#request.orders.isDeal == "0"}'>
							<a class="aboutOrders" href='../com.huizhi.action/dealOrdersAction.action?ordersId=<s:property value="#request.orders.ordersId"/>'>������</a>
						</s:if>
						<s:else>
							----
						</s:else>
					</li>
				</ul>
			</div>
		</div>
		<jsp:include page="bottom.html"></jsp:include>
	</center>
</body>
</html>
