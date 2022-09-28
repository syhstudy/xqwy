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

String ynum= new String(request.getParameter("ynum").getBytes("8859_1"));
String pawd= new String(request.getParameter("pawd2").getBytes("8859_1"));
String l= new String(request.getParameter("l").getBytes("8859_1"));
String d= new String(request.getParameter("d").getBytes("8859_1"));
String yname= new String(request.getParameter("yname").getBytes("8859_1"));
String sex= new String(request.getParameter("sex").getBytes("8859_1"));
String mz= new String(request.getParameter("mz").getBytes("8859_1"));
String intime= new String(request.getParameter("intime").getBytes("8859_1"));
String tel= new String(request.getParameter("tel").getBytes("8859_1"));
String remark= new String(request.getParameter("remark").getBytes("8859_1"));



String sql1="select * from yz where ynum='"+ynum+"'  or l='"+l+"' and d='"+d+"'  ";

ResultSet rs1=db1.executeQuery(sql1);

if(rs1.next())
{
 rs1.close();
%>
<SCRIPT LANGUAGE="JavaScript">

alert("此 编号 或　楼/单号 已存在!");
window.setInterval("submit01()",20000)
history.back();

</SCRIPT><%
}else
{
	rs1.close();
String sql2="insert into yz(ynum,pawd,l,d,yname,sex,mz,intime,tel,remark )values('"+ynum+"','"+pawd+"','"+l+"', '"+d+"', '"+yname+"', '"+sex+"','"+mz+"'  ,'"+intime+"','"+tel+"','"+remark+"' )";

db2.executeUpdate(sql2);
 
			String 	  h_wnumc=(String)session.getAttribute("admin");//获取当前用户用户名

			//插入日志
			db2.executeUpdate("insert into system_rz (wnum,remark) values('"+h_wnumc+"','添加业主，ID:"+ynum+"')");
			db2.closeStmt();
			db2.closeConn();

}
%>
 
 						<script>
							 window.alert("信息添加成功! ");
							self.setTimeout("exit()",1)
							function exit() 
							{
								document.addgo.action="ad_yz.jsp";
								document.addgo.submit();
							}
						</script> 

				<form action="ad_yz.jsp" method="post" name="addgo">

				</form> &nbsp;


