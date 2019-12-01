<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
</head>
<%
    String nickname = (String)session.getAttribute("nickname");
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Connection conDB = DriverManager.getConnection("jdbc:odbc:piano");
	Statement stmt = conDB.createStatement();
	
	String upd="Delete from message where 留言編號="+request.getParameter("bid")+" and 暱稱='"+nickname+"'";
	stmt.executeUpdate(upd);
	
	
	if(stmt!=null) stmt.close();
	if(conDB!=null) conDB.close();
	response.sendRedirect("personal.jsp#2");
%>
<body>
</body>
</html>