<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
 <jsp:useBean id="ldb2" scope="page" class="xqwy.xqwy"/>
<style type="text/css">
#showMsg{
	width:200px;
	position:absolute;
	top:25px;
	right:5px;
	border:solid 1px #666666;
	padding:5px;
	color:#FF0000;
	background-color:#FFFFFF;
	z-index:1000;
}
</style>
<script language="javascript">
String.prototype.trim = function(){ return this.replace(/(^\s*)|(\s*$)/g, "");}

//显示错误信息
function ShowErrMsg(Info)
{
	document.getElementById("showMsg").innerHTML = Info;
}

window.onscroll = function()   
{   
	var t = document.documentElement.scrollTop + 25;     
	document.getElementById("showMsg").style.top = t + "px";
}
</script>

<div id="showMsg">欢迎使用...</div>
<%
String admin=(String)session.getAttribute("admin");
String sstname="";
	//3 会计　  2 　管理员   1　　小区服务员
	ResultSet ursc=ldb2.executeQuery("select * from admins where wnum='"+admin+"'");
	int u_pri=0;
	if(ursc.next())
	{
		sstname=ursc.getString("tname");
		u_pri=ursc.getInt("tpri");
	}
	ursc.close();
String strpris="";

if(u_pri==1)
	strpris="<FONT SIZE=2 COLOR=#FF6600><B>小区服务员</B></FONT>";

if(u_pri==3)
	strpris="<FONT SIZE=2 COLOR=#FF6600><B>管理员</B></FONT>";

if(u_pri==2)
 	strpris="<FONT SIZE=2 COLOR=#FF6600><B>财务</B></FONT>";
if(u_pri==4)
 	strpris="<FONT SIZE=2 COLOR=#FF6600><B>维修工</B></FONT>";	
%>
<table cellspacing="0" cellpadding="0" width="100%" align="center" bgcolor="#158AAD" 
border="0" style="border-bottom:2px solid #CCCCCC;border-top:2px solid #CCCCCC;">
  <tbody>
    <tr>
      <td nowrap="nowrap" width="2%"></td>
      <td nowrap="nowrap" width="2%"><a title="后退" href="javascript:history.back();"><img 
      height="15" src="images/jiantou-Control-a1.jpg" width="16" 
    border="0" /></a></td>
      <td nowrap="nowrap" width="89%"><table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
          <tr>
            <td align="center"><strong><FONT SIZE="2" COLOR="#FF6600"><%=admin %>(<%=sstname%>)</FONT></strong> ，权限:<B><%=strpris%></B>&nbsp;&nbsp;欢迎您登录 小区物业管理系统！</td>
            </tr>
        </tbody>
      </table></td>
      <td valign="bottom" nowrap="nowrap" width="4%" height="22"><a title="前进" 
      href="javascript:history.go(1);"><img height="16" 
      src="images/jiantou-Control-b2.jpg" width="15" align="right" border="0" /> </a>&nbsp; </td>
      <td nowrap="nowrap" align="right" width="3%">&nbsp;</td>
    </tr>
  </tbody>
</table>
