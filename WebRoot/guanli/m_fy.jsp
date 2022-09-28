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
	c="update_fy.jsp?rec_id="+a;
	window.open(c,'newwih','height=460,width=740,top='+(screen.availHeight-460)/2+',left='+(screen.availWidth-740)/2+',toolbar=no,status=no,scrollbars=yes,menubar=no,location=no');

}

function del(vid){
    if (confirm("确定要删除此费用信息吗 ?"))
	{
	document.form1.action="delfy.jsp?rec_id="+vid;
	document.form1.submit();
	}	
}
function submit01dfs()
{
	self.location.replace("m_fy.jsp")
}


 </script>

</head>

<body>
<%@  include file="top.jsp" %>



<%
 


String qd = null;
if (request.getParameter("qd") != null) {
	qd= new String(request.getParameter("qd").trim().getBytes("8859_1"));

}
String ql = null;
if (request.getParameter("ql") != null) {
	ql= new String(request.getParameter("ql").trim().getBytes("8859_1"));

}
String qs = null;
if (request.getParameter("qs") != null) {
	qs= new String(request.getParameter("qs").trim().getBytes("8859_1"));

}
String qynum = null;
if (request.getParameter("qynum") != null) {
	qynum= new String(request.getParameter("qynum").trim().getBytes("8859_1"));

}

String qyue = null;
if (request.getParameter("qyue") != null) {
	qyue= new String(request.getParameter("qyue").trim().getBytes("8859_1"));

}
if(qd==null)
{	
	qd=(String)session.getValue("qd"); 
}
 
if(qs==null)
{	
	qs=(String)session.getValue("qs"); 
}
if(qynum==null)
{	
	qynum=(String)session.getValue("qynum"); 
}
if(qyue==null)
{	
	qyue=(String)session.getValue("qyue"); 
}
if(qd==null  || qs==null || qynum==null || qyue==null)
{
 	qd="";
 	qs="";
	qynum="";
	qyue="";
}
session.putValue("qd",qd);
 session.putValue("qs",qs);

session.putValue("qynum",qynum);
session.putValue("qyue",qyue);
 
 
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
                background="images/tab_active_bg.gif" class="tab"><strong>管理费用</strong></td>
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

					<table width="100%"border="0" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
						<form name="form1" action="m_fy.jsp" method="post"  onsubmit="return isValid();" >
						<tr>
						 <td   bgcolor="#dddddd" colspan="13"> 业主编号：<input type="text" name="qynum"  value="<%=qynum%>" size="20">&nbsp;&nbsp;
				电：<input type="text" name="qd" value="<%=qd%>" size="7">&nbsp;&nbsp;
				水：<input type="text" name="qs"  value="<%=qs%>"   size="7">&nbsp;&nbsp;
				月份：<input type="text" name="qyue"  value="<%=qyue%>"   size="7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="q" value="查 询">&nbsp;&nbsp;&nbsp;<input name="pri" type="Button" onclick="window.print()" value="打 印" />
						 </td>
						</tr>
                            <tr>
                            <td  align="center" bgcolor="#dddddd">序号</td>
							<td height="27" align="center"    bgcolor="#dddddd">业主编号</td>
							<td height="27" align="center"    bgcolor="#dddddd">楼号</td>
							<td height="27" align="center"    bgcolor="#dddddd">单元号</td>
							<td height="27" align="center"    bgcolor="#dddddd">业主姓名</td>
							<td height="27" align="center"    bgcolor="#dddddd">月份</td>
							<td height="27" align="center"    bgcolor="#dddddd">电量</td>
							<td height="27" align="center"    bgcolor="#dddddd">水量</td>
							<td height="27" align="center"    bgcolor="#dddddd">物业费</td>
							<td height="27" align="center"    bgcolor="#dddddd">所缴费用</td>
 							<td height="27" align="center"   width="150"   bgcolor="#dddddd">记录时间</td>
							<td height="27" align="center"    width ="56" bgcolor="#dddddd">查看</td>
							<td height="27" align="center"    width ="56" bgcolor="#dddddd">删除</td>
                          </tr>

				  <%
 
