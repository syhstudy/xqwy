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


	String sql2="BACKUP DATABASE xqwy TO disk = 'd:\\xqwy.dat'";

		db.executeUpdate(sql2);
		db.closeStmt();
		db.closeConn();


%>
 
 						<script>
							 window.alert("备份成功! ");
							self.setTimeout("exit()",1)
							function exit() 
							{
								document.addgo.action="manage.jsp";
								document.addgo.submit();
							}
						</script> 

				<form action="ad_admin.jsp" method="post" name="addgo">

				</form> &nbsp;