<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="db"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>


<%
String rec_id=request.getParameter("rec_id");

  String l= new String(request.getParameter("l").getBytes("8859_1"));
String d= new String(request.getParameter("d").getBytes("8859_1"));
String yname= new String(request.getParameter("yname").getBytes("8859_1"));
String sex= new String(request.getParameter("sex").getBytes("8859_1"));
String mz= new String(request.getParameter("mz").getBytes("8859_1"));
String intime= new String(request.getParameter("intime").getBytes("8859_1"));
String tel= new String(request.getParameter("tel").getBytes("8859_1"));
String remark= new String(request.getParameter("remark").getBytes("8859_1"));




String advshow=request.getParameter("advshow");

String sql2="";
if(advshow==null)
{
	  sql2="update yz set     l='"+l+"' ,d='"+d+"',yname='"+yname+"'  ,sex='"+sex+"',mz='"+mz+"' ,intime='"+intime+"' ,tel='"+tel+"',remark='"+remark+"' where rec_id= '"+rec_id+"'";
}else
{
	String wpswd2=request.getParameter("wpswd2");

	  sql2="update yz set      pawd='"+wpswd2+"' ,l='"+l+"' ,d='"+d+"',yname='"+yname+"'  ,sex='"+sex+"',mz='"+mz+"' ,intime='"+intime+"' ,tel='"+tel+"',remark='"+remark+"' where rec_id= '"+rec_id+"'";
}
 
			
			db.executeUpdate(sql2);
			db.closeStmt();
			db.closeConn();
 			//插入日志
			String 	  yadmin=(String)session.getAttribute("admin");//获取当前业主业主名

			db1.executeUpdate("insert into system_rz (wnum,remark) values('"+yadmin+"','更改业主信息ID:"+rec_id+"')");
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



