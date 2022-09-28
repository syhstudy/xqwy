<%@page contentType="text/html;charset=gb2312" import="java.sql.*,java.util.*"%>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db2"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db"  scope="page" class="xqwy.xqwy"/>

<%@ include file="top.jsp" %>
<!-- ===================================== -->

 <style type="text/css">
.bb{ FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #1e4e10; BORDER-BOTTOM: #cccccc 2px solid; BACKGROUND-COLOR: #FEA817; TEXT-DECORATION: none}
</style>

<style>
	.clr{
		clear:both;
	}
	#footerlogo{
		padding-top:14px;
	}
	#footerlogo a{
		float:left;
		padding:5px 3px 0;
		display:block;
		font-size:12px;
		text-align:center;
	}
	#footerlogo .item{
		float:left;
		border:1px solid #d2d2d2;
		font-size:12px;
		height:50px;
		line-height:20px;
		margin:6px;
		width:120px;
	}
	#footerlogo .item .i1{
		width:44px;
	}
	#footerlogo .item .i2{
		width:64px;
	}
	#footerlogo a{
		color:#515151;
	}
</style>

 
 <script>
 
 function look(a)
{
	c="see_bx.jsp?rec_id="+a;
  	window.open(c,'vssd2','height=521,width=740,top='+(screen.availHeight-521)/2+',left='+(screen.availWidth-740)/2+',toolbar=no,status=no,scrollbars=yes,menubar=no,location=no');

}

 
 
 </script>


<!--  -->
<%
 
%>

<TABLE cellSpacing=1 cellPadding=0 width=976 align=center bgColor=#d0e2fd border=0>
  <TBODY>
  <TR>
 <TD vAlign=top align="left"   bgColor=#ffffff> 
您当前位置：<a href="index.jsp">首页</a>＞＞业主报修记录
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td   align="center" valign="top" style="font-size:15px"><table width="100%" border="0" cellspacing="0" cellpadding="2">
 
            </table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr> 
                
            <td  id="ArticleCnt"align="left" valign="top" style="FONT-FAMILY: verdana,arial,helvetica,sans-serif;word-break:break-all;font-size:14px;LETTER-SPACING: 0px">&nbsp;
<table width="100%" border="0">

                <tr> 
                  <td width="100%"> 

<%

ResultSet rs2=db2.executeQuery("select * from bxxx where ynum='"+tynum+"' order by rec_id desc" );
String ynum="";
 String	sbmc	="";
String	wtms	="";
String	szts="";
int zt=0; 
String addtime="";
int s=0,rec_id=0;
%>
                           

                              <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#e1e1e1" align="center">
							   <tr>
								<td  bgcolor="#f1f1f1"align="center" width="40" >序号</td>
								<td  bgcolor="#f1f1f1"align="center"   >报修业主</td>
								<td bgcolor="#f1f1f1"  align="center"  ><div align="center" >设备名称</div></td>
								<td bgcolor="#f1f1f1"  align="center" width="30%"  ><div align="center" >问题描述</div></td>
								<td bgcolor="#f1f1f1"  align="center"  ><div align="center" >状态</div></td>
								<td bgcolor="#f1f1f1"  width="160"    align="center"  ><div align="center"  >报修时间</div></td>
								<td  bgcolor="#f1f1f1"  align="center" width="40" >查看</td>
							  </tr>

 
				  <%
 						while(rs2.next())
						{
								s++;
								rec_id=rs2.getInt("rec_id");
 								ynum=rs2.getString("ynum");
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
						<td bgcolor="#FFFFFF"   align="center"><%=s%></td>
						<td bgcolor="#FFFFFF"   align="center"><%=ynum%></td>
						<td  bgcolor="#FFFFFF"><div align="left"  ><FONT SIZE="2" COLOR="#000000"><%=sbmc%></FONT></div></td>
						<td  bgcolor="#FFFFFF"><div align="left"  ><FONT SIZE="2" COLOR="#660000"><%=wtms%></FONT></div></td>
						<td bgcolor="#FFFFFF" align="center"><%=szts%></td>	
						<td bgcolor="#FFFFFF" align="center"><%=addtime.substring(0,19)%></td>	
						<td bgcolor="#FFFFFF" width="5%" align="center"><input type="button" value="查看" onclick="look('<%=rec_id%>')"> </td>
 			
					  </TR>
					  <%
				}
						if (s==0)
			                {  %>
								<TR>
									<td colspan="17" bgcolor="#FFFFFF"><center><font color="red" size="4">查无记录!</center></span></td>
								</TR>							 
							   <%
							}
 
				rs2.close();
				%>
 
 
                              </table>
 


<br>
<br>
 
						  
                    </td>
                </tr>

              </table>
              &nbsp;&nbsp;&nbsp; 
              <div class="maincontent hidep" id="list_03">
				<h3 class="special">&nbsp;</h3>
				</div>
				
				</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
</TD>

</TR></TBODY></TABLE>
 
<!-- ====================================== -->
<%@ include file="foot.jsp"  %>
</body>
</html>


 