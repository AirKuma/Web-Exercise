<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
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
	font-weight: bold;
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
	width: 700px;
	height: 50px;
	left: 100px;
	top: 160px;
}
#apDiv4 {
	position: absolute;
	width: 260px;
	height: 250px;
	left: 46px;
	top: 300px;
	border-left: #4c618e 4px solid;
	border-right: #4c618e 4px solid;
	border-top: #4c618e 2px solid;
	border-bottom: #4c618e 2px solid;
}
#apDiv5 {
	position: absolute;
	width: 260px;
	height: 300px;
	left: 46px;
	top: 600px;
	border-left: #4c618e 4px solid;
	border-right: #4c618e 4px solid;
	border-top: #4c618e 2px solid;
	border-bottom: #4c618e 2px solid;
}
#apDiv6 {
	position: absolute;
	width: 500px;
	height: 600px;
	left: 346px;
	top: 300px;
	border-left: #4c618e 4px solid;
	border-right: #4c618e 4px solid;
	border-top: #4c618e 2px solid;
	border-bottom: #4c618e 2px solid;
	overflow: hidden;
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
  <div id="apDiv4">
    <center>
<%
     Object obj1 = session.getAttribute("name");
	 Object obj2 = session.getAttribute("password");
     if(obj1==null||obj2==null){  
%>
      <p><font size=5 color="blue">會員登入</font></p>
      <hr>
    <form  name="form1" method="post" action="login_check.jsp">
        <p>
          帳號：
            <input type="text" name="name" />
        </p>
        <p>
          密碼：
            <input type="password" name="password" />
        </p>
        <p>
          <input type="submit" name="button" value="登入" />
        </p>
    </form>  
<%
	}
   else
   {  
%><br><br><br><br><br>
<%    
       String nickname = (String)session.getAttribute("nickname");
	   out.println("<font size=4 color=red>"+nickname+"您好"+"</font><br><br><br><br>");	
%>
<form  name="form2" method="post" action="out_check.jsp">
   <input type="submit" name="button1" value="登出" />
    </form> 
<%    	   
   }
   if(request.getParameter("error")!=null)
   {
	   if(request.getParameter("error").equals("1"))
	       out.println("<font color=red>帳號或密碼不能空白</font>") ;  
	   else if(request.getParameter("error").equals("2"))
	       out.println("<font color=red>帳號或密碼輸入錯誤</font>") ;  	               
   }
%>
<%
	if(session.getAttribute("nickname")==null){
%>
    <form name="form3" method="post" action="register.jsp">
      <input type="submit" name="button2" value="註冊" />
    </form>
<%
	}
%>
    <p>&nbsp;</p>
    </center>
  </div>

  <div id="apDiv5">
    <center>
      <p><font size=5 color="blue">外站連結</font></p>
      <hr>
      <p><a href="http://www.gangqinpu.com/" target="_blank">蟲蟲鋼琴</a></p>
      <p><a href="http://www.popiano.org/big5/piano/" target="_blank">流行網琴網</a></p>
      <p><a href="http://www.77music.com/" target="_blank">蛐蛐鋼琴網</a></p>
      <p><a href="http://www.tintinpiano.com/" target="_blank">廷廷的鋼琴窩</a></p>
      <p><a href="http://www.poppiano.org/" target="_blank">香港流行網琴協會</a></p>
    </center>
  </div>
  <div id="apDiv6">
    <center>
    <p><font size=5 color="blue">鋼琴譜區</font></p>
      <hr>
<%  
   Statement stmt = conDB.createStatement();
   ResultSet rs;
   String sql=""; 
   sql = "SELECT * FROM sheet";
   rs = stmt.executeQuery(sql); 
%>  
	<table bgcolor=DodgerBlue>
	<tr bgcolor=SkyBlue>
  		<td><B>樂譜編號</B></td>
  		<td><B>樂譜名稱</B></td>
  		<td><B>作曲者</B></td>
  		<td><B>收藏人數</B></td>
  		<td><B>評分分數</B></td>
	</tr>
<%
    int i = 0;
	while(rs.next())
	{
		i++;
		String bid = rs.getString("樂譜編號");
%>
		<tr bgcolor=LightGoldenrodYellow>
        	<td><B><%=bid%></B></td>
        	<td><B><a href="sheet.jsp?bid=<%=bid%>"><%=rs.getString("譜名")%></a></B></td>
        	<td><B><%=rs.getString("作曲者")%></B></td>
        	<td><B><%=rs.getString("收藏人數")%></B></td>
        	<td><B><%=rs.getString("評分分數")%></B></td>
<%
            if(i>=15)
			    break;
	   }
	   if(rs!=null) rs.close();
	   if(stmt!=null) stmt.close();
	   if(conDB!=null) conDB.close();
%>
	</table>
<p>
<b>.<br>
.<br>
.<br><b>
    </center>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=4><a href="piano.jsp">more</a></font>
  </div>
</div>
</body>
</html>