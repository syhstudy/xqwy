<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="db"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>


<%
String rec_id=request.getParameter("rec_id");

 String	gtitle	= new String(request.getParameter("gtitle").getBytes("8859_1"));
String	ggcontent	= new String(request.getParameter("ggcontent").getBytes("8859_1"));


String sql2="update xqgg set gtitle='"+gtitle+"', ggcontent='"+ggcontent+"'  where rec_id= '"+rec_id+"'";
 
 
			
			db.executeUpdate(sql2);
			db.closeStmt();
			db.closeConn();
 			//插入日志
			String 	  yadmin=(String)session.getAttribute("admin");//获取当前操作用户名

			db1.executeUpdate("insert into system_rz (wnum,remark) values('"+yadmin+"','更改小区公告信息ID:"+rec_id+"')");
			db1.closeStmt();
			db1.closeConn();

%>
 

<title>无标题文档</title>
</head>

<body bgcolor="#FFFFFF" text="#000000" onLoad="load2()">
<script language="JavaScript" type="text/JavaScript">
function load2() {
opener.setTimeout("submit01dfs()",15)
self.setTimeout("exit()",10)
}
function exit() {
window.close()
}
</script>

</body>
</html>



