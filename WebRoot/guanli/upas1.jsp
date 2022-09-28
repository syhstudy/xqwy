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
					String wpswd0=new String(request.getParameter("wpswd0").getBytes("8859_1"));
					String wpswd=new String(request.getParameter("wpswd1").getBytes("8859_1"));
					int yes=0;
					String s="select  * from admins where wnum='"+admin+"' and wpswd='"+wpswd0+"'";
					ResultSet rs2=db.executeQuery(s);
					if(rs2.next())
					{ 
						yes=1;
						String sql="update  admins set wpswd='"+wpswd+"' where wnum='"+admin+"'";
						db.executeUpdate(sql);
					}rs2.close();

if(yes==0)
{
		%>
 
 						<script>
							 window.alert("操作失败。\n提示： 旧密码是错误的! ");
							self.setTimeout("exit()",1)
							function exit() 
							{
								document.addgo.action="upas0.jsp";
								document.addgo.submit();
							}
						</script> 

				<form action="upas0.jsp" method="post" name="addgo">

				</form> &nbsp;<%
}else
{

 

		%>
 
 						<script>
							 window.alert("密码更改成功! ");
							self.setTimeout("exit()",1)
							function exit() 
							{
								document.addgo.action="upas0.jsp";
								document.addgo.submit();
							}
						</script> 

				<form action="upas0.jsp" method="post" name="addgo">

				</form> &nbsp;

			<%
}	%>
