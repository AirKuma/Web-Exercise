 <%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
<%
     request.setCharacterEncoding("big5");	
	 String text_ac = request.getParameter("text_ac");
	 String text_nickname = request.getParameter("text_nickname"); 
	 String text_pw = request.getParameter("text_pw");
	 String text_re_pw = request.getParameter("text_re_pw");
	 String text_email = request.getParameter("text_email");
	 
	 if(request.getParameter("button2")!=null)
	     response.sendRedirect("register.jsp");
    	 
	 if(request.getParameter("button")!=null)	 
	 {
		request.setCharacterEncoding("big5");
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection conDB = DriverManager.getConnection("jdbc:odbc:piano");
	    Statement stmt = conDB.createStatement();
		ResultSet rs;
		String sql = "SELECT * FROM login";
		rs = stmt.executeQuery(sql);
		
		String db_nick="",db_ac="",db_email="";
		while(rs.next())
	    {
			db_nick = rs.getString("暱稱");
			db_ac = rs.getString("帳號");
			db_email = rs.getString("E_mail");
			if(db_nick.equals(text_nickname))
			{
		        response.sendRedirect("register.jsp?error=4&bk2="+text_ac+"&bk5="+text_email);
				break;
			}
	        else if(db_ac.equals(text_ac))
			{
		        response.sendRedirect("register.jsp?error=5&bk1="+text_nickname+"&bk5="+text_email);
				break;	
			}
	        else if(db_email.equals(text_email))
			{
		        response.sendRedirect("register.jsp?error=6&bk1="+text_nickname+"&bk2="+text_ac);
				break;
			}
		}
		
		if(db_nick.equals(text_nickname)!=true&&db_ac.equals(text_ac)!=true&&db_email.equals(text_email)!=true)
		{	   	 
           if(text_ac.equals("")||text_nickname.equals("")||text_pw.equals("")||text_re_pw.equals("")||text_email.equals(""))
		        response.sendRedirect("register.jsp?error=1&bk1="+text_nickname+"&bk2="+text_ac+"&bk5="+text_email);
	       else if(text_email.indexOf('@')==-1)	  
	            response.sendRedirect("register.jsp?error=2&bk1="+text_nickname+"&bk2="+text_ac); 
	       else if(text_re_pw.equals(text_pw)!=true)
	            response.sendRedirect("register.jsp?error=3&bk1="+text_nickname+"&bk2="+text_ac+"&bk5="+text_email);
	       else
	       {
	            Statement stmt1 = conDB.createStatement();
	            String upd = "Insert into login(暱稱, 帳號, 密碼, E_mail) values('"+text_nickname+"','"+text_ac+"','"+text_pw+"','"+text_email+"')";
	            stmt1.executeUpdate(upd);
	
                if(stmt1!=null) stmt1.close();
                if(conDB!=null) conDB.close();
%>
<script language="javascript">
<!--
var alarm=alert("註冊成功!!");
location.replace("index0.jsp");
-->
</script>
<%		
	       }
	   }
	}
%>
</head>

<body>
</body>
</html>