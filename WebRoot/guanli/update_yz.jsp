<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db2"  scope="page" class="xqwy.xqwy"/>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改业主信息</title>
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


//隐身，显示　　密码框
 function showadv(){
if (document.form1.advshow.checked == true) {
	document.getElementById("adv").style.display = "block";
	document.getElementById("advance").innerHTML="关闭更改密码";
}else{
	document.getElementById("adv").style.display = "none";
	document.getElementById("advance").innerHTML="显示更改密码";
}
}
	 function isValid() 
{

	 var oq1=document.form1.wpswd1.value;
	 var oq2=document.form1.wpswd2.value;


	if (document.form1.advshow.checked == true)
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
				alert("请输入密码！");
				document.form1.wpswd1.focus();
				return false;
			}
	}

 

	 if(document.form1.l.value=="")
	{
		alert("输入楼号!");
		document.form1.l.focus();
		return false;
	}
	 if(document.form1.d.value=="")
	{
		alert("输入单元号!");
		document.form1.d.focus();
		return false;
	}

	if(document.form1.yname.value=="")
	{
		alert("输入业主名称!");
		document.form1.yname.focus();
		return false;
	}
	if(document.form1.mz.value=="")
	{
		alert("输入面积!");
		document.form1.mz.focus();
		return false;
	}
	if(document.form1.intime.value=="")
	{
		alert("输入进住时间!");
		document.form1.intime.focus();
		return false;
	}
	if(document.form1.tel.value=="")
	{
		alert("输入联系方式!");
		document.form1.tel.focus();
		return false;
	}

}
// -->
</SCRIPT>

</head>

<body>
<%
 String rec_id= request.getParameter("rec_id") ;
String	ynum	="";
String	l	="";
String	d	="";
String	yname	="";
String	sex	="";
String	mz	="";
String	intime	="";
String	tel	="";
String	remark	="";
String pawd="";
int xingbei=0;

String sql2="select * from yz  where  rec_id='"+rec_id+"'";

ResultSet rs4=db1.executeQuery(sql2);

