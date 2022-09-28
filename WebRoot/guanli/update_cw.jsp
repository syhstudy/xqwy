<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db2"  scope="page" class="xqwy.xqwy"/>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改车位信息</title>
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
				alert("请选择所属业主 !");
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
<%
 String rec_id= request.getParameter("rec_id") ;

String	cwname	="";
String	ctype	="";
String	ynum	="";
String	carnum	="";
String	remark	="";


int ictype=0;
String ynames="",temp1="",temp2="";
String sql1="select * from yz order by ynum";
ResultSet rs1=db1.executeQuery(sql1);

String sql2="select * from cw  where  rec_id='"+rec_id+"'";

ResultSet rs4=db1.executeQuery(sql2);

if (rs4.next())
{
							cwname	="";
							ctype	="";
							ynum	="";
							carnum	="";
							remark	="";
							ynames="";

 								cwname	=rs4.getString("cwname");
								ictype	=rs4.getInt("ctype");
								ynum	=rs4.getString("ynum");
								carnum	=rs4.getString("carnum");
								remark	=rs4.getString("remark");

								ResultSet rs5=db1.executeQuery("select * from yz where ynum='"+ynum+"' ");
								if(rs5.next())
								{
									ynames=rs5.getString("yname");
								}
								rs5.close();

								
								
 								if (ictype==1)
								{
									ctype="block";
									temp1=" checked ";
								}
								else
								{
									ctype="none";
									temp2=" checked";
								}


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
						<form name="form1" action="update_cw1.jsp" method="post"  onsubmit="return isValid();" >
							<input type="hidden" name="rec_id" value=<%=rec_id%>>
 

      <tr> 
        <td  width="18%"  align="right" bgcolor="#dddddd">车位号:</td>
        <td bgcolor="#FFFFFF" > 
          <input type="text" name="cwname" value="<%=cwname%>">
          </td>
      </tr>
	  <tr> 
        <td  width="18%"  align="right" bgcolor="#dddddd">类型:</td>
        <td bgcolor="#FFFFFF"  ><div align="left">
				  <FONT SIZE="2" COLOR="#0000CC"><input type="radio" value="1" <%=temp1%>  onclick="showadv(1)" name="ctype">私人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="2" <%=temp2%>  name="ctype" onclick="showadv(0)">公共</FONT> 
				
				<br>
						<table  width="100%"   border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd"    class="tableborder1" id="adv" style="DISPLAY: <%=ctype%>"  name="adv">
						  <tr>
							 <td align="right"  >所属业主：</span></td>
							 <td    bgcolor="#FFFFFF" >
							 <select name="ynum">
							  <option value="">请选择..</option>
                               <%
								String ts="";
								while(rs1.next())
								{
									String num=rs1.getString("ynum");
									String yname=rs1.getString("yname");
									if(num.equals(ynum))
										ts=" selected ";
									else
										ts=" ";
									%>
									 <option <%=ts%> value="<%=num%>"><%=num%> - (<%=yname%>)</option>
									 <%
								}
									rs1.close();
									%>
                            </select>
							 &nbsp;</td>
						  </tr>
						  <tr>
							 <td align="right"  >车牌号：</td>
							 <td   bgcolor="#FFFFFF" ><input type="text" name="carnum" size="18"  value="<%=carnum%>" maxlength=18></td>
						  </tr>
 
						</table><br><br>
          </td>
      </tr>
       <tr> 
        <td  width="18%"  align="right" bgcolor="#dddddd">备&nbsp;&nbsp;注:</td>
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




