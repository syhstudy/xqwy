<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="db"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>


<%
 
String rec_id= new String(request.getParameter("rec_id").trim().getBytes("8859_1"));

String	d	= new String(request.getParameter("d").getBytes("8859_1"));
String	s	= new String(request.getParameter("s").getBytes("8859_1"));
String	wyf	= new String(request.getParameter("wyf").getBytes("8859_1"));
String	money	= new String(request.getParameter("money").getBytes("8859_1"));

 
			String sql2="update fy set  d='"+d+"' ,s='"+s+"' ,wyf='"+wyf+"',money='"+money+"'    where rec_id= '"+rec_id+"'";
				
				db.executeUpdate(sql2);

							String 	  h_wnumc=(String)session.getAttribute("admin");//获取当前用户用户名

							//插入日志
							db.executeUpdate("insert into system_rz (wnum,remark) values('"+h_wnumc+"','更改费用信息ID:"+rec_id+"')");
							db.closeStmt();
							db.closeConn();
 


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



