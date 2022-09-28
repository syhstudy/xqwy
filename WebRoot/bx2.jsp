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

<SCRIPT language=javascript>function T(n){document.getElementById("ArticleCnt").style.fontSize=n+"px";}</SCRIPT>


<script>
	 function isValid() 
{
	 if(document.form1.yname.value=="")
	{
		alert("输入姓名!");
		document.form1.yname.focus();
		return false;
	}
			if(document.form1.pawd0.value=="")
			{
				alert("请输入密码！");
				document.form1.pawd0.focus();
				return false;
			}
			if(document.form1.pawd0.value=="")
			{
					alert("请输入确定密码");
					document.form1.pawd.focus();
					return false;
			}
 
					if(document.form1.pawd0.value!=document.form1.pawd.value)
					{
 						alert("两次输入的密码，不一样！");
						document.form1.pawd0.focus();
						return false;
					}
 	 if(document.form1.tel.value=="")
	{
		alert("输入电话!");
		document.form1.tel.focus();
		return false;
	}
}
</script>


<!--  -->
<%
 
%>

<TABLE cellSpacing=1 cellPadding=0 width=976 align=center bgColor=#d0e2fd border=0>
  <TBODY>
  <TR>
 <TD vAlign=top align="left"   bgColor=#ffffff> 
您当前位置：<a href="index.jsp">首页</a>＞＞业主报修
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


 <%
  String ynum= new String(request.getParameter("ynum").getBytes("8859_1"));
 String sbmc= new String(request.getParameter("sbmc").getBytes("8859_1"));
 String wtms= new String(request.getParameter("wtms").getBytes("8859_1"));
 
String sql1="select * from yz where ynum='"+ynum+"'";

ResultSet rs1=db.executeQuery(sql1);
String isss="";

if(rs1.next())
{
 rs1.close();


	
	String sql2="insert into bxxx(ynum,sbmc,wtms )values('"+ynum+"','"+sbmc+"','"+wtms+"' )";

		db2.executeUpdate(sql2);
		db2.closeStmt();
		db2.closeConn();
 			//插入日志
			String 	  yadmin=(String)session.getAttribute("tynum");//获取当前用户用户名
			db1.executeUpdate("insert into system_rz (wnum,remark) values('"+yadmin+"','业主提交报修信息:"+sbmc+"')");
			db1.closeStmt();
			db1.closeConn();
		%>

			<script>
 				 window.alert("报修信息提交成功! ");
				self.setTimeout("exit()",1)
				function exit() 
				{
					document.jia.action="bx1.jsp";
					document.jia.submit();
				}
			</script> 
			<form action="bx1.jsp" method="post" name="jia">

			</form> &nbsp;
		<%

		;
}else
{
	rs1.close();

%>
<SCRIPT LANGUAGE="JavaScript">

alert("提交失败!\n系统中无此业主编号!");
window.setInterval("submit01()",20000)
history.back();

</SCRIPT><%

 
}
  
  
  
  %>