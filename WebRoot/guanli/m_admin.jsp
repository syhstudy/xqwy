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
 
 
function detail(a)
{
	c="update_admin.jsp?rec_id="+a;
	window.open(c,'newj','height=460,width=740,top='+(screen.availHeight-460)/2+',left='+(screen.availWidth-740)/2+',toolbar=no,status=no,scrollbars=yes,menubar=no,location=no');
}

function del(vid){
    if (confirm("确定要删除此用户信息吗 ?"))
	{
	document.form1.action="deladmin.jsp?rec_id="+vid;
	document.form1.submit();
	}	
}
function submit01dfs()
{
	self.location.replace("m_admin.jsp")
}


 </script>

</head>

<body>
<%@  include file="top.jsp" %>



<%


String qwnum = null;
if (request.getParameter("qwnum") != null) {
	qwnum= new String(request.getParameter("qwnum").trim().getBytes("8859_1"));

}
String qtname = null;
if (request.getParameter("qtname") != null) {
	qtname= new String(request.getParameter("qtname").trim().getBytes("8859_1"));

}
if(qwnum==null)	
	{ 
		qwnum=(String)session.getValue("qwnum");
	}
if(qtname==null)	
	{ 
		qtname=(String)session.getValue("qtname");
	}

if(qwnum==null || qtname==null )
{
	qwnum="";
	qtname="";
 
}

session.putValue("qwnum",qwnum);
session.putValue("qtname",qtname);
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
                background="images/tab_active_bg.gif" class="tab"><strong>管理用户</strong></td>
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
countrs=db1.executeQuery("select count(*)as cnt from admins where   tpri<>3 and  wnum like '"+"%"+qwnum+"%"+"' and tname like '"+"%"+qtname+"%"+"'   ");

if(countrs.next())
totalRec=countrs.getInt("cnt");
countrs.close();
}
catch(Exception e){
e.printStackTrace();
}
int intPageCount=0;
intPageCount=(totalRec+pageLine-1)/pageLine;


String sql2="select top "+pageLine+" * from  admins where   tpri<>3 and  wnum like '"+"%"+qwnum+"%"+"' and tname like '"+"%"+qtname+"%"+"'     and  rec_id not in (select top "+((intPage-1)*pageLine)+" rec_id from  admins where   tpri<>3 and  wnum like '"+"%"+qwnum+"%"+"' and tname like '"+"%"+qtname+"%"+"'    order by rec_id  desc ) order by rec_id desc ";

ResultSet rs2=db1.executeQuery(sql2);

String	wnum	="";
String	wpswd	="";
String	tname	="";
String	tsex	="";
String	tdep	="";
String	tel	="";
String	address	="";
 
String addtime="";
		int s=0,insex=0;
%>
					<table width="100%"border="0" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
						<form name="form1" action="m_admin.jsp" method="post"  onsubmit="return isValid();" >
						<tr>
						 <td   bgcolor="#dddddd" colspan="12"> 用户名:
              <input type="text" name="qwnum" size="20" value="<%=qwnum%>"  >&nbsp;&nbsp;&nbsp;
姓名:
              <input type="text" name="qtname" size="20" value="<%=qtname%>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="q" value="查 询">
						 </td>
						</tr>
                          <tr>
                            <td  align="center" bgcolor="#dddddd">序号</td>
							<td height="27" align="center"    bgcolor="#dddddd">编号(帐号)</td>
							<td height="27" align="center"    bgcolor="#dddddd">角色</td>
							<td height="27" align="center"    bgcolor="#dddddd">姓名</td>
							<td height="27" align="center"    bgcolor="#dddddd">性别</td>
							<td height="27" align="center"    bgcolor="#dddddd">所在部门</td>
							<td height="27" align="center"    bgcolor="#dddddd">电话</td>
							<td height="27" align="center"    bgcolor="#dddddd">地址</td>
 							<td height="27" align="center"   width="150"   bgcolor="#dddddd">记录时间</td>
							<td height="27" align="center"    width ="56" bgcolor="#dddddd">修改</td>
							<td height="27" align="center"    width ="56" bgcolor="#dddddd">删除</td>
                          </tr>

				  <%
						int rec_id=0,tpri=0;
						String csp="";
						while(rs2.next())
						{
								s++;
								rec_id=rs2.getInt("rec_id");
 								wnum=rs2.getString("wnum");
								wpswd=rs2.getString("wpswd");
								tname=rs2.getString("tname");
								insex=rs2.getInt("tsex");
								if (insex==1)
										tsex="男";
								else
										tsex="女";
								tdep=rs2.getString("tdep");
								tpri=rs2.getInt("tpri");
								if(tpri==1)
									csp="小区服务员";
								if(tpri==2)
									csp="财务";
								if(tpri==4)
									csp="维修工";
								tel=rs2.getString("tel");
								address=rs2.getString("address");
  								addtime=rs2.getString("addtime");
					%>
					  <TR height="20"> 
						<td bgcolor="#FFFFFF" align="center"><%=s%></td>
							<td bgcolor="#FFFFFF" align="center"><%=wnum%></td>
							<td bgcolor="#FFFFFF" align="center"><%=csp%></td>
							<td bgcolor="#FFFFFF" align="center"><%=tname%></td>
							<td bgcolor="#FFFFFF" align="center"><%=tsex%></td>
							<td bgcolor="#FFFFFF" align="center"><%=tdep%></td>
							<td height="26" align="left" bgcolor="#FFFFFF">&nbsp;<%=tel%></td>
							<td height="26" align="left" bgcolor="#FFFFFF">&nbsp;<%=address%></td>
							<td bgcolor="#FFFFFF" align="center"><%=addtime.substring(0,19)%></td>
						<td bgcolor="#FFFFFF" align="center"><input type="button" value="修改" onclick="detail('<%=rec_id%>')"></td>
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
  out.print("<a href='m_admin.jsp?page=1' ><font color='#3300FF' size='2'>首页</font></a>&nbsp;");
  out.print("<a href='m_admin.jsp?page="+(intPage-1)+"' ><font color='#3300FF' size='2'>上一页</font></a>&nbsp; ");
    }
if(intPage-intPageCount>=0)
   out.print("下一页 尾页");
else{
  out.print("<a href='m_admin.jsp?page="+(intPage+1)+"'><font color='#3300FF' size='2'>下一页</font></a>&nbsp;<a href='m_admin.jsp?page="+intPageCount+"'><font color='#3300FF' size='2'>尾页</font></a>&nbsp;");
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




