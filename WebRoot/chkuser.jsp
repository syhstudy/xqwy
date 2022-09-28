 <%@page contentType="text/html;charset=gb2312" import="java.sql.* ,java.util.*"%>
 
 <jsp:useBean id="chk"  class="xqwy.xqwy"/>
 <jsp:useBean id="conn2"  class="xqwy.xqwy"/>
<%
 	String ynum = request.getParameter("zhm");
	String password = request.getParameter("mm");

 	ResultSet rst=chk.executeQuery("select * from yz where ynum='"+ynum+"' and pawd = '"+password+"'");
int yes=0;
if(rst.next())
{
	session.setAttribute("tynum",ynum);
 	yes=1;

}rst.close();

			if(yes==0  )//判断是否密码正确。
			{
				%>
						<script>
							 window.alert("您输入的帐号，或密码能错！");
							 history.back();
						</script>
				<%		
			}else
			response.sendRedirect("index.jsp");

 %>