int pageLine=12;
int totalRec=0;
int intPage=1;
int i;
if (request.getParameter("page")!=null)
intPage=Integer.parseInt(request.getParameter("page"));
try{
ResultSet countrs=null;
countrs=db1.executeQuery("select count(*)as cnt from fy where ynum   like '"+"%"+qynum+"%"+"'  and  d   like '"+"%"+qd+"%"+"' and  s   like '"+"%"+qs+"%"+"'  and yue   like '"+"%"+qyue+"%"+"' ");

if(countrs.next())
totalRec=countrs.getInt("cnt");
countrs.close();
}
catch(Exception e){
e.printStackTrace();
}
int intPageCount=0;
intPageCount=(totalRec+pageLine-1)/pageLine;


String sql_i="select top "+pageLine+" *  from fy where ynum   like '"+"%"+qynum+"%"+"' and  d   like '"+"%"+qd+"%"+"'  and s   like '"+"%"+qs+"%"+"'  and yue   like '"+"%"+qyue+"%"+"'   and rec_id not in (select top "+((intPage-1)*pageLine)+" rec_id from  fy where ynum   like '"+"%"+qynum+"%"+"' and  d   like '"+"%"+qd+"%"+"'  and s   like '"+"%"+qs+"%"+"' and  yue   like '"+"%"+qyue+"%"+"'   order by rec_id  desc  ) order by rec_id  desc ";
 int s=0;
int rec_id=0;

 String	ynum	="";
String	l	="";
String	dd	="";
String	yname	="";
String	sex	="";
String	yue	="";
String	d	="";
String	wyf	="";
String	ss	="";
String	money	="";
String	wnum	="";
String addtime="";
String namse="";
ResultSet rs4=db1.executeQuery(sql_i);
 
						while(rs4.next())
						{
							s++;

								 rec_id=rs4.getInt("rec_id");
									ynum	=rs4.getString("ynum");
									yue	=rs4.getString("yue");
									d	=rs4.getString("d");
									ss	=rs4.getString("s");
									money	=rs4.getString("money");
									wnum	=rs4.getString("wnum");
									addtime	=rs4.getString("addtime");
									wyf	=rs4.getString("wyf");

								ResultSet rs5=db1.executeQuery("select * from admins where wnum='"+wnum+"' ");
								if(rs5.next())
								{
									namse=rs5.getString("tname");
								}
								rs5.close();

								ResultSet rs6=db1.executeQuery("select * from yz where ynum='"+ynum+"' ");
								if(rs6.next())
								{
									l	=rs6.getString("l");
									dd	=rs6.getString("d");
									yname	=rs6.getString("yname");
								}
								rs6.close();

 					%>
					  <TR height="20"> 
						<td bgcolor="#FFFFFF" align="center"><%=s%></td>
						<TD bgcolor="#FFFFFF"align="center"><%=ynum%></TD>
						<TD bgcolor="#FFFFFF"align="center"><%=l%></TD>
						<TD bgcolor="#FFFFFF"align="center"><%=dd%></TD>
						<TD bgcolor="#FFFFFF"align="center"><%=yname%></TD>
						<TD bgcolor="#FFFFFF"align="center"><%=yue%></TD>
						<TD bgcolor="#FFFFFF"align="center"><%=d%></TD>
						<TD bgcolor="#FFFFFF"align="center"><%=ss%></TD>
						<TD bgcolor="#FFFFFF"align="center"><%=wyf%></TD>
						<TD bgcolor="#FFFFFF"align="right"><FONT SIZE="2" COLOR="red"><B><%=money%>.00</B></FONT></TD>
						<td bgcolor="#FFFFFF" align="center"><%=addtime.substring(0,19)%></td>
						<td bgcolor="#FFFFFF" align="center"><input type="button" value="查看" onclick="detail('<%=rec_id%>')"></td>
						<td bgcolor="#FFFFFF" align="center"><input type="button" value="删除" onclick="del('<%=rec_id%>')"> </td>
					  </TR>
					  <%
				}
				rs4.close();
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
  out.print("<a href='m_fy.jsp?page=1' ><font color='#3300FF' size='2'>首页</font></a>&nbsp;");
  out.print("<a href='m_fy.jsp?page="+(intPage-1)+"' ><font color='#3300FF' size='2'>上一页</font></a>&nbsp; ");
    }
if(intPage-intPageCount>=0)
   out.print("下一页 尾页");
else{
  out.print("<a href='m_fy.jsp?page="+(intPage+1)+"'><font color='#3300FF' size='2'>下一页</font></a>&nbsp;<a href='m_fy.jsp?page="+intPageCount+"'><font color='#3300FF' size='2'>尾页</font></a>&nbsp;");
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




