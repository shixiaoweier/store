<%@ page language="java" pageEncoding="gb2312"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
  <head>
	<link rel="stylesheet" type="text/css" href="css/styles.css">
  </head>

<body>
	<center>
		<s:action name="leftAction" executeResult="false"></s:action>
		<div id="left">
			<ul class="leftBook">
				<li class="leftBestSelling">
					�������а�
					<a class="more" href="oneType.jsp?searchType=bookStatus&searchDescribe=bestSelling">����..</a>
				</li>
				<s:iterator value="#request.bestSellingBook">
					<li class="leftBookPicture">
						<a href="singleBook.jsp?bookId=<s:property value="bookId" />"><img src='upload/<s:property value="bookPicture" />'/></a>
					</li>
					<li class="leftBookName">
						<a class="bookName" href="singleBook.jsp?bookId=<s:property value="bookId" />"><s:property value="bookName"/></a>
					</li>
					<li class="leftBookAuthor">
						���ߣ�<a class="aboutBook" href="oneType.jsp?searchType=bookAuthor&searchDescribe=<s:property value="bookAuthor"/>"><s:property value="bookAuthor"/></a>
					</li>
					<li class="leftBookPress">
						�����磺<a class="aboutBook" href="oneType.jsp?searchType=bookPress&searchDescribe=<s:property value="bookPress"/>"><s:property value="bookPress"/></a>
					</li>
					<li class="leftBookType">
						���<a class="aboutBook" href="oneType.jsp?searchType=bookType&searchDescribe=<s:property value="type.typeId"/>"><s:property value="type.typeName"/></a>
					</li>
					<li>
						<hr/>
					</li>
				</s:iterator>
			</ul>
		</div>
	</center>
</body>
