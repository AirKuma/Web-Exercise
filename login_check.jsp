<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
<%
     request.setCharacterEncoding("big5");
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection conDB = DriverManager.getConnection("jdbc:odbc:piano");
	 Statement stmt = conDB.createStatement();
     ResultSet rs;
     String sql=""; 
     sql = "SELECT * FROM login";
     rs = stmt.executeQuery(sql); 
	 
	 String name = request.getParameter("name");
	 String password = request.getParameter("password"); 
	 String passwordcheck="";
	 String nickname="";
	 
	  while(rs.next())
	  {
		   String bid = rs.getString("帳號");
		   if(name.equals(bid))
		   {
				passwordcheck = rs.getString("密碼");
				nickname = rs.getString("暱稱");
				break;
		   }	
	  }
	  if(rs!=null) rs.close();
	  if(stmt!=null) stmt.close();
	  if(conDB!=null) conDB.close();
	 	 
     if(name.equals("")||password.equals(""))
          response.sendRedirect("index0.jsp?error=1"); 
	 else if(password.equals(passwordcheck)!=true)
	      response.sendRedirect("index0.jsp?error=2");
	 else
	 {	  
	      response.sendRedirect("index0.jsp");
	      session.setAttribute("name",name);
	 	  session.setAttribute("password",password);
		  session.setAttribute("nickname",nickname);
	 }
%> 
</head>

<body>
</body>
</html>