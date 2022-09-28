<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="db"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>


<%
String rec_id=request.getParameter("rec_id");

String	tname	= new String(request.getParameter("tname").getBytes("8859_1"));
String	tsex	= new String(request.getParameter("tsex").getBytes("8859_1"));
String	tdep	= new String(request.getParameter("tdep").getBytes("8859_1"));
String	tel	= new String(request.getParameter("tel").getBytes("8859_1"));
String	address	= new String(request.getParameter("address").getBytes("8859_1"));
String	pri	= new String(request.getParameter("pri").getBytes("8859_1"));

String advshow=request.getParameter("advshow");

String sql2="";
if(advshow==null)
{
		sql2="update admins set tname='"+tname+"' ,tsex='"+tsex+"' ,tdep='"+tdep+"' ,tpri='"+pri+"' ,tel='"+tel+"' ,address='"+address+"' where rec_id= '"+rec_id+"'";
}else
{
	String wpswd2=request.getParameter("wpswd2");

		  sql2="update admins set wpswd='"+wpswd2+"', tname='"+tname+"' ,tsex='"+tsex+"' ,tdep='"+tdep+"'  ,tpri='"+pri+"',tel='"+tel+"' ,address='"+address+"' where rec_id= '"+rec_id+"'";
}
 
			
			db.executeUpdate(sql2);
			db.closeStmt();
			db.closeConn();
 			//插入日志
			String 	  yadmin=(String)session.getAttribute("admin");//获取当前用户用户名

			db1.executeUpdate("insert into system_rz (wnum,remark) values('"+yadmin+"','更改用户信息ID:"+rec_id+"')");
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



