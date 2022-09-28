<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="db"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>处理业主维修信息</title>
 <style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
</style>
 <style type="text/css">
<!--
 
 
body,td,th {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}

-->
</style>
<script>
 
 

	 function checkform() 
{
 
	 if(document.forma.wxcontent.value=="")
	 {
		 alert("请输入维修内容！"); 
		 document.forma.wxcontent.focus();
		 return false;
	 }
 
}

 
 </script>

</head>

<body>

<%

 String rec_id= request.getParameter("rec_id") ;


String usersi =(String)session.getAttribute("admin");

String sta="" ;
 ResultSet rsh=db1.executeQuery("select * from admins where  wnum='"+usersi+"'");
if(rsh.next())
{
		sta=rsh.getString("tname");
}rsh.close();




String	tynum	="";
String	sbmc	="";
String	wtms	="";
String	szts="";
int zt=0; 
String addtime="";

String sql2="select * from bxxx where  rec_id='"+rec_id+"'";

 
ResultSet rs2=db.executeQuery(sql2);
 
if (rs2.next())
{
 								tynum=rs2.getString("ynum");
								sbmc=rs2.getString("sbmc");
								wtms=rs2.getString("wtms");
								zt=rs2.getInt("zt");
								addtime=rs2.getString("addtime");
}rs2.close();
 %>
<table class="tableBorder" width="98%" border="0" align="center" cellpadding="0"  bgcolor="#dddddd" cellspacing="1" >
<tr> 
<td  align="center"    colspan="2"   height="25"><span class="style1"><FONT SIZE="2" COLOR="#000000">处理业主维修信息</FONT></span></td>
</tr>
<tr> 
<td valign="top"> 
<table  width="100%" border="0" align="center" cellpadding="5" cellspacing="1">
<form name="forma" method="post" action="dealbx_ok.jsp"  onsubmit="return checkform();">
			<input type="hidden" name="rec_id" value="<%=rec_id%>" >
			<input type="hidden" name="wxg" value="<%=usersi%>" >
						  <tr>
                            <td height="18"  bgcolor="#EAEAEA" ><div align="right" >业主编号：</div></td>
                            <td  height="18" bgcolor="#EAEAEA"> &nbsp;&nbsp;<FONT SIZE="2" COLOR="#6600FF"><%=tynum%></FONT></td>
                          </tr>

						  <tr>
                            <td height="18"  bgcolor="#EAEAEA" ><div align="right" >设备名称：</div></td>
                            <td  height="18" bgcolor="#EAEAEA"> &nbsp;&nbsp;<FONT SIZE="2" COLOR="#6600FF"><%=sbmc%></FONT></td>
                          </tr>
						  <tr>
                            <td height="18"  bgcolor="#EAEAEA" ><div align="right" >问题描述：</div></td>
                            <td  height="130" bgcolor="#EAEAEA" valign="top" align="left"> &nbsp;&nbsp;<FONT SIZE="2" COLOR="#6600FF"><%=wtms%></FONT></td>
                          </tr>
						  <tr>
                            <td height="18"  bgcolor="#EAEAEA" ><div align="right" >报修时间：</div></td>
                            <td  height="18" bgcolor="#EAEAEA"> &nbsp;&nbsp;<FONT SIZE="2" COLOR="#6600FF"><%=addtime.substring(0,19)%></FONT></td>
                          </tr>
						  <tr>
                            <td height="18"  bgcolor="#FFFFFF" ><div align="right" >维修内容：</div></td>
                            <td  height="18"  bgcolor="#FFFFFF"> &nbsp;&nbsp;<textarea name="wxcontent" cols="70" rows="10"></textarea></td>
                          </tr>
						  <tr>
                            <td height="18"  bgcolor="#FFFFFF" ><div align="right" >维修员工：</div></td>
                            <td  height="18" bgcolor="#FFFFFF"> &nbsp;&nbsp;<FONT SIZE="2" COLOR="#6600FF"><%=sta%>(<%=usersi%>)</FONT></td>
                          </tr>


						  <tr >
						  <td height="30" colspan="2"  align="center"  >
						  <input type="submit" name="Submit" value="提交处理" >
						  </td>
						  </tr>
</form>
</table>
</td>
</tr>
</table>
</body>
</html>




