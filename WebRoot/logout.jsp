<%@page contentType="text/html;charset=gb2312" import="java.sql.*,java.util.*"%>
 <jsp:useBean id="conn2"  class="xqwy.xqwy"/>

 <%
 			String 	  lvip=(String)session.getAttribute("tynum");
			conn2.executeUpdate("insert into xtrz (ynum,fl,remark) values('"+lvip+"',1,'ÍË³ö')");
			conn2.closeStmt();
			conn2.closeConn();
		session.setAttribute("tynum",null);
 response.sendRedirect("index.jsp");
%>
 