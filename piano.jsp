<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(document).ready(
$(function(){
	 var content = $('#paino').height();
	 var content2 = $('#message2').height();
	 content+=500;
     apDiv1.style.height=content+"px";
}
));
</script>
<style type="text/css">
ul {
	border-left: #4c618e 4px solid;
	overflow: auto;
	padding: 0;
}
li {
	border-top: #4c618e 2px solid;
	border-bottom: #4c618e 2px solid;
	list-style-type: none;
	float: left;
	font-size: 20px;
}
li a {
	display: block;
	width: 170px;
	height: 50px;
	background-color:rgba(98,102,157,0.3);
	font-weight: bold;
	text-align: center;
	line-height: 50px;
	text-decoration: none;
	border-right: #4c618e 4px solid;
}
li a:hover {
	background-color: #3FC;
	color: #F00;
}
body {
	background-color: #666;
}
#apDiv1 {
	position: absolute;
	width: 900px;
	height: 1200px;
	left: 50%;
	margin-top: 0px;
	margin-left: -450px;
	background-color: #CCFF99;
	background-image: url(images/background.jpg);
}
#cover {
	position: absolute;
	width: 700px;
	height: 175px;
	z-index: 1;
}
#link {
	position: absolute;
	width: 900px;
	height: 50px;
	z-index: 1;
	left: 100px;
	top: 160px;
}
#paino {
	position: absolute;
	width: 800px;
	left: 46px;
	top: 300px;
	border-left: #4c618e 4px solid;
	border-right: #4c618e 4px solid;
	border-top: #4c618e 2px solid;
	border-bottom: #4c618e 2px solid;
}
</style>
</head>
<%
    request.setCharacterEncoding("big5");
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Connection conDB = DriverManager.getConnection("jdbc:odbc:piano");
%>
<body>
<div id="apDiv1">
  <div id="cover"> <a href="index0.jsp" tittle="黑白鍵上的悸動"><img src="images/0.jpg" width="900" height="175" id="logo" title="黑白鍵上的悸動"/></a>  </div>
<div id="link">
    <ul>
      <li><a href="index0.jsp">首頁 </a></li>
      <li><a href="teach.jsp">教學 </a></li>
      <li><a href="piano.jsp">鋼琴譜 </a></li>
      <li><a href="personal.jsp">個人資訊</a></li>
    </ul>
  </div>
<script type="text/javascript">

</script>

<div id="paino">
    <center>
      <p><font size=5 color="blue">鋼琴譜</font></p>
      <hr>
      <form action="piano.jsp" method="post">
  <p>輸入樂譜名關鍵字：
  <input name="sheet" type="text" />
  </p>
  <p>輸入作曲者關鍵字：
    <input name="author" type="text" />
  </p>
  <p>
    <input type="submit" name="button" value="查詢" />
</p>
</form>
<%  
   Statement stmt = conDB.createStatement();
   Statement stmt1 = conDB.createStatement();
   ResultSet rs,rs1;
   String sql="";
   if(request.getParameter("button")!=null)
   {
	   if(request.getParameter("sheet").equals("")==false&&request.getParameter("author").equals("")==false)
	   {		
	       sql = "SELECT * FROM sheet WHERE 譜名 like '%"+request.getParameter("sheet")+"%' and 作曲者 like '%"+request.getParameter("author")+"%'";
	   }
	   else if(request.getParameter("sheet").equals("")==true&&request.getParameter("author").equals("")==false)	
	   { 
		   sql = "SELECT * FROM sheet WHERE 作曲者 like '%"+request.getParameter("author")+"%'"; 
	   }
	   else if(request.getParameter("sheet").equals("")==false&&request.getParameter("author").equals("")==true)	 
	   {
		   sql = "SELECT * FROM sheet WHERE 譜名 like '%"+request.getParameter("sheet")+"%'";
	   }
	   else if(request.getParameter("sheet").equals("")==true&&request.getParameter("author").equals("")==true)	
	   { 
	          sql = "SELECT * FROM sheet";  
	   }
   }
   else	    
       sql = "SELECT * FROM sheet";
   rs = stmt.executeQuery(sql);  
   rs1 = stmt1.executeQuery(sql); 
   String check = "";
   while(rs1.next())
	    check = rs1.getString("樂譜編號");
	
	if(check.equals(""))
	    out.println("查無此譜!!")	;
	else
	{	 
%>
<table bgcolor=DodgerBlue>
  <tr bgcolor=SkyBlue>
  <td><B>樂譜編號</B></td><td><B>樂譜名稱</B></td><td><B>作曲者</B></td><td><B>收藏人數</B></td><td><B>評分分數</B></td>
  </tr>
  <%
       while(rs.next())
	   {
		   String bid = rs.getString("樂譜編號");
		   %>
           <tr bgcolor=LightGoldenrodYellow>
           <td><B><%=bid%></B></td>
           <td><B><a href="sheet.jsp?bid=<%=bid%>"><%=rs.getString("譜名")%></a></B></td>
           <td><B><%=rs.getString("作曲者")%></B></td>
           <td><B><%=rs.getString("收藏人數")%></B></td>
           <td><B><%=rs.getString("評分分數")%></B></td>
           <%
	   }
	 }
	 if(rs!=null) rs.close();
	 if(stmt!=null) stmt.close();
	 if(stmt1!=null) stmt1.close();
	 if(conDB!=null) conDB.close();
%>
</table>
    </center>
  </div>

</div>
</body>
</html>