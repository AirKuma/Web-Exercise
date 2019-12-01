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
	Statement stmt1 = conDB.createStatement();	
    Statement stmt2 = conDB.createStatement();
	Statement stmt3 = conDB.createStatement();
    ResultSet rs,rs1;
    String sql="",sql1=""; 
    sql = "SELECT * FROM score WHERE 我的評分='"+request.getParameter("bid")+"'and 暱稱='"+nickname+"'";
	sql1 = "SELECT * FROM sheet WHERE 樂譜編號='"+request.getParameter("bid")+"'";
    rs = stmt2.executeQuery(sql);
	rs1 = stmt3.executeQuery(sql1);  
    int a=0,s=0,s1=0,score=0;
   
    while(rs.next())
	{
		a = Integer.parseInt(rs.getString("我的評分分數"));
	}
	while(rs1.next())
	{
	    s = Integer.parseInt(rs1.getString("評分人數"));
		s1 = Integer.parseInt(rs1.getString("評分總分"));
	}
	if(s==1)
	    score = 0;
	else	
	    score = (s1-a)/(s-1);
	
	String upd="Delete from score where 我的評分='"+request.getParameter("bid")+"'and 暱稱='"+nickname+"'";
	stmt.executeUpdate(upd);
	
	String upd1="Update sheet SET 評分人數=評分人數-1,評分總分=評分總分-"+a+",評分分數="+score+" where 樂譜編號='" + request.getParameter("bid") + "'";
	stmt1.executeUpdate(upd1);
	
	if(stmt!=null) stmt.close();
	if(stmt1!=null) stmt1.close();
	if(rs!=null) rs.close();
	if(rs1!=null) rs1.close();
	if(stmt2!=null) stmt2.close();
	if(conDB!=null) conDB.close();
	response.sendRedirect("personal.jsp#1");
%>
<body>
</body>
</html>