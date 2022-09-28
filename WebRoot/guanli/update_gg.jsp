<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbn"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="dbj"  scope="page" class="xqwy.xqwy"/>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改小区公告信息</title>
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


 	 function isValid() 
{

	 if(document.forma.gtitle.value=="")
	 {
		 alert("请输入小区公告标题！"); 
		 document.forma.gtitle.focus();
		 return false;
	 }
}
// -->
</SCRIPT>

</head>

<body>
<%
 String rec_id= request.getParameter("rec_id") ;

String gtitle="";
String ggcontent="";
String addtime="";
ResultSet rs3=dbn.executeQuery("select * from xqgg  where  rec_id='"+rec_id+"'");
 
if (rs3.next())
{
					gtitle=rs3.getString("gtitle");
					ggcontent=rs3.getString("ggcontent");
 					addtime=rs3.getString("addtime");


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
						<form name="forma" action="update_gg1.jsp" method="post"  onsubmit="return isValid();" >
							<input type="hidden" name="rec_id" value=<%=rec_id%>>
 

						  <tr> 
							<td  width="18%"  align="right" bgcolor="#dddddd"> 
							  <div align="right">小区公告标题: </div></td>
												<td width="82%"  bgcolor="#FFFFFF"> &nbsp;&nbsp;<input name="gtitle" type="text" size="45" value="<%=gtitle%>"  ></td>
						  </tr>
						  <tr> 
							<td  width="18%"  align="right" bgcolor="#dddddd"> 
							  <div align="right">公告内容: </div></td>
												<td width="82%"  bgcolor="#FFFFFF"> &nbsp;&nbsp;<textarea name="ggcontent" cols="70" rows="15"><%=ggcontent%></textarea></td>
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
rs3.close();

%>
</body>
</html>




