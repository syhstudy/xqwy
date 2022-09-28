<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db2"  scope="page" class="xqwy.xqwy"/>

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
	<%


String sluser="";
int yes=0;
	sluser=(String)session.getValue("sluser"); 
if(sluser!=null  )
{
	request.getSession().removeValue("sluser");
	yes=1;
}
else
{
	sluser="";
	yes=0;
}


%>
<SCRIPT LANGUAGE="JavaScript">
<!--
function add_user( )
{
	c="select_user1.jsp?qynum=&yname=&ql=&qd=";
	window.open(c,'nn2','height=511,width=880,top='+(screen.availHeight-511)/2+',left='+(screen.availWidth-880)/2+',toolbar=no,status=no,scrollbars=yes,menubar=no,location=no');

}

function jjj2()
{
	self.location.replace("ad_fy.jsp")
}


function  tst()
{
	if(document.form1.yy.value=="")
	{
		alert("请选择业主 ");
		return false;
	}
}

	 function isValid() 
{
	 if(document.form1.yy.value=="")
	{
		alert("请选择业主!");
		document.form1.yy.focus();
		return false;
	}
	if(document.form1.yue.value=="")
	{
		alert("请选择所属月份!");
		document.form1.yue.focus();
		return false;
	}
 
	if(document.form1.d.value=="")
	{
		alert("请输入电量!");
		document.form1.d.focus();
		return false;
	}
	if(document.form1.s.value=="")
	{
		alert("请输入水量!");
		document.form1.s.focus();
		return false;
	}
	if(document.form1.money.value=="")
	{
		alert("请输入费用!");
		document.form1.money.focus();
		return false;
	}if(document.form1.wyf.value=="")
	{
		alert("请输入物业费!");
		document.form1.money.focus();
		return false;
	}
 
}
 // -->
 </SCRIPT>


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
                background="images/tab_active_bg.gif" class="tab"><strong>添加费用</strong></td>
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
						<form name="form1" action="ad_fy1.jsp" method="post"  onsubmit="return isValid();" >
   <%
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
String vals="";
 ResultSet rs2=db1.executeQuery("select   * from yz where rec_id='"+sluser+"'" );
if(rs2.next())
{
								ynum	=rs2.getString("ynum");
								l	=rs2.getString("l");
								d	=rs2.getString("d");
								yname	=rs2.getString("yname");
								xingbei	=rs2.getInt("sex");
								mz	=rs2.getString("mz");
								intime	=rs2.getString("intime");
								tel	=rs2.getString("tel");
								remark	=rs2.getString("remark");
								
								
 								if (xingbei==1)
									sex="男";
								else
									sex="女";
								vals=ynum+"("+yname+")";
}rs2.close();


String awnum=(String)session.getAttribute("admin");
String tname="";
ResultSet rs21=db1.executeQuery("select   * from admins where wnum='"+awnum+"'" );
if(rs21.next())
{
	tname=rs21.getString("tname");
}rs21.close();


