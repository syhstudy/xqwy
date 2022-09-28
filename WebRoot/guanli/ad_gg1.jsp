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
 String	gtitle	= new String(request.getParameter("gtitle").getBytes("8859_1"));
String	ggcontent	= new String(request.getParameter("ggcontent").getBytes("8859_1"));
  
 
String sql1="select * from xqgg where gtitle='"+gtitle+"'";

ResultSet rs1=db.executeQuery(sql1);

if(rs1.next())
{
 rs1.close();
%>
<SCRIPT LANGUAGE="JavaScript">

alert("此 小区公告公告标题  已存在!");
window.setInterval("submit01()",20000)
history.back();

</SCRIPT><%
}else
{


	rs1.close();
	//从session里获取小区公告的名字
	String sql2="insert into xqgg(gtitle,ggcontent )values('"+gtitle+"','"+ggcontent+"' )";

		db2.executeUpdate(sql2);
		db2.closeStmt();
		db2.closeConn();

 			//插入日志
			String 	  yadmin=(String)session.getAttribute("admin");//获取当前操作用户名
			db1.executeUpdate("insert into system_rz (wnum,remark) values('"+yadmin+"','添加小区公告 ')");
			db1.closeStmt();
			db1.closeConn();
}
%>
 
 						<script>
							 window.alert("信息添加成功! ");
							self.setTimeout("exit()",1)
							function exit() 
							{
								document.addgo.action="ad_gg.jsp";
								document.addgo.submit();
							}
						</script> 

				<form action="ad_gg.jsp" method="post" name="addgo">

				</form> &nbsp;


