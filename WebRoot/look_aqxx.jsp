<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>查看小区安全信息教育</title>

</head>

<body >

<jsp:useBean id="dep" scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="adn" scope="page" class="xqwy.xqwy"/>
<%

String rec_id=new String(request.getParameter("rec_id").trim().getBytes("8859_1"));

String gtitle="";
String ggcontent="";
String addtime="";
  
ResultSet rs3=dep.executeQuery("select * from aqxx  where  aq_id='"+rec_id+"'");

if (rs3.next())
{
					gtitle=rs3.getString("gtitle");
					ggcontent=rs3.getString("ggcontent");
					ggcontent = ggcontent.replaceAll("\n","<br><br>&nbsp;&nbsp;&nbsp;&nbsp;");//替换换行
				
%>
<center>
    
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td><table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#a8c7ce"  >
			  <tr>
 				<td  align="center" bgcolor="#FFFFFF" class="STYLE3" ><B><font size="5"><%=gtitle%></font></B>
				<br>
				</td>
			  </tr>
			  <tr>
				<td  height="300" bgcolor="#FFFFFF" align="left" valign="top"><br><br>
				<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=ggcontent%></font></td>
 			  </tr>
			  
 		</table>
	</td>
 </tr>
</table>
		</center>
<%


}
rs3.close();
%>

<center>
<input onclick="window.opener=null;window.close()" type="button" value=" 关闭 ">
</center>
</body>
</html>
