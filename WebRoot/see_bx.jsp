<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="db"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>查看业主报修信息</title>
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
 

</head>

<body>

<%

 String rec_id= request.getParameter("rec_id") ;


 
String sta="" ;





String	ynum	="";
String	sbmc	="";
String	wtms	="";
String	szts="";
int zt=0; 
String addtime="";

String wxcontent="",wxg="",wxtime="";
String sql2="select * from bxxx where  rec_id='"+rec_id+"'";

 
ResultSet rs2=db.executeQuery(sql2);
 
if (rs2.next())
{
 								ynum=rs2.getString("ynum");
								sbmc=rs2.getString("sbmc");
								wtms=rs2.getString("wtms");
								zt=rs2.getInt("zt");
								addtime=rs2.getString("addtime");

								wxcontent=rs2.getString("wxcontent");
								wxg=rs2.getString("wxg");
								wxtime=rs2.getString("wxtime");
 								switch(zt)
								{
									case 0 :szts="<FONT SIZE=2 COLOR=#6633FF>待维修</FONT>"; break;
									case 1 :szts="<FONT SIZE=2 COLOR=#336600>已修好</FONT>"; break;
								}
 
									 ResultSet rsh=db1.executeQuery("select * from admins where  wnum='"+wxg+"'");
									if(rsh.next())
									{
											sta=rsh.getString("tname");
									}rsh.close();
								if(zt==1)//维修好时才有记录
								{
 
									wxtime=wxtime.substring(0,19);
									wxg=wxg+"("+sta+")";
								}else
								{
									wxcontent="&nbsp;";
									wxg="&nbsp;";
									wxtime="&nbsp;";
 								}
}rs2.close();
 %>
<!--    <table  border="0" width="98%"  >  
	<tr>
		<td align="right" ><input name="pri" type="Button" onclick="window.print()" value="打印" /></td>
	</tr>
	</table> -->
<table class="tableBorder" width="98%" border="0" align="center" cellpadding="0"  bgcolor="#f1f1f1" cellspacing="1" >
<tr> 
<td  align="center"    colspan="2"   height="25"><span class="style1"><FONT SIZE="2" COLOR="#000000">查看业主报修信息</FONT></span></td>
</tr>
<tr> 
<td valign="top"> 
<table  width="100%" border="0" align="center" cellpadding="5" cellspacing="1">
<form name="forma" method="post" action="dealbx_ok.jsp"  onsubmit="return checkform();">
			<input type="hidden" name="rec_id" value="<%=rec_id%>" >
 						  <tr>
                            <td height="18"  bgcolor="#FFFFFF" ><div align="right" >业主编号：</div></td>
                            <td  height="18" bgcolor="#FFFFFF"> &nbsp;&nbsp;<FONT SIZE="2" COLOR="#6600FF"><%=ynum%></FONT></td>
                          </tr>

						  <tr>
                            <td height="18"  bgcolor="#FFFFFF" ><div align="right" >设备名称：</div></td>
                            <td  height="18" bgcolor="#FFFFFF"> &nbsp;&nbsp;<FONT SIZE="2" COLOR="#6600FF"><%=sbmc%></FONT></td>
                          </tr>
						  
						  <tr>
                            <td height="18"  bgcolor="#FFFFFF" ><div align="right" >问题描述：</div></td>
                            <td  height="130" bgcolor="#FFFFFF" valign="top" align="left"> &nbsp;&nbsp;<FONT SIZE="2" COLOR="#6600FF"><%=wtms%></FONT></td>
                          </tr>
						  <tr>
                            <td height="18"  bgcolor="#FFFFFF" ><div align="right" >状态：</div></td>
                            <td  height="18" bgcolor="#FFFFFF"> &nbsp;&nbsp;<%=szts%></td>
                          </tr>
						  <tr>
                            <td height="18"  bgcolor="#FFFFFF" ><div align="right" >报修时间：</div></td>
                            <td  height="18" bgcolor="#FFFFFF"> &nbsp;&nbsp;<FONT SIZE="2" COLOR="#6600FF"><%=addtime.substring(0,19)%></FONT></td>
                          </tr>
						  <tr>
                            <td height="18"  bgcolor="#FFFFFF" ><div align="right" >维修内容：</div></td>
                            <td  height="130" bgcolor="#FFFFFF" valign="top" align="left"> &nbsp;&nbsp;<FONT SIZE="2" COLOR="#6600FF"><%=wxcontent%></FONT></td>
                          </tr>
						  <tr>
                            <td height="18"  bgcolor="#FFFFFF" ><div align="right" >维修时间：</div></td>
                            <td  height="18" bgcolor="#FFFFFF"> &nbsp;&nbsp;<FONT SIZE="2" COLOR="#6600FF"><%=wxtime%></FONT></td>
                          </tr>
						  <tr>
                            <td height="18"  bgcolor="#FFFFFF" ><div align="right" >维修员工：</div></td>
                            <td  height="18" bgcolor="#FFFFFF"> &nbsp;&nbsp;<FONT SIZE="2" COLOR="#6600FF"><%=wxg%> </FONT></td>
                          </tr>


						  <tr >
						  <td height="30" colspan="2"  align="center"  >
						  <input onclick="window.opener=null;window.close()" type="button" value=" 关 闭 ">
						  </td>
						  </tr>
</form>
</table>
</td>
</tr>
</table>
</body>
</html>




