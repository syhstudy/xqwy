<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>

<html xmlns="http://www.w3.org/1999/xhtml">
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
	 function isValid() 
{
	 var oq=document.form1.wpswd0.value;
	 var oq1=document.form1.wpswd1.value;
	 var oq2=document.form1.wpswd2.value;
	 if(oq!="")
	 {
		if(oq1!="")
		{
			if(oq2!="")
			{
				if(oq1!=oq2)
				{
					alert("两次输入的密码，不一样！");
					document.form1.wpswd1.focus();
					return false;
				}
			}
			else
			{
				alert("请输入确定密码");
				document.form1.wpswd2.focus();
				return false;
			}

		}
		else
		{
			alert("请输入新密码！");
			document.form1.wpswd1.focus();
			return false;
		}
		
	 }
	 else 
	 {
		 alert("请输入旧密码！请填写完整！"); 
		 document.form1.wpswd0.focus();
		 return false;
	 }
}

 </script>
</head>

<body>
<%@  include file="top.jsp" %>
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
                background="images/tab_active_bg.gif" class="tab"><strong>修改密码</strong></td>
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
						<form name="form1" action="upas1.jsp" method="post"  onsubmit="return isValid();" >

						<tr>
						  <td  width="18%"  align="right" bgcolor="#dddddd">旧 密 码：</td>
						  <td  width="82%"  bgcolor="#FFFFFF"><input name="wpswd0" type="password" size="19"></td>
						 </tr>
						<tr>
						  <td  width="18%"  align="right" bgcolor="#dddddd">新 密 码：</td>
						  <td  width="82%"  bgcolor="#FFFFFF"><input name="wpswd1" type="password" size="19"></td>
						 </tr>
						<tr>
						  <td  width="18%"  align="right" bgcolor="#dddddd">确定密码：</td>
						  <td  width="82%"  bgcolor="#FFFFFF"><input name="wpswd2" type="password" size="19"></td>
						 </tr>
						<tr>
						  <td  width="18%"  align="right" bgcolor="#FFFFFF">&nbsp;</td>
						  <td  width="82%"  bgcolor="#FFFFFF"><input type="submit"  name="isok" value="保  存" class="button"></td>
						 </tr>

						</form>
					 </table>
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




