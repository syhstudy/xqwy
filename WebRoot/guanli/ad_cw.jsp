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
<SCRIPT LANGUAGE="JavaScript">
<!--
//隐身，显示　　 
 function showadv(pp)
 {
	if (pp == 1) {
		document.getElementById("adv").style.display = "block";
	}else{
		document.getElementById("adv").style.display = "none";
	}
}

	 function isValid() 
{
	 if(document.form1.cwname.value=="")
	{
		alert("输入车位号!");
		document.form1.cwname.focus();
		return false;
	}

	var chk=3; 
	for(var i=0;i<form1.ctype.length; i++)
		{ 
			if(form1.ctype[i].status== true)
			{ 
				chk=form1.ctype[i].value; 
			}
		} 
	 if(chk==1)
	{
			 if(document.form1.ynum.value=="")
			{
				alert("请选择所属车位 !");
				document.form1.ynum.focus();
				return false;
			}
			 if(document.form1.carnum.value=="")
			{
				alert("请输入车牌号 !");
				document.form1.carnum.focus();
				return false;
			}


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
                background="images/tab_active_bg.gif" class="tab"><strong>添加车位</strong></td>
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
						<form name="form1" action="ad_cw1.jsp" method="post"  onsubmit="return isValid();" >
   <%
String sql1="select * from yz order by ynum";
ResultSet rs1=db1.executeQuery(sql1);
%>
			<tr>
				<td width="18%"  align="right" bgcolor="#dddddd"><div align="left">车位号</div></td>
				<td  width="82%"  bgcolor="#FFFFFF">
				  <input type="text" name="cwname" maxlength="50" size="23" value="" class="input">
				 </td>
			  </tr>
 
 
			  <tr>
				<td width="18%"  align="right" bgcolor="#dddddd"><div align="left">类型</div></td>
				<td  width="82%"  bgcolor="#FFFFFF">
				  <span class="STYLE10"><FONT SIZE="2" COLOR="#0000CC"><input type="radio" value="1" checked  onclick="showadv(1)" name="ctype">私人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="2" name="ctype" onclick="showadv(0)">公共</FONT> 
				 
				<br>
						<table  width="100%"   border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd"    class="tableborder1" id="adv" style="DISPLAY: block"  name="adv">
						  <tr>
							 <td align="right"  >所属业主：</td>
							 <td    bgcolor="#FFFFFF" >
							 <select name="ynum">
							  <option value="">请选择..</option>
                               <%
								while(rs1.next())
								{
									int num=rs1.getInt("ynum");
									String yname=rs1.getString("yname");
									%>
									 <option value="<%=num%>"><%=num%> - (<%=yname%>)</option>
									 <%
								}
									rs1.close();
									%>
                            </select>
							 &nbsp;</td>
						  </tr>
						  <tr>
							 <td align="right"  >车牌号：</td>
							 <td   bgcolor="#FFFFFF" ><input type="text" name="carnum" size="18" maxlength=18></td>
						  </tr>
 
						</table><br><br>
				</td>
			  </tr>

			  <tr>
				<td width="18%"  align="right" bgcolor="#dddddd"><div align="left">备&nbsp;&nbsp;注</div></td>
				<td  width="82%"  bgcolor="#FFFFFF">
				  <textarea name="remark" cols="90" rows="5"></textarea>
				 </td>
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




