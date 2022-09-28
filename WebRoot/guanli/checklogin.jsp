
<% 
	if(session.getAttribute("admin")==null){
%>
		<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>

