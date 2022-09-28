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
	 if(document.forma.ynum.value=="")
	 {
		 alert("请输入通知标题！"); 
		 document.forma.ynum.focus();
		 return false;
	 }
	  if(document.forma.ynum.value=="")
	 {
		 alert("请输入报修寝室编号！"); 
		 document.forma.ynum.focus();
		 return false;
	 }
	  if(document.forma.sbmc.value=="")
	 {
		 alert("请输入报修设备名称！"); 
		 document.forma.sbmc.focus();
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

<%

		String anu="";
		if(tynum.equals(""))
			anu=" value='请先登录' disabled ";
		else
			anu=" ";
%>
                           

                              <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#e1e1e1" align="center">
							   <form name=forma method="post" action="bx2.jsp" onsubmit="return isValid();">
                                <tr>
                                  <td height=15 align="center" colspan=2 bgcolor="#f1f1f1"><font color="">我要报修</font> </td>
                                </tr>
 
								  <tr>
									<td width=17%  height="18"  bgcolor="#FFFFFF" ><div align="right" >报修寝室编号：</div></td>
									<td  height="18" bgcolor="#FFFFFF"> &nbsp;&nbsp;<input name="ynum" type="text" size="10" value="<%=tynum%>"   style="BACKGROUND-COLOR: #C0C0C0; COLOR: #000000" readonly >&nbsp;</td>
								  </tr>
								  <tr>
									<td height="18"  bgcolor="#FFFFFF" ><div align="right" >报修设备名称：</div></td>
									<td  height="18" bgcolor="#FFFFFF"> &nbsp;&nbsp;<input name="sbmc" type="text" size="40"   >&nbsp;<FONT SIZE="2" COLOR="red"><B>*</B></FONT></td>
								  </tr>

								  <tr>
									<td height="18"  bgcolor="#FFFFFF" ><div align="right" >问题描述：</div></td>
									<td  height="18"  bgcolor="#FFFFFF"> &nbsp;&nbsp;<textarea name="wtms" cols="80" rows="15"></textarea></td>
								  </tr>
 
                                <tr bgcolor="#FFFFFF">
                                  <td width=17% align="right"></td>
                                  <td class=pad><input class="go-wenbenkuang"  type=submit name="isok" <%=anu%> value=" 提交信息 ">
                                      <input class="go-wenbenkuang"   type=reset name="Clear" value=" 重新填写 ">
                                  </td>
                                </tr>
								</form>
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


 