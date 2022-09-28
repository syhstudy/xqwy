<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
 
<!--  -->

<HTML><HEAD>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2800.1106" name=GENERATOR>
<TITLE>小区物业管理系统</TITLE>
<script language='javascript'>
 function SetFocus()
{
if (document.Login.admin_name.value=="")
	document.Login.admin_name.focus();
else
	document.Login.admin_name.select();
}
function CheckForm()
{
	if(document.Login.admin_name.value=="")
	{
		alert("请输入用户名！");
		document.Login.admin_name.focus();
		return false;
	}
	if(document.Login.admin_pass.value == "")
	{
		alert("请输入密码！");
		document.Login.admin_pass.focus();
		return false;
	}

}
 </script>
 </HEAD>
<BODY bgColor=#eef8e0 leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0">
 <center>
  <form id="Login" name="Login" method="post" action="logins.jsp" onSubmit="return CheckForm();">


<TABLE cellSpacing=0 cellPadding=0 width=1004 border=0>
  <TR>
    <TD colSpan=6><IMG height=92 alt="" src="images/admin/crm_1.gif" 
    width=345></TD>
    <TD colSpan=4><IMG height=92 alt="" src="images/admin/crm_2.gif" 
    width=452></TD>
    <TD><IMG height=92 alt="" src="images/admin/crm_3.gif" width=207></TD></TR>
  <TR>
    <TD colSpan=6><IMG height=98 alt="" src="images/admin/crm_4.gif" 
    width=345></TD>
    <TD colSpan=4><IMG height=98 alt="" src="images/admin/crm_5.gif" 
    width=452></TD>
    <TD><IMG height=98 alt="" src="images/admin/crm_6.gif" width=207></TD></TR>
  <TR>
    <TD rowSpan=5><IMG height=370 alt="" src="images/admin/crm_7.gif" 
    width=59></TD>
    <TD colSpan=5><IMG height=80 alt="" src="images/admin/crm_8.gif" 
    width=286></TD>
    <TD colSpan=4><IMG height=80 alt="" src="images/admin/crm_9.gif" 
    width=452></TD>
    <TD><IMG height=80 alt="" src="images/admin/crm_10.gif" width=207></TD></TR>
  <TR>
    <TD><IMG height=110 alt="" src="images/admin/crm_11.gif" width=127></TD>
    <TD background=images/admin/crm_12.gif colSpan=6>
      <TABLE id=table1 cellSpacing=0 cellPadding=0 width="98%" 
      border=0>
        <TR>
          <TD>
			

            <TABLE id=table2 cellSpacing=1 cellPadding=0 width="100%" 
            border=0>
              <TBODY>
              <TR>
                <TD align=middle width=81><FONT size=2 color=#ffffff>用户名：</FONT></TD>
                <TD><INPUT maxLength=16 size=16 type=text name=admin_name class=regtxt title="请填写用户名"></TD></TR>
              <TR>
                <TD align=middle width=81><FONT  size=2 
                  color=#ffffff>密&nbsp; 码：</FONT></TD>
                <TD><INPUT maxLength=16 size=16 type=password name=admin_pass class=regtxt title="请填写密码"></TD></TR>
 
				</TBODY></TABLE>
				</TD></TR></TABLE></TD>
    <TD colSpan=2 rowSpan=2><IMG height=158 alt="" src="images/admin/crm_13.gif" 
      width=295></TD>
    <TD rowSpan=2><IMG height=158 alt="" src="images/admin/crm_14.gif" 
    width=207></TD></TR>

  <TR>
    <TD rowSpan=3><IMG height=180 alt="" src="images/admin/crm_15.gif" 
    width=127></TD>
    <TD rowSpan=3><IMG height=180 alt="" src="images/admin/crm_16.gif" 
    width=24></TD>
    <TD><INPUT type=image height=48 alt="" width=86 
      src="images/admin/crm_17.gif" title="登录后台" name="image"></TD>
    <TD><IMG height=48 alt="" src="images/admin/crm_18.gif" width=21></TD>
    <TD colSpan=2><a href="../index.jsp"><img border=0 height=48 alt="" 
      width=84 src="images/admin/crm_19.gif" title="返回首页"></a></TD>
    <TD><IMG height=48 alt="" src="images/admin/crm_20.gif" 
  width=101></TD></TR>
  <TR>
    <TD colSpan=5 rowSpan=2><IMG height=132 alt="" src="images/admin/crm_21.gif" 
      width=292></TD>
    <TD rowSpan=2><IMG height=132 alt="" src="images/admin/crm_22.gif" 
    width=170></TD>
    <TD colSpan=2><IMG height=75 alt="" src="images/admin/crm_23.gif" 
    width=332></TD></TR>
  <TR>
    <TD colSpan=2><IMG height=57 alt="" src="images/admin/crm_24.gif" 
    width=332></TD></TR>
  <TR>
    <TD><IMG height=1 alt="" src="images/admin/spacer.gif" width=59></TD>
    <TD><IMG height=1 alt="" src="images/admin/spacer.gif" width=127></TD>
    <TD><IMG height=1 alt="" src="images/admin/spacer.gif" width=24></TD>
    <TD><IMG height=1 alt="" src="images/admin/spacer.gif" width=86></TD>
    <TD><IMG height=1 alt="" src="images/admin/spacer.gif" width=21></TD>
    <TD><IMG height=1 alt="" src="images/admin/spacer.gif" width=28></TD>
    <TD><IMG height=1 alt="" src="images/admin/spacer.gif" width=56></TD>
    <TD><IMG height=1 alt="" src="images/admin/spacer.gif" width=101></TD>
    <TD><IMG height=1 alt="" src="images/admin/spacer.gif" width=170></TD>
    <TD><IMG height=1 alt="" src="images/admin/spacer.gif" width=125></TD>
    <TD><IMG height=1 alt="" src="images/admin/spacer.gif" 
  width=207></TD>
</TR></TABLE>
				</FORM>
</center>
</BODY></HTML>
  