if (rs4.next())
{
	ynum	=rs4.getString("ynum");
	pawd	=rs4.getString("pawd");
	l	=rs4.getString("l");
	d	=rs4.getString("d");
	yname	=rs4.getString("yname");
	xingbei	=rs4.getInt("sex");
	mz	=rs4.getString("mz");
	intime	=rs4.getString("intime");
	tel	=rs4.getString("tel");
	remark	=rs4.getString("remark");


%>			
 
              <table cellspacing="1" cellpadding="1" width="100%" align="center" 
            bgcolor="#8ccebd" border="0">
                <tbody>
                  <tr>
                    <td 
                style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px" 
                valign="top" bgcolor="#fffcf7">
				<!--0000000000000000000000000000000000000000000000000000000000000000000 -->
					<table width="100%"border="0" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
						<form name="form1" action="update_yz1.jsp" method="post"  onsubmit="return isValid();" >
							<input type="hidden" name="rec_id" value=<%=rec_id%>>
						  <tr> 
							<td  width="18%"  align="right" bgcolor="#dddddd"> 
							  <div align="right">业主编号: </div></td>
												<td width="82%"  bgcolor="#FFFFFF"> &nbsp;&nbsp;<B><FONT SIZE="2" COLOR="#000000"><%=ynum%></FONT></B></td>
						  </tr>

						  <tr> 
							<td  width="18%"  align="right" bgcolor="#dddddd"> 
							  <div align="right">更改密码: </div></td>
												<td width="82%"  bgcolor="#FFFFFF">&nbsp;<input name="advshow" type="checkbox" id="advcheck" onclick="showadv()" value="1" />
							  <span id="advance"> 
							  <label for=advcheck>更改</label>
							  </span> </font> <table border="0" class="tableborder1" id="adv" style="DISPLAY: none"  name="adv">
								<tr> 
								  <td><font size="2">新密码</font></td>
								  <td><font size="2"> 
									<input type="password" name="wpswd1" size="15"  >
									</font></td>
								</tr>
								<tr> 
								  <td><font size="2">确定密码</font></td>
								  <td><font size="2"> 
									<input type="password" name="wpswd2" size="15"  >
									</font></td>
								</tr>
							  </table></td>
						  </tr>
	  <tr> 
        <td  bgcolor="#dddddd"  > <div align="right">楼号/单元号:</strong></div></td>
        <td bgcolor="#FFFFFF"  > 
          <input type="text" name="l" maxlength="50" size="15" value="<%=l%>"  > # 楼 <input type="text" name="d" maxlength="50" size="15" value="<%=d%>"  >&nbsp;&nbsp;单元号&nbsp;  
          </td>
      </tr>
	  <tr> 
        <td  bgcolor="#dddddd"  > <div align="right">业主姓名:</div></td>
        <td bgcolor="#FFFFFF" > 
          <input type="text" name="yname" value="<%=yname%>"></span>
          </td>
      </tr>

      <tr> 
        <td   bgcolor="#dddddd" > <div align="right">性别:</div></td>
        <td bgcolor="#FFFFFF" >
                            <table width="179"  border="0" cellpadding="0" cellspacing="0">
                              <tr> 
                                <td width="51"> 
                                  <div align="right"> 
								  <!--88888888888888888888888888888888888-->
                                   <%
									if(xingbei==1)
									{
									%>
									<input name="sex" type="radio" value="1" checked>
                                   <%
									}else
									{
									%>
									<input name="sex" type="radio" value="1" >
									<%
									}
									%>
								  <!--88888888888888888888888888888888888-->
								  </div>
                                </td>
                                <td width="37" class="bbb">男</span></td>
                                <td width="55"> 
                                  <div align="right"> 
								  <!--88888888888888888888888888888888888-->
                                   <%
									if(xingbei==2)
									{
									%>
									<input name="sex" type="radio" value="2" checked>
                                   <%
									}else
									{
									%>
									<input name="sex" type="radio" value="2" >
									<%
									}
									%>
								  <!--88888888888888888888888888888888888-->
								  </div>
                                </td>
                                <td width="36" class="bbb">女</span></td>
                              </tr>
                          </table>
		</td>
      </tr>
	  <tr> 
        <td  bgcolor="#dddddd"  > <div align="right">面积:</div></td>
        <td bgcolor="#FFFFFF" > 
          <input type="text" name="mz" value="<%=mz%>"></span>
          </td>
      </tr>
	  <tr> 
        <td  bgcolor="#dddddd"  > <div align="right">进住时间:</div></td>
        <td bgcolor="#FFFFFF" > 
          <input type="text" name="intime" value="<%=intime%>"></span>
          &nbsp;&nbsp; </td>
      </tr>
       <tr> 
        <td  bgcolor="#dddddd"  > <div align="right">联系方式:</div></td>
        <td bgcolor="#FFFFFF" > 
          <input type="text" name="tel" size="50" value="<%=tel%>"></span>
          </span></td>
      </tr>
      <tr> 
        <td  bgcolor="#dddddd"  > <div align="right">备&nbsp;&nbsp;注:</div></td>
        <td bgcolor="#FFFFFF" > 
          <textarea name="remark" cols="50" rows="5"><%=remark%></textarea></td>
      </tr>
 

						
						<tr>
						  <td  colspan=2 bgcolor="#FFFFFF" align="center"><input type="submit"  name="isok" value="保  存" class="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="window.opener=null;window.close()" type="button" value="取  消"></td>
						 </tr>

						</form>
					 </table>
				<!--0000000000000000000000000000000000000000000000000000000000000000000 -->
				</td>
                  </tr>
                </tbody>
              </table>

<%
}
rs4.close();

%>
</body>
</html>




