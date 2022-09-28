<html>
<head>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%

 
%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="db" scope="page" class="xqwy.xqwy"/>

<title>无标题文档</title>
</head>
<body>
<%

 			//插入日志
			String 	  yadmin=(String)session.getAttribute("admin");//获取当前用户用户名

			db.executeUpdate("insert into system_rz (wnum,remark) values('"+yadmin+"','退出系统')");
			db.closeStmt();
			db.closeConn();
		request.getSession().invalidate();
		response.sendRedirect("index.jsp");
%>

</body>
</html>
