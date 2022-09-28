<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbh"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db2"  scope="page" class="xqwy.xqwy"/>


<html>
<head>
<title>回答业主投诉</title>
<SCRIPT LANGUAGE="JavaScript">
<!--

 
 
	 function isValid() 
{
 

 

	 if(document.form1.answers.value=="")
	{
		alert("输入回复内容!");
		document.form1.answers.focus();
		return false;
	}
 
 
}
// -->
</SCRIPT>
<link href=css.css rel=STYLESHEET type=text/css>

</head>

<body >

<%




String rec_id=new String(request.getParameter("rec_id").trim().getBytes("8859_1"));

 
int s=0,bookid=0;
 
 String liuyuan="";
String names="";
String addtime="",dx="",txr="",tel="";
String anys=(String)session.getAttribute("admin");

 ResultSet rs2=db2.executeQuery("select * from liuyuan where rec_id='"+rec_id+"'");

if (rs2.next())
{
	 				 names=rs2.getString("name");

 			 liuyuan=rs2.getString("liuyuan");			
			 addtime= rs2.getString("addtime");
				String tname="";
				ResultSet rs21=db1.executeQuery("select   * from admins where wnum='"+anys+"'" );
				if(rs21.next())
				{
					tname=rs21.getString("tname");
				}rs21.close();
 

%>
<br>
<center>
<font size=2>
<form name="form1" method="post" action="ans_ts2.jsp" onsubmit="return isValid();">
                      <input type="hidden" name="rec_id" value="<%=rec_id%>">
<table width="680" border="0" cellspacing="0" cellpadding="0" style="border: 1px solid #dddddd;">
  <tr>
  	<td colspan=11 bgcolor="#dddddd" align="center" height="25"><font size="2" color="#ffffff">回答业主投诉</font></td>
  </tr>
  <tr><td height=10></td></tr>
  <tr>
  	<td bgcolor="#ffffff" align="center">
    <table  border="1"  width="97%" bordercolor="#F0F0F0"  bgcolor="#FFFFFF"  cellpadding="3" cellspacing="0">
		<tr> 
        <td height="28" > <div align="right"><font size="2">业主:</font></div></td>
        <td align="left"> <font size="2"  color="#0000FF"><%=names%>&nbsp;</td>
      </tr>


      <tr> 
        <td height="108" > <div align="right"><font size="2">投诉内容:</font></div></td>
        <td align="left" valign="top"> <font size="2"  color="#0000FF"><%=liuyuan%>&nbsp;<br><br><FONT SIZE="2" COLOR="#808080">于：<%=addtime.substring(0,19)%></FONT></td>
      </tr>
      <tr> 
        <td height="28" > <div align="right"><font size="2">回复内容:</font></div></td>
        <td> <font size="2"  color="#0000FF"><textarea name="answers" cols="65" rows="8"></textarea>
          <font color="#FF0000">*</font></td>
      </tr>
	  <tr> 
        <td height="28" > <div align="right"><font size="2">回复者:</font></div></td>
        <td align="left"> <font size="2"  color="#0000FF"><%=anys%>(<%=tname%>)&nbsp;</td>
      </tr>
    </table>
					  <table width="305" height="32" border="0" cellpadding="0" cellspacing="0">
                        <tr> 
                          <td valign="bottom"> 
                            <div align="center"> 
                              <input type="submit" name="Submit" value="确定">
                            </div>
                          </td>
                          <td valign="bottom"> 
                            <div align="center"> 
                              <input type="reset" name="Submit2" value="重置">
                            </div>
                          </td>
                        </tr>
                      </table>
                    </form>
					</font>
					</center>
    </td>
  </tr>
  <tr><td height=30></td></tr>
</table>
<%


}
rs2.close();
%>


<center>
<input onclick="window.opener=null;window.close()" type="button" value=" 关闭 ">
</center>
</body>
</html>
