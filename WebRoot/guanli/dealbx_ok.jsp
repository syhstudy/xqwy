<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="db"  scope="page" class="xqwy.xqwy"/>


<%

String rec_id=request.getParameter("rec_id");

 String wxg= new String(request.getParameter("wxg").getBytes("8859_1"));
  String wxcontent= new String(request.getParameter("wxcontent").getBytes("8859_1"));

String sql2="update bxxx set zt=1, wxg='"+wxg+"' , wxcontent='"+wxcontent+"' ,wxtime=getdate() where rec_id= '"+rec_id+"'";
  			
			db.executeUpdate(sql2);
			db.closeStmt();
			db.closeConn();

 			//插入日志
			String 	  yadmin=(String)session.getAttribute("admin");//获获取当前操作用户名

			db.executeUpdate("insert into system_rz (wnum,remark) values('"+yadmin+"','处理业信报修信息ID:"+rec_id+"')");
			db.closeStmt();
			db.closeConn();
%>
 

<title>无标题文档</title>
</head>

<body bgcolor="#FFFFFF" text="#000000" onLoad="load2()">
<script language="JavaScript" type="text/JavaScript">
function load2() {
opener.setTimeout("subaggmit01()",15)
self.setTimeout("exit()",10)
}
function exit() {
window.close()
}
</script>

</body>
</html>



