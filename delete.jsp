<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>
</head>
<%
    String nickname = (String)session.getAttribute("nickname");
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Connection conDB = DriverManager.getConnection("jdbc:odbc:piano");
	Statement stmt = conDB.createStatement();
	Statement stmt1 = conDB.createStatement();
	
	String upd="Delete from preference where �ڪ�����='"+request.getParameter("bid")+"'and �ʺ�='"+nickname+"'";
	stmt.executeUpdate(upd);
	
	String upd1="Update sheet SET ���äH��=���äH��-1 where ���нs��='" + request.getParameter("bid") + "'";
	stmt1.executeUpdate(upd1);
	
	if(stmt!=null) stmt.close();
	if(stmt1!=null) stmt1.close();
	if(conDB!=null) conDB.close();
	response.sendRedirect("personal.jsp#4");
%>
<body>
</body>
</html>