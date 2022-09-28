<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="db2"  scope="page" class="xqwy.xqwy"/>
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
 
 
 function look(a)
{
	c="see_bx.jsp?rec_id="+a;
  	window.open(c,'vssd2','height=521,width=740,top='+(screen.availHeight-521)/2+',left='+(screen.availWidth-740)/2+',toolbar=no,status=no,scrollbars=yes,menubar=no,location=no');

}

function del(vid){
    if (confirm("确定要删除此报修信息吗 ?"))
	{
	document.form1.action="delbx.jsp?rec_id="+vid;
	document.form1.submit();
	}	
}
 


 </script>

</head>

<body>
<%@  include file="top.jsp" %>



<%


String qynum = null;
if (request.getParameter("qynum") != null) {
	qynum= new String(request.getParameter("qynum").trim().getBytes("8859_1"));

}
 
if(qynum==null)	
	{ 
		qynum=(String)session.getValue("qynum");
	}
String qsbmc = null;
if (request.getParameter("qsbmc") != null) {
	qsbmc= new String(request.getParameter("qsbmc").trim().getBytes("8859_1"));

}
 
if(qsbmc==null)	
	{ 
		qsbmc=(String)session.getValue("qsbmc");
	}
String qwtms = null;
if (request.getParameter("qwtms") != null) {
	qwtms= new String(request.getParameter("qwtms").trim().getBytes("8859_1"));

}
 
if(qwtms==null)	
	{ 
		qwtms=(String)session.getValue("qwtms");
	}




String qzt = null;
if (request.getParameter("qzt") != null) {
	qzt= new String(request.getParameter("qzt").trim().getBytes("8859_1"));

}
 
if(qzt==null)	
	{ 
		qzt=(String)session.getValue("qzt");
	}
if(qynum==null  || 	qsbmc==null ||  qwtms==null ||  qzt==null )
{
	qynum="";
	qsbmc="";
	qwtms="";
	qzt="";
  
}

 session.putValue("qynum",qynum);
 session.putValue("qsbmc",qsbmc);
 session.putValue("qwtms",qwtms);
 session.putValue("qzt",qzt);
 

int pageLine=10;
int totalRec=0;
int intPage=1;
int i;
if (request.getParameter("page")!=null)
intPage=Integer.parseInt(request.getParameter("page"));
try{
ResultSet countrs=null;
countrs=db1.executeQuery("select count(*)as cnt from bxxx where    ynum like '"+"%"+qynum+"%"+"' and     sbmc like '"+"%"+qsbmc+"%"+"'  and    wtms like '"+"%"+qwtms+"%"+"'  and   zt like '"+"%"+qzt+"%"+"'  ");

if(countrs.next())
totalRec=countrs.getInt("cnt");
countrs.close();
}
catch(Exception e){
e.printStackTrace();
}
int intPageCount=0;
intPageCount=(totalRec+pageLine-1)/pageLine;


String sql2="select top "+pageLine+" * from  bxxx where    ynum like '"+"%"+qynum+"%"+"' and     sbmc like '"+"%"+qsbmc+"%"+"'  and    wtms like '"+"%"+qwtms+"%"+"' and   zt like '"+"%"+qzt+"%"+"'  and  rec_id not in (select top "+((intPage-1)*pageLine)+" rec_id from bxxx where    ynum like '"+"%"+qynum+"%"+"' and     sbmc like '"+"%"+qsbmc+"%"+"'  and    wtms like '"+"%"+qwtms+"%"+"'  and   zt like '"+"%"+qzt+"%"+"'  order by    rec_id desc  )  order by   rec_id desc ";

ResultSet rs2=db2.executeQuery(sql2);

String	tynum	="";
String	sbmc	="";
String	wtms	="";
String	szts="";
int zt=0; 
String addtime="";
int s=0,rec_id=0;
 
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
                background="images/tab_active_bg.gif" class="tab"><strong>管理报修</strong></td>
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
						<form name="form1" action="m_bx.jsp" method="post"  onsubmit="return isValid();" >
						<tr>
						 <td   bgcolor="#dddddd" colspan="13"> 业主编号:
              <input type="text" name="qynum" size="5" value="<%=qynum%>"  >&nbsp;&nbsp;&nbsp;
			  设备名称:
              <input type="text" name="qsbmc" size="10" value="<%=qsbmc%>"  >&nbsp;&nbsp;&nbsp;
			  问题描述:
              <input type="text" name="qwtms" size="20" value="<%=qwtms%>"  >&nbsp;&nbsp;&nbsp;
			  状态:
             <select name="qzt">
				 <option value="">请选择..</option>
				 <option value="0">待维修</option>
				 <option value="1">已修好</option>
			 </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="q" value="查 询">
						 </td>
						</tr>
                           <tr>
                            <td  align="center" bgcolor="#dddddd">序号</td>
							<td   align="center" bgcolor="#dddddd" ><div align="center" >业主编号</div></td>
							<td   align="center" bgcolor="#dddddd" ><div align="center" >设备名称</div></td>
							<td   align="center"bgcolor="#dddddd" width="50%"  ><div align="center" >问题描述</div></td>
							<td   align="center"bgcolor="#dddddd"  ><div align="center" >状态</div></td>
							<td     bgcolor="#dddddd"  align="center"  ><div align="center"  >报修时间</div></td>
							<td  align="center" width="40" bgcolor="#dddddd"   >查看</td>
							<td height="27" align="center"    width ="56" bgcolor="#dddddd">删除</td>
                          </tr>

				  <%
 
						while(rs2.next())
						{
								s++;
								rec_id=rs2.getInt("rec_id");
 								tynum=rs2.getString("ynum");
								sbmc=rs2.getString("sbmc");
								wtms=rs2.getString("wtms");
								zt=rs2.getInt("zt");
								switch(zt)
								{
									case 0 :szts="<FONT SIZE=2 COLOR=#6633FF>待维修</FONT>"; break;
									case 1 :szts="<FONT SIZE=2 COLOR=#336600>已修好</FONT>"; break;
								}
  								addtime=rs2.getString("addtime");

					%>
					  <TR height="20"> 
						<td bgcolor="#FFFFFF" align="center"><%=s%></td>
						<TD bgcolor="#FFFFFF"align="center"><%=tynum%></TD>
						<TD bgcolor="#FFFFFF"align="center"><%=sbmc%></TD>
						<TD bgcolor="#FFFFFF"align="left"><%=wtms%></TD>
						<TD bgcolor="#FFFFFF"align="center"><%=szts%></TD>
						<td bgcolor="#FFFFFF" align="center"><%=addtime.substring(0,19)%></td>
						<td bgcolor="#FFFFFF" align="center"><input type="button" value="查看" onclick="look('<%=rec_id%>')"></td>
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
  out.print("<a href='m_bx.jsp?page=1' ><font color='#3300FF' size='2'>首页</font></a>&nbsp;");
  out.print("<a href='m_bx.jsp?page="+(intPage-1)+"' ><font color='#3300FF' size='2'>上一页</font></a>&nbsp; ");
    }
if(intPage-intPageCount>=0)
   out.print("下一页 尾页");
else{
  out.print("<a href='m_bx.jsp?page="+(intPage+1)+"'><font color='#3300FF' size='2'>下一页</font></a>&nbsp;<a href='m_bx.jsp?page="+intPageCount+"'><font color='#3300FF' size='2'>尾页</font></a>&nbsp;");
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




