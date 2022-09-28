<%@page contentType="text/html;charset=gb2312" import="java.sql.*,java.util.*"%>
<jsp:useBean id="conn" class="xqwy.xqwy"/>
<html>
<head>
<title>小区物业管理系统</title>
<style type="text/css">
.navPoint {COLOR: white; CURSOR: hand; FONT-FAMILY: Webdings; FONT-SIZE: 9pt}
.a2{BACKGROUND-COLOR: A4B6D7;}
</style>
</head>

<!-- 载入验证 -->
<%@include file="checklogin.jsp"%>

<body style="MARGIN: 0px" scroll=no onResize=javascript:parent.carnoc.location.reload()>
<script>
if(self!=top){top.location=self.location;}
function switchSysBar(){
if (switchPoint.innerText==3){
switchPoint.innerText=4
document.all("frmTitle").style.display=""
}else{
switchPoint.innerText=3
document.all("frmTitle").style.display="none"
}}
</script>

<table border="0" cellPadding="0" cellSpacing="0" height="100%" width="100%">
  <tr>
    <td align="middle" noWrap vAlign="center" id="frmTitle">
    <iframe frameBorder="0" id="carnoc" name="carnoc" scrolling=no src="left.jsp" style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 170px; Z-INDEX: 2">
    </iframe>
    </td>
	<td style="WIDTH: 100%">
		<iframe frameborder="0" id="main" name="main" scrolling="yes" src="main.jsp" style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1">
		</iframe>
	</td>
  </tr>
</table>
<script>
if(window.screen.width<'1024'){switchSysBar()}
</script>
</body>
</html>