%>
 
 
			  <tr>
				<td width="18%"  align="right" bgcolor="#dddddd">选择业主</td>
				<td  width="82%"  bgcolor="#FFFFFF">
				  <input type="text" name="yy"  size="17" onclick="add_user( )" style="BACKGROUND-COLOR: #C0C0C0; COLOR: #0000CC"  value="<%=vals%>" readonly  class="input"  >
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input name="namea" type="Button" onclick="add_user( )" value="获取业主信息...." />
					  <input type="hidden" name="ynum" value="<%=ynum%>" >
				</div></td>
			  </tr>

			  <tr>
				<td width="18%"  align="right" bgcolor="#dddddd">业主基本信息</td>
				<td  width="82%"  bgcolor="#FFFFFF">
                       <table width="100%"  border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd"  >
                        <tr> 
                          <td width="80" align="center">编号：</td>
                          <td  bgcolor="#FFFFFF" ><FONT SIZE="2" COLOR="#0000CC"><%=ynum%></FONT> </td> 
						  <td width="80" align="center">业主姓名：</td>
                          <td  bgcolor="#FFFFFF" ><FONT SIZE="2" COLOR="#0000CC"><%=yname%></FONT> </td> 
                          <td  width="80"  align="center">性别： </td> 
                          <td  bgcolor="#FFFFFF" ><FONT SIZE="2" COLOR="#0000CC"><%=sex%></FONT> </td> 
                        </tr>
						<tr> 
                          <td width="80" align="center">楼号：</td>
                          <td  bgcolor="#FFFFFF" ><FONT SIZE="2" COLOR="#0000CC"><%=l%></FONT> </td> 
						  <td width="80" align="center">单元号：</td>
                          <td  bgcolor="#FFFFFF" ><FONT SIZE="2" COLOR="#0000CC"><%=d%></FONT> </td> 
                          <td  width="80"  align="center">面积： </td> 
                          <td  bgcolor="#FFFFFF" ><FONT SIZE="2" COLOR="#0000CC"><%=mz%></FONT> </td> 
                        </tr>
                      </table>
 				</div></td>
			  </tr>
 
			  <tr>
				<td width="18%"  align="right" bgcolor="#dddddd">所属月份</td>
				<td  width="82%"  bgcolor="#FFFFFF">
				  <select name="yue">
					<option value="" selected>请选择..</option>
					<option value="2019-1">2019-1</option>
					<option value="2019-2">2019-2</option>
					<option value="2019-10">2019-3</option>
					<option value="2019-10">2019-4</option>
					<option value="2019-5">2019-5</option>
					<option value="2019-6">2019-6</option>
					<option value="2019-7">2019-7</option>
					<option value="2019-8">2019-8</option>
					<option value="2019-9">2019-9</option>
					<option value="2019-10">2019-10</option>
					<option value="2019-11">2019-11</option>
					<option value="2019-12">2019-12</option>
				</div></td>
			  </tr>

			  <tr>
				<td width="18%"  align="right" bgcolor="#dddddd">本月用电量</td>
				<td  width="82%"  bgcolor="#FFFFFF">
				  <input type="text" name="d" maxlength="50" size="5" value="" class="input"  onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" >&nbsp;度
				</div></td>
			  </tr>

			  <tr>
				<td width="18%"  align="right" bgcolor="#dddddd">本月用水量</td>
				<td  width="82%"  bgcolor="#FFFFFF">
				  <input type="text" name="s" maxlength="50" size="5" value="" class="input"  onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" >&nbsp;吨
				</div></td>
			  </tr>
			  <tr>
				<td width="18%"  align="right" bgcolor="#dddddd">物业费</td>
				<td  width="82%"  bgcolor="#FFFFFF">
				  <input type="text" name="wyf" maxlength="50" size="5" value="" class="input"  onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" >&nbsp;元
				</div></td>
			  </tr>
			  <tr>
				<td width="18%"  align="right" bgcolor="#dddddd">本月应缴费用</td>
				<td  width="82%"  bgcolor="#FFFFFF">
				  <input type="text"    onclick="tst()"      name="money" maxlength="10" size="10" value="" style="BACKGROUND-COLOR: #FFFF00; text-align: center; height:30px; COLOR: #FF0000;font-weight: bold;" >&nbsp;&nbsp;<FONT SIZE="2" COLOR="">元</FONT>
				</div></td>
			  </tr>

			  <tr>
				<td width="18%"  align="right" bgcolor="#dddddd">操作员</td>
				<td  width="82%"  bgcolor="#FFFFFF">
				  <input type="text" name="dsdf"  style="BACKGROUND-COLOR: #C0C0C0; COLOR: #0000CC" readonly  value="<%=awnum%>(<%=tname%>)">
				</div></td>
			  </tr>
			  
			  <tr>
						  <td  width="18%"  align="right" bgcolor="#FFFFFF">&nbsp;</td>
						  <td  width="82%"  bgcolor="#FFFFFF"><input type="submit"  name="isok" value="保  存" class="button"><input type="reset" value="取  消"></td>
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




