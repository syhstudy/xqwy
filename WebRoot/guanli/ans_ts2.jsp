<html>
<head>
<%@ page contentType="text/html; charset=gb2312"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dbh"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db2"  scope="page" class="xqwy.xqwy"/>

<%

 
String rec_id=request.getParameter("rec_id");
String answers= new String(request.getParameter("answers").getBytes("8859_1"));
String anys=(String)session.getAttribute("admin");

  			String sql2="update liuyuan set ans='"+1+"' ,answers='"+answers+"'  , answertime=getdate() ,anys='"+anys+"' where rec_id= '"+rec_id+"'";
 
		db2.executeUpdate(sql2);
 			db2.closeStmt();
			db2.closeConn();

	%>
<title>无标题文档</title>
</head>

<body bgcolor="#FFFFFF" text="#000000" onLoad="load2()">
<script language="JavaScript" type="text/JavaScript">
function load2() {
opener.setTimeout("submit0sd1()",15)
self.setTimeout("exit()",10)
}
function exit() {
window.close()
}
</script>

</body>
</html>
 

