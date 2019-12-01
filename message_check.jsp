 <%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
<%
     Object obj1 = session.getAttribute("name");
	 Object obj2 = session.getAttribute("password");
     if(obj1==null&&obj2==null)
	 {
%>
<script language="javascript">
<!--
var alarm=alert("請先登入!!");
location.replace("index0.jsp");
-->
</script>
<%		
	 }
	 else
	 {
         request.setCharacterEncoding("big5");	
	     String message = request.getParameter("textarea");
	     String nickname = (String)session.getAttribute("nickname");
	     SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	     String date = sdf.format(new Date());
	 	 
         if(message.trim().equals(""))
	     {
%>
<script language="javascript">
<!--
var alarm=alert("留言不能空白!!");
location.replace("teach.jsp#a");
-->
</script>
<%		
	     }
	     else
	     {
		      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
              Connection conDB = DriverManager.getConnection("jdbc:odbc:piano");
	          Statement stmt = conDB.createStatement();
	          String upd = "Insert into message(暱稱, 留言時間,留言內容) values('"+nickname+"','"+date+"','"+message+"')";
	          stmt.executeUpdate(upd);
	
              if(stmt!=null) stmt.close();
              if(conDB!=null) conDB.close();
			  response.sendRedirect("teach.jsp#a");		
	     }
	 }
%>
</head>

<body>
</body>
</html>