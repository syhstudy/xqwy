 <%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>

<jsp:useBean id="db2"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db"  scope="page" class="xqwy.xqwy"/>
<link rel="stylesheet" type="text/css" href="images/Style.css">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE2 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>


<%@  include file="top.jsp" %>


<%
String	wnum	= new String(request.getParameter("wnum").getBytes("8859_1"));
String	p1	= new String(request.getParameter("p1").getBytes("8859_1"));
String	tname	= new String(request.getParameter("tname").getBytes("8859_1"));
String	tsex	= new String(request.getParameter("tsex").getBytes("8859_1"));
String	tdep	= new String(request.getParameter("tdep").getBytes("8859_1"));
String	tel	= new String(request.getParameter("tel").getBytes("8859_1"));
String	address	= new String(request.getParameter("address").getBytes("8859_1"));
String	pri	= new String(request.getParameter("pri").getBytes("8859_1"));
 
 
String sql1="select * from admins where wnum='"+wnum+"'";

ResultSet rs1=db.executeQuery(sql1);

if(rs1.next())
{
 rs1.close();
%>
<SCRIPT LANGUAGE="JavaScript">

alert("此 用户名  已存在!");
window.setInterval("submit01()",20000)
history.back();

</SCRIPT><%
}else
{


	rs1.close();
	//从session里获取用户的名字
	String sql2="insert into admins(wnum,wpswd,tname,tsex,tdep,tpri,tel,address )values('"+wnum+"','"+p1+"','"+tname+"','"+tsex+"','"+tdep+"','"+pri+"','"+tel+"','"+address+"')";

		db2.executeUpdate(sql2);
		db2.closeStmt();
		db2.closeConn();

 			//插入日志
			String 	  yadmin=(String)session.getAttribute("admin");//获取当前用户用户名
			db1.executeUpdate("insert into system_rz (wnum,remark) values('"+yadmin+"','添加用户信息:"+wnum+"')");
			db1.closeStmt();
			db1.closeConn();
}
%>
 
 						<script>
							 window.alert("信息添加成功! ");
							self.setTimeout("exit()",1)
							function exit() 
							{
								document.addgo.action="ad_admin.jsp";
								document.addgo.submit();
							}
						</script> 

				<form action="ad_admin.jsp" method="post" name="addgo">

				</form> &nbsp;


