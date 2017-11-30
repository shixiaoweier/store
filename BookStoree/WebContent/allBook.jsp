<%@ page language="java" pageEncoding="gb2312"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link rel="stylesheet" type="text/css" href="css/styles.css">
  </head>
  
  <body>
    <center>
    	<s:action name="allBookAction" executeResult="false"></s:action>
    	<div id="allBook">
    		<ul class="allBookUl">
    			<li class="allBookHead">
    				�����ϼ�<a class="more" href="oneType.jsp?searchType=bookStatus&searchDescribe=latest">����..</a>
    			</li>
				<s:iterator value="#attr.latestBook" status="st">
					<li class="allBookPicture">
						<a href="singleBook.jsp?bookId=<s:property value="bookId" />"><img src='upload/<s:property value="bookPicture" />'/></a>
					</li>
					<li class="allBookInfor">
						<a class="bookName" href="singleBook.jsp?bookId=<s:property value="bookId" />"><s:property value="bookName" /></a><br/><br/>
						���ߣ�<a class="aboutBook" href="oneType.jsp?searchType=bookAuthor&searchDescribe=<s:property value="bookAuthor"/>"><s:property value="bookAuthor"/></a><br/><br/>
						�����磺<a class="aboutBook" href="oneType.jsp?searchType=bookPress&searchDescribe=<s:property value="bookPress"/>"><s:property value="bookPress"/></a><br/><br/>
						���<a class="aboutBook" href="oneType.jsp?searchType=bookType&searchDescribe=<s:property value="type.typeId"/>"><s:property value="type.typeName"/></a><br/><br/>
					</li>
				</s:iterator>
    		</ul>
    		<ul class="allBookUl">
    			<li class="allBookHead">
    				�ؼ�����<a class="more" href="oneType.jsp?searchType=bookStatus&searchDescribe=bargain">����..</a>
    			</li>
				<s:iterator value="#attr.bargainBook" status="st">
					<li class="allBookPicture">
						<a href="singleBook.jsp?bookId=<s:property value="bookId" />"><img src='upload/<s:property value="bookPicture" />'/></a>
					</li>
					<li class="allBookInfor">
						<a class="bookName" href="singleBook.jsp?bookId=<s:property value="bookId" />"><s:property value="bookName" /></a><br/><br/>
						���ߣ�<a class="aboutBook" href="oneType.jsp?searchType=bookAuthor&searchDescribe=<s:property value="bookAuthor"/>"><s:property value="bookAuthor"/></a><br/><br/>
						�����磺<a class="aboutBook" href="oneType.jsp?searchType=bookPress&searchDescribe=<s:property value="bookPress"/>"><s:property value="bookPress"/></a><br/><br/>
						���<a class="aboutBook" href="oneType.jsp?searchType=bookType&searchDescribe=<s:property value="type.typeId"/>"><s:property value="type.typeName"/></a><br/><br/>
					</li>
				</s:iterator>
    		</ul>
    		<ul class="allBookUl">
    			<li class="allBookHead">
    				��Ʒ�Ƽ�<a class="more" href="oneType.jsp?searchType=bookStatus&searchDescribe=recommended">����..</a>
    			</li>
				<s:iterator value="#attr.recommendedBook" status="st">
					<li class="allBookPicture">
						<a href="singleBook.jsp?bookId=<s:property value="bookId" />"><img src='upload/<s:property value="bookPicture" />'/></a>
					</li>
					<li class="allBookInfor">
						<a class="bookName" href="singleBook.jsp?bookId=<s:property value="bookId" />"><s:property value="bookName" /></a><br/><br/>
						���ߣ�<a class="aboutBook" href="oneType.jsp?searchType=bookAuthor&searchDescribe=<s:property value="bookAuthor"/>"><s:property value="bookAuthor"/></a><br/><br/>
						�����磺<a class="aboutBook" href="oneType.jsp?searchType=bookPress&searchDescribe=<s:property value="bookPress"/>"><s:property value="bookPress"/></a><br/><br/>
						���<a class="aboutBook" href="oneType.jsp?searchType=bookType&searchDescribe=<s:property value="type.typeId"/>"><s:property value="type.typeName"/></a><br/><br/>
					</li>
				</s:iterator>    			
    		</ul>
    	</div>
    </center>
  </body>
</html>