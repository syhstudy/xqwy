<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>选择业主</title>
 <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
	table-layout:fixed;
}
-->
</style>
<style type="text/css">
<!--
body {
	margin-left: 5px;
	margin-top: 5px;
	margin-right: 5px;
	margin-bottom: 5px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: ##408080
	font-weight: bold;
	font-size: 12px;
}
.STYLE2 {
	font-size: 12px;
	color: #03515d;
}
a:link {font-size:12px; text-decoration:none; color:#03515d;}
a:visited{font-size:12px; text-decoration:none; color:#03515d;}
-->
</style>

 
</head>

<body>
 
<jsp:useBean id="db1" scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db2" scope="page" class="xqwy.xqwy"/>
 
<%
 

String qynum = null;
if (request.getParameter("qynum") != null) {
	qynum= new String(request.getParameter("qynum").trim().getBytes("8859_1"));

}
String ql = null;
if (request.getParameter("ql") != null) {
	ql= new String(request.getParameter("ql").trim().getBytes("8859_1"));

}
String qd = null;
if (request.getParameter("qd") != null) {
	qd= new String(request.getParameter("qd").trim().getBytes("8859_1"));

}
String qyname = null;
if (request.getParameter("qyname") != null) {
	qyname= new String(request.getParameter("qyname").trim().getBytes("8859_1"));

}
if(qynum==null)
{	
	qynum=(String)session.getValue("qynum"); 
}
 
if(ql==null)
{	
	ql=(String)session.getValue("ql"); 
}
if(qd==null)
{	
	qd=(String)session.getValue("qd"); 
}
if(qyname==null)
{	
	qyname=(String)session.getValue("qyname"); 
}
if(qynum==null  || ql==null|| qd==null || qyname==null)
{
 	qynum="";
	ql="";
	qd="";
	qyname="";
}
session.putValue("qynum",qynum);
session.putValue("ql",ql);
session.putValue("qd",qd);

session.putValue("qyname",qyname);


%>
<span class="STYLE3">
<div align="left">
			<form name="forma" method="post" action="select_user1.jsp">
 
&nbsp;&nbsp;
				编号：<input type="text" name="qynum" value="<%=qynum%>" size="7">&nbsp;&nbsp;
				楼号：<input type="text" name="ql"  value="<%=ql%>"   size="7">&nbsp;&nbsp;
				单元号：<input type="text" name="qd"  value="<%=qd%>"   size="7">&nbsp;&nbsp;
				业主姓名：<input type="text" name="qyname"  value="<%=qyname%>" size="20">&nbsp;&nbsp;
 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="查询">
</div>
				
<%

int pageLine=12;
int totalRec=0;
int intPage=1;
int i;
if (request.getParameter("page")!=null)
intPage=Integer.parseInt(request.getParameter("page"));
try{
ResultSet countrs=null;
countrs=db1.executeQuery("select count(*)as cnt from yz where ynum like '"+"%"+qynum+"%"+"' and l like '"+"%"+ql+"%"+"' and d like '"+"%"+qd+"%"+"'   and yname like '"+"%"+qyname+"%"+"'  ");

if(countrs.next())
totalRec=countrs.getInt("cnt");
countrs.close();
}
catch(Exception e){
e.printStackTrace();
}
int intPageCount=0;
intPageCount=(totalRec+pageLine-1)/pageLine;


String sql_i="select top "+pageLine+" *  from yz where ynum like '"+"%"+qynum+"%"+"' and l like '"+"%"+ql+"%"+"' and d like '"+"%"+qd+"%"+"'   and yname like '"+"%"+qyname+"%"+"' and rec_id not in (select top "+((intPage-1)*pageLine)+" rec_id from   yz where ynum like '"+"%"+qynum+"%"+"' and l like '"+"%"+ql+"%"+"' and d like '"+"%"+qd+"%"+"'   and yname like '"+"%"+qyname+"%"+"' order by rec_id  desc ) order by rec_id desc ";
		%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td>					<table width="100%"border="0" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
						<tr height="30">
						　　<TD  bgcolor="#dddddd" align="center" width ="70">序号</TD>
							<TD bgcolor="#dddddd" align="center" >编号</TD>
							<TD bgcolor="#dddddd" align="center" >楼号</TD>
							<TD bgcolor="#dddddd" align="center"  >单元号</TD>
							<TD bgcolor="#dddddd" align="center" >业主姓名</TD>
							<TD bgcolor="#dddddd" align="center"  >性别</TD>
							<TD bgcolor="#dddddd" align="center"  >面积</TD>
 							<TD bgcolor="#dddddd" align="center"  >联系方式</TD>
							<TD bgcolor="#dddddd" align="center" >操作</TD>
 						</TR>
						<%
 int s=0;
int rec_id=0;

String	ynum	="";
String	l	="";
String	d	="";
String	yname	="";
String	sex	="";
String	mz	="";
String	intime	="";
String	tel	="";
String	remark	="";

int xingbei=0;
ResultSet rs4=db1.executeQuery(sql_i);
 
						while(rs4.next())
						{
							s++;
								 rec_id=rs4.getInt("rec_id");
								ynum	=rs4.getString("ynum");
								l	=rs4.getString("l");
								d	=rs4.getString("d");
								yname	=rs4.getString("yname");
								xingbei	=rs4.getInt("sex");
								mz	=rs4.getString("mz");
								intime	=rs4.getString("intime");
								tel	=rs4.getString("tel");
								remark	=rs4.getString("remark");

								
 								if (xingbei==1)
									sex="男";
								else
									sex="女";
 							%>
							<TR>
								<TD bgcolor="#FFFFFF"align="center"><span class="STYLE1"><%=s%></span></TD>
								<TD bgcolor="#FFFFFF"align="center"><span class="STYLE1"><%=ynum%></span></TD>
								<TD bgcolor="#FFFFFF"align="center"><span class="STYLE1"><%=l%></span></TD>
								<TD bgcolor="#FFFFFF"align="center"><span class="STYLE1"><%=d%></span></TD>
								<TD bgcolor="#FFFFFF"align="center"><span class="STYLE1"><%=yname%></span></TD>
								<TD bgcolor="#FFFFFF"align="center"><span class="STYLE1"><%=sex%></span></TD>
								<TD bgcolor="#FFFFFF"align="center"><span class="STYLE1"><%=mz%></span></TD>
								<TD bgcolor="#FFFFFF"align="center"><span class="STYLE1"><%=tel%></span></TD>
								<td bgcolor="#FFFFFF"align="center"><span class="STYLE10"><input name="name" type="Button" onclick="window.location.href='select_user2.jsp?id=<%=rec_id%>'" value="选择" /></span></td>

		
							</TR>
								<%
						}

						if (s==0)
			                {  %>
								<TR>
									<td colspan="17" bgcolor="#FFFFFF"><center><font color="red" size="4">查无记录</center></span></td>
								</TR>							 
							   <%
							}
							%>
					</TABLE>

			<%
				rs4.close();
 
			%>
	</td>
  </tr>
 </table>
 </form>
<input type="hidden" id="del" name="del">
</form>
</span>
              <font size="2">
 <%
out.print("<center>"); 
if(intPageCount*pageLine<totalRec)
intPageCount++;
if(intPage>intPageCount)
  intPage=intPageCount;
if(intPage<1)
      intPage=1;
if(intPage<2)
     out.print("首页 上一页  ");
else{
  out.print("<a href='select_user1.jsp?page=1' ><font color='#3300FF' size='2'>首页</font></a>&nbsp;");
  out.print("<a href='select_user1.jsp?page="+(intPage-1)+"' ><font color='#3300FF' size='2'>上一页</font></a>&nbsp; ");
    }
if(intPage-intPageCount>=0)
   out.print("下一页 尾页");
else{
  out.print("<a href='select_user1.jsp?page="+(intPage+1)+"'><font color='#3300FF' size='2'>下一页</font></a>&nbsp;<a href='select_user1.jsp?page="+intPageCount+"'><font color='#3300FF' size='2'>尾页</font></a>&nbsp;");
    }
out.print(" 页次:<font color=red>"+intPage+"</font>/<font color=red>"+intPageCount+"</font>页 ");
out.print("共<font color=red>"+totalRec+"</font>条记录  <font color=red>"+pageLine+"</font>条/页");
out.print("</center>");




%>
</span>

</body>
</html>





