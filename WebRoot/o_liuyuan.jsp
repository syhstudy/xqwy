<%@page contentType="text/html;charset=gb2312" import="java.sql.*,java.util.*"%>
<jsp:useBean id="db1"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db2"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db"  scope="page" class="xqwy.xqwy"/>
<jsp:useBean id="db3"  scope="page" class="xqwy.xqwy"/>

<%@ include file="top.jsp" %>
<!-- ===================================== -->
<!-- ===================================== -->
<SCRIPT LANGUAGE="JavaScript">
<!--
  function showLength(f) 
  {
    var fm2 = window.document.lid;
    var fm3 = window.document.lid;
   		var num = fm2.content.value.length;
   		if (f == 0) 
   		{
  	  	  fm3.charleft.value = "word£º" + num;
  	  	}
 	  	
  	  	 if (num > 500) 
         {
            window.alert("\word >500!");
            fm2.content.value =fm2.content.value.substr(0,500);
            num = 500;
         }
  	  	fm3.charleft.value = "" + num;         
  } 

function isValid()
{
 
	 if(document.lid.namess.value=="")
	{
	window.alert("ÇëÊäÈëêÇ³Æ £¡");
	document.lid.namess.focus();
	return false;
	} 

	 if(document.lid.content.value=="")
	{
	window.alert("ÇëÊäÈëÁôÑÔÄÚÈÝ£¡");
	document.lid.content.focus();
	return false;
	} 
}

//-->
</SCRIPT>

<!--  -->
 
 
 
<!-- ====================================== -->
<%@ include file="foot.jsp"  %>
 <%

 
String namess= new String(request.getParameter("namess").getBytes("8859_1"));

String content= new String(request.getParameter("content").getBytes("8859_1"));
 

String sql2="insert into liuyuan (name,liuyuan )values('"+namess+"', '"+content+"'  )";
db2.executeUpdate(sql2);
 			db2.closeStmt();
			db2.closeConn();	
	response.sendRedirect("liuyuan.jsp");

%>