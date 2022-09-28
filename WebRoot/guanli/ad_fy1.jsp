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

String	ynum	= new String(request.getParameter("ynum").getBytes("8859_1"));
String	yue	= new String(request.getParameter("yue").getBytes("8859_1"));
String	d	= new String(request.getParameter("d").getBytes("8859_1"));
String	s	= new String(request.getParameter("s").getBytes("8859_1"));
String	money	= new String(request.getParameter("money").getBytes("8859_1"));
String	wyf	= new String(request.getParameter("wyf").getBytes("8859_1"));
String 	  h_wnumc=(String)session.getAttribute("admin");//获取当前操作用户名



			String sql1="select * from fy where ynum='"+ynum+"' and   yue='"+yue+"'  ";

			ResultSet rs1=db1.executeQuery(sql1);

			if(rs1.next())
			{
			 rs1.close();
			%>
			<SCRIPT LANGUAGE="JavaScript">

			alert("本月此业主，数据已添加 已存在!");
			window.setInterval("submit01()",20000)
			history.back();

			</SCRIPT><%
			}else
			{
				rs1.close();
 

			String sql2="insert into fy(ynum,yue,d,s,money,wnum,wyf )values('"+ynum+"' , '"+yue+"', '"+d+"','"+s+"','"+money+"','"+h_wnumc+"','"+wyf+"'  )";

			db2.executeUpdate(sql2);
			 

						//插入日志
						db2.executeUpdate("insert into system_rz (wnum,remark) values('"+h_wnumc+"','添加费用:"+ynum+"')");
						db2.closeStmt();
						db2.closeConn();
			}
			
%>
 
 						<script>
							 window.alert("信息添加成功! ");
							self.setTimeout("exit()",1)
							function exit() 
							{
								document.addgo.action="ad_fy.jsp";
								document.addgo.submit();
							}
						</script> 
						

				<form action="ad_fy.jsp" method="post" name="addgo">

				</form> &nbsp;


