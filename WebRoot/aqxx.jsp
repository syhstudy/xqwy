<%@page contentType="text/html;charset=gb2312" import="java.sql.*,java.util.*"%>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db2"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db"  scope="page" class="xqwy.xqwy"/>

<%@ include file="top.jsp" %>
<!-- ===================================== -->
<!-- ===================================== -->
<SCRIPT LANGUAGE="JavaScript">
<!--
function show_gg(a)
{
	c="look_aqxx.jsp?rec_id="+a;
	window.open(c,'nedwj','height=460,width=740,top='+(screen.availHeight-460)/2+',left='+(screen.availWidth-740)/2+',toolbar=no,status=no,scrollbars=yes,menubar=no,location=no');
}
//-->
</SCRIPT>

<!--  -->
<%
 

%>

<TABLE cellSpacing=1 cellPadding=0 width=976 align=center bgColor=#d0e2fd border=0>
  <TBODY>
  <TR>
 <TD vAlign=top align="left"   bgColor=#ffffff>
您当前位置：<a href="index.jsp">小区安全信息教育
<table width="100%" height="370" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="370" align="center" valign="top" style="font-size:15px">
 
			<hr size="1" noshade>
			<%

				String gtitle="";
				String ggcontent="";
				String addtime="";
				  
				ResultSet rs3=db.executeQuery("select * from aqxx");
				int ggid=0;
				while (rs3.next())
				{
					ggid=rs3.getInt("rec_id");
					gtitle=rs3.getString("gtitle");
					ggcontent=rs3.getString("ggcontent");
					%>
				<table width='100%' cellSpacing=0 cellPadding=0 border=0  style='line-height:130% '>
					<tr>
 						<td width='15'>·</td>
						<td align="left" style='border-bottom: 1px dotted #cccccc'><a href="javascript:show_gg('<%=ggid%>')"><%=gtitle%></a></td>
						

					</tr>
				</table>

						<%
					} rs3.close();  %>
          </td>
        </tr>
      </table>
</TD>

</TR></TBODY></TABLE>
 
<!-- ====================================== -->
<%@ include file="foot.jsp"  %>
 