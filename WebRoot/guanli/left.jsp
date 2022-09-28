 <%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
 <jsp:useBean id="ldb" scope="page" class="xqwy.xqwy"/>
 <html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>后台管理系统</title>
<link rel="stylesheet" type="text/css" href="images/Style.css">

<style type="text/css">
<!--
.ttl {	CURSOR: hand; COLOR: #000000; PADDING-TOP: 4px
}
BODY {
	MARGIN-TOP: 5px; MARGIN-LEFT: 2px; BACKGROUND-COLOR: #158AAD; TEXT-ALIGN: center
}
td{
	line-height:170%;
}
-->
</style>

<script language="javascript">
function showHide(obj)
{
	obj.style.display = obj.style.display == "none" ? "block" : "none";
}
</script>
</head>

<body>
<!-- 载入验证 -->
<%@include file="checklogin.jsp"%>
<%
int u_pri=0;
String th_wnumc="";

	  th_wnumc=(String)session.getAttribute("admin");

	//3 管理员　  2 　会计   1　　小区服务员
	ResultSet urs=ldb.executeQuery("select * from admins where wnum='"+th_wnumc+"'");

	if(urs.next())
	{
		u_pri=urs.getInt("tpri");
	}
	urs.close();

	if(u_pri==2)
	{   //会计
%>
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu6)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><strong class="mtitle">系统管理</strong></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu6" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
		   <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="logout.jsp" target="_parent">安全退出</a></td>
          </tr>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="upas0.jsp" target="main">修改密码</a></td>
          </tr>

        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu93)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">业主信息管理</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu93" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
 
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="ad_yz.jsp" target="main">添加业主</a>|<img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_yz.jsp" target="main">管理业主</a></td>
          </tr>

        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />


<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu395)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">业主费用管理</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu395" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="ad_fy.jsp" target="main">添加费用</a>|<img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_fy.jsp" target="main">管理费用</a></td>
          </tr>

        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu297)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">系统使用说明</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu297" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
			<tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="c.jsp" target="main">查看系统说明</a></td>
          </tr>
         </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />

<%
	;
	}
	if(u_pri==3)
	{	//管理员
		%>
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu6)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><strong class="mtitle">系统管理</strong></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu6" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
		   <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="logout.jsp" target="_parent">安全退出</a>|<img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="upas0.jsp" target="main">修改密码</a></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />

<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu932)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">物业人员管理</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu932" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="ad_admin.jsp" target="main">添加用户</a>|<img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_admin.jsp" target="main">管理用户</a></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>


<br />


<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu93)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">业主信息管理</span></td>
          </tr>
        </tbody>
      </table></td>
      
    </tr>
    <tr id="menu93" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
 
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="ad_yz.jsp" target="main">添加业主</a>|<img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_yz.jsp" target="main">管理业主</a></td>
          </tr>

        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu95)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">业主投诉管理</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu95" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_ts.jsp" target="main">管理业主投诉</a></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />

<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu395)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">业主费用管理</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu395" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="ad_fy.jsp" target="main">添加费用</a>|<img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_fy.jsp" target="main">管理费用</a></td>
          </tr>

        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br>
 <table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu94)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">停车车位管理</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu94" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="ad_cw.jsp" target="main">添加车位</a>|<img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_cw.jsp" target="main">管理车位</a></td>
          </tr>
        </tbody>
      </table></td> 

    </tr>
  </tbody>
</table>
<br />

<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu295)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">业主报修管理</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu295" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
			<tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_deal_bx.jsp" target="main">处理报修</a>|<img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_bx.jsp" target="main">查询报修</a></td>
          </tr>
         </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu632)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">小区公告管理</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu632" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="ad_gg.jsp" target="main">添加小区公告</a></td>
          </tr>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_gg.jsp" target="main">管理小区公告</a></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>

<br />


<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu944)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">管理日志</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu944" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_rz.jsp" target="main">查询用户操作日志</a></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu396)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">数据库的备份</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu396" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="bf.jsp" target="main">备份</a>|<img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="hf.jsp" target="main">恢复</a></td>
          </tr>

        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu297)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">系统使用说明</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu297" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
			<tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="c.jsp" target="main">查看系统说明</a></td>
          </tr>
         </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />
<%
	;
	}
	if(u_pri==1)
	{	//小区服务员
		%>
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu6)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><strong class="mtitle">系统管理</strong></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu6" style="display: block">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
		   <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="logout.jsp" target="_parent">安全退出</a></td>
          </tr>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="upas0.jsp" target="main">修改密码</a></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu93)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">业主信息管理</span></td>
          </tr>
        </tbody>
      </table></td>
      
    </tr>
    <tr id="menu93" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
 
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="ad_yz.jsp" target="main">添加业主</a>|<img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_yz.jsp" target="main">管理业主</a></td>
          </tr>

        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu95)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">业主投诉管理</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu95" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_ts.jsp" target="main">管理业主投诉</a></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>

<br />
 <table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu94)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">停车车位管理</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu94" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="ad_cw.jsp" target="main">添加车位</a>|<img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_cw.jsp" target="main">管理车位</a></td>
          </tr>
        </tbody>
      </table></td> 

    </tr>
  </tbody>
</table>
<br />
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu632)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">小区公告管理</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu632" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="ad_gg.jsp" target="main">添加小区公告</a></td>
          </tr>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_gg.jsp" target="main">管理小区公告</a></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>

<br />
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu297)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">系统使用说明</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu297" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
			<tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="c.jsp" target="main">查看系统说明</a></td>
          </tr>
         </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />
<%
	;
	}
	if(u_pri==4)
	{	//维修工
		%>
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu6)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><strong class="mtitle">系统管理</strong></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu6" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
		   <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="logout.jsp" target="_parent">安全退出</a></td>
          </tr>
          <tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="upas0.jsp" target="main">修改密码</a></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu295)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">业主报修管理</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu295" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
			<tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_deal_bx.jsp" target="main">处理报修</a>|<img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="m_bx.jsp" target="main">查询报修</a></td>
          </tr>
         </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />
<table cellspacing="1" cellpadding="3" width="150" align="center" bgcolor="#999999" 
border="0">
  <tbody>
    <tr>
      <td class="ttl" onclick="showHide(menu297)" valign="top" align="left" background="images/top-bj3.jpg"><table cellspacing="0" cellpadding="0" width="127" border="0">
        <tbody>
          <tr>
            <td width="8">&nbsp;</td>
            <td align="left" width="117"><span class="mtitle">系统使用说明</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr id="menu297" style="display: none">
      <td valign="top" align="middle" bgcolor="#f3f5f1"><table width="100%">
        <tbody>
			<tr>
            <td align="left"><img height="7" hspace="5" src="images/arrow.gif" width="5" align="absmiddle" /><a  href="c.jsp" target="main">查看系统说明</a></td>
          </tr>
         </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<br />
<%
	;
	}
%>
</body>
</html>
 
