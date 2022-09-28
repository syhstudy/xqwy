<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="db"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>后台管理系统</title>
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
<script>
 
 
 

function del(vid){
    if (confirm("确定要删除此日志信息吗 ?"))
	{
	document.form1.action="delrz.jsp?rec_id="+vid;
	document.form1.submit();
	}	
}
 

 </script>

</head>

<body>
<%@  include file="top.jsp" %>



<%


String qadminc = null;
if (request.getParameter("qadminc") != null) {
	qadminc= new String(request.getParameter("qadminc").trim().getBytes("8859_1"));

}
 
if(qadminc==null)	
	{ 
		qadminc=(String)session.getValue("qadminc");
	}
 
if(qadminc==null  )
{
	qadminc="";
 
 
}

session.putValue("qadminc",qadminc);
 
%>

<br />
<table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
  <tbody>
    <tr>
      <td style="PADDING-LEFT: 2px; HEIGHT: 22px" 
    background="images/tab_top_bg.gif"><table cellspacing="0" cellpadding="0" width="477" border="0">
        <tbody>
          <tr>
            <td width="147"><table height="22" cellspacing="0" cellpadding="0" border="0">
              <tbody>
                <tr>
                  <td width="3"><img id="tabImgLeft__0" height="22" 
                  src="images/tab_active_left.gif" width="3" /></td>
                  <td 
                background="images/tab_active_bg.gif" class="tab"><strong>管理用户操作日志</strong></td>
                  <td width="3"><img id="tabImgRight__0" height="22" 
                  src="images/tab_active_right.gif" 
            width="3" /></td>
                </tr>
              </tbody>
            </table></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr>
      <td bgcolor="#ffffff"><table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
          <tr>
            <td width="1" background="images/tab_bg.gif"><img height="1" 
            src="images/tab_bg.gif" width="1" /></td>
            <td width="100%" 
          valign="top" 
          style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px"><div id="tabContent__0" style="DISPLAY: block; VISIBILITY: visible">
              <table cellspacing="1" cellpadding="1" width="100%" align="center" 
            bgcolor="#8ccebd" border="0">
                <tbody>
                  <tr>
                    <td 
                style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px" 
                valign="top" bgcolor="#fffcf7">
				<!--0000000000000000000000000000000000000000000000000000000000000000000 -->
<%
int pageLine=10;
int totalRec=0;
int intPage=1;
int i;
if (request.getParameter("page")!=null)
intPage=Integer.parseInt(request.getParameter("page"));
try{
ResultSet countrs=null;
countrs=db1.executeQuery("select count(*)as cnt from  system_rz  where wnum like '"+"%"+qadminc+"%"+"'  ");

if(countrs.next())
totalRec=countrs.getInt("cnt");
countrs.close();
}
catch(Exception e){
e.printStackTrace();
}
int intPageCount=0;
intPageCount=(totalRec+pageLine-1)/pageLine;


String sql2="select top "+pageLine+" * from   system_rz  where wnum like '"+"%"+qadminc+"%"+"'  and  rec_id not in (select top "+((intPage-1)*pageLine)+" rec_id from    system_rz  where wnum like '"+"%"+qadminc+"%"+"'   order by rec_id desc  ) order by rec_id desc  ";

ResultSet rs2=db1.executeQuery(sql2);


String wnum="";
String addtime="";
String remark="";
int rec_id=0;
int s=0;
%>
					<table width="100%"border="0" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
						<form name="form1" action="m_rz.jsp" method="post"  onsubmit="return isValid();" >
						<tr>
						 <td   bgcolor="#dddddd" colspan="12"> 用户名:
              <input type="text" name="qadminc" size="20" value="<%=qadminc%>"  >&nbsp;&nbsp;&nbsp;
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="q" value="查 询">
						 </td>
						</tr>
                          <tr>
                            <td    width ="56"  align="center" bgcolor="#dddddd">序号</td>
							<td height="27" align="center" bgcolor="#dddddd">用户名</td>
							<td height="27" align="center"   bgcolor="#dddddd">操作日志</td>
 							<td height="27" align="center"   width="150"   bgcolor="#dddddd">记录时间</td>
							<td height="27" align="center"    width ="56" bgcolor="#dddddd">删除</td>
                          </tr>

				  <%
 						while(rs2.next())
						{
								s++;
								rec_id=rs2.getInt("rec_id");
								wnum=rs2.getString("wnum");
								remark=rs2.getString("remark");
								addtime=rs2.getString("addtime");
 
					%>
					  <TR height="20"> 
						<td bgcolor="#FFFFFF" align="center"><%=s%></td>
							<td height="26"  bgcolor="#FFFFFF" align="left"><%=wnum%></td>
							<td height="26" bgcolor="#FFFFFF" align="left"><%=remark%></td>
							<td bgcolor="#FFFFFF" align="center"><%=addtime.substring(0,19)%></td>
						<td bgcolor="#FFFFFF" align="center"><input type="button" value="删除" onclick="del('<%=rec_id%>')"> </td>
					  </TR>
					  <%
				}
				rs2.close();
				%>

						</form>
					 </table>

<center>
  <font size="2">
 <%
 if(intPageCount*pageLine<totalRec)
intPageCount++;
if(intPage>intPageCount)
  intPage=intPageCount;
if(intPage<1)
      intPage=1;
 if(intPage<2)
     out.print("首页 上一页  ");
else{
  out.print("<a href='m_rz.jsp?page=1' ><font color='#3300FF' size='2'>首页</font></a>&nbsp;");
  out.print("<a href='m_rz.jsp?page="+(intPage-1)+"' ><font color='#3300FF' size='2'>上一页</font></a>&nbsp; ");
    }
if(intPage-intPageCount>=0)
   out.print("下一页 尾页");
else{
  out.print("<a href='m_rz.jsp?page="+(intPage+1)+"'><font color='#3300FF' size='2'>下一页</font></a>&nbsp;<a href='m_rz.jsp?page="+intPageCount+"'><font color='#3300FF' size='2'>尾页</font></a>&nbsp;");
    }
out.print(" 页次:<b><font color=red>"+intPage+"</font>/<font color=red>"+intPageCount+"</font></b>页 ");
out.print("共<b><font color=red>"+totalRec+"</font></b>条记录  <b><font color=red>"+pageLine+"</font></b>条/页");
    %></font>
</center>

				<!--0000000000000000000000000000000000000000000000000000000000000000000 -->
                      <br />			
				</td>
                  </tr>
                </tbody>
              </table>
            </div></td>
            <td width="1" background="images/tab_bg.gif"><img height="1" 
            src="images/tab_bg.gif" width="1" /></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr>
      <td background="images/tab_bg.gif" bgcolor="#ffffff"><img height="1" 
      src="images/tab_bg.gif" width="1" /></td>
    </tr>
  </tbody>
</table>
</body>
</html>




