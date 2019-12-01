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
	 var content = $('#apDiv4').height();
	 content+=600;
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
#apDiv4 {
	position: absolute;
	width: 800px;
	left: 45px;
	top: 300px;
	border-left: #4c618e 4px solid;
	border-right: #4c618e 4px solid;
	border-top: #4c618e 2px solid;
	border-bottom: #4c618e 2px solid;
}
</style>
</head>
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

<div id="apDiv4">
    <center>
<%
     String nickname = (String)session.getAttribute("nickname");
%>
      <p><font color="blue" size="5"><%=nickname%>個人資訊</font></p>
      <hr>
      <a name="4" id="4"></a>
      <p><font color="red" size="4">我的收藏：</font></p>
<%  
    Statement stmt = conDB.createStatement();
	Statement stmt1 = conDB.createStatement();
    ResultSet rs,rs1;
    String sql=""; 
    sql = "SELECT 樂譜編號,譜名,作曲者,收藏人數,評分分數 FROM sheet,preference WHERE preference.暱稱='"+nickname+"'and 樂譜編號=我的收藏";
    rs = stmt.executeQuery(sql); 
	rs1 = stmt1.executeQuery(sql); 
	
	String check = "";
	while(rs.next())
	    check = rs.getString("樂譜編號");
	
	if(check.equals(""))
	    out.println("暫無收藏")	;
	else
	{	
%>  
  <table bgcolor=DodgerBlue>
  <tr bgcolor=SkyBlue>
  <td><B>樂譜編號</B></td><td><B>樂譜名稱</B></td><td><B>作曲者</B></td><td><B>收藏人數</B></td><td><B>評分分數</B></td><td><B>取消收藏</B></td>
  </tr>
<%
       while(rs1.next())
	   {
		   String bid = rs1.getString("樂譜編號");
		   %>
           <tr bgcolor=LightGoldenrodYellow>
           <td><B><%=bid%></B></td>
           <td><B><a href="sheet.jsp?bid=<%=bid%>"><%=rs1.getString("譜名")%></a></B></td>
           <td><B><%=rs1.getString("作曲者")%></B></td>
           <td><B><%=rs1.getString("收藏人數")%></B></td>
           <td><B><%=rs1.getString("評分分數")%></B></td>
           <td><a href="delete.jsp?bid=<%=bid%>">取消收藏</a></td>
           <%
	   }
	}
	 if(rs!=null) rs.close();
	 if(rs1!=null) rs1.close();
	 if(stmt!=null) stmt.close();
	 if(stmt1!=null) stmt1.close();
 %>
</table> 
<a name="1" id="1"></a>
      <p><font color="red" size="4">我的評分：</font></p>
<%  
    Statement stmt2 = conDB.createStatement();
	Statement stmt3 = conDB.createStatement();
    ResultSet rs2,rs3;
    String sql1=""; 
    sql1 = "SELECT 樂譜編號,譜名,我的評分分數,評分分數 FROM sheet,score WHERE score.暱稱='"+nickname+"'and 樂譜編號=我的評分";
    rs2 = stmt2.executeQuery(sql1); 
	rs3 = stmt3.executeQuery(sql1); 
	
	String check1 = "";
	while(rs2.next())
	    check1 = rs2.getString("樂譜編號");
	
	if(check1.equals(""))
	    out.println("暫無評分")	;
	else
	{	
%>  
  <table bgcolor=DodgerBlue>
  <tr bgcolor=SkyBlue>
  <td><B>樂譜編號</B></td><td><B>樂譜名稱</B></td><td><B>我的評分分數</B></td><td><B>樂譜評分分數</B></td><td><B>取消評分</B></td>
  </tr>
<%
       while(rs3.next())
	   {
		   String bid = rs3.getString("樂譜編號");
		   %>
           <tr bgcolor=LightGoldenrodYellow>
           <td><B><%=bid%></B></td>
           <td><B><a href="sheet.jsp?bid=<%=bid%>"><%=rs3.getString("譜名")%></a></B></td>
           <td><B><%=rs3.getString("我的評分分數")%></B></td>
           <td><B><%=rs3.getString("評分分數")%></B></td>
           <td><a href="delete2.jsp?bid=<%=bid%>">取消評分</a></td>
           <%
	   }
	}
	 if(rs2!=null) rs2.close();
	 if(rs3!=null) rs3.close();
	 if(stmt2!=null) stmt2.close();
	 if(stmt3!=null) stmt3.close();
 %>
</table>   
<a name="2" id="2"></a>    
      <p><font color="red" size="4">我的留言：</font></p>
      <p><font color="blue">教學文：</font></p>
<%  
    Statement stmt4 = conDB.createStatement();
	Statement stmt5 = conDB.createStatement();
    ResultSet rs4,rs5;
    String sql2=""; 
    sql2 = "SELECT * FROM message WHERE 暱稱='"+nickname+"'";
    rs4 = stmt4.executeQuery(sql2); 
	rs5 = stmt5.executeQuery(sql2); 
	
	String check2 = "";
	while(rs4.next())
	    check2 = rs4.getString("暱稱");
	
	if(check2.equals(""))
	    out.println("暫無留言")	;
	else
	{	
%>  
  <table bgcolor=DodgerBlue style="word-break:break-all">
  <tr bgcolor=SkyBlue>
  <td><B>留言時間</B></td><td><B>留言內容</B></td><td><B>取消留言</B></td>
  </tr>
<%
       while(rs5.next())
	   {
		   String bid = rs5.getString("留言編號");
		   %>
           <tr bgcolor=LightGoldenrodYellow>
           <td><B><%=rs5.getString("留言時間")%></B></td>
           <td width="300"><B><%=rs5.getString("留言內容")%></B></td>
           <td><a href="delete3.jsp?bid=<%=bid%>">取消留言</a></td>
           <%
	   }
	}
	 if(rs4!=null) rs4.close();
	 if(rs5!=null) rs5.close();
	 if(stmt4!=null) stmt4.close();
	 if(stmt5!=null) stmt5.close();
 %>
</table>
<a name="3" id="3"></a>
    <p><font color="blue">鋼琴譜：</font></p>
<%  
    Statement stmt6 = conDB.createStatement();
	Statement stmt7 = conDB.createStatement();
    ResultSet rs6,rs7;
    String sql3=""; 
    sql3 = "SELECT * FROM message2,sheet WHERE message2.暱稱='"+nickname+"'and message2.樂譜編號=sheet.樂譜編號";
    rs6 = stmt6.executeQuery(sql3); 
	rs7 = stmt7.executeQuery(sql3); 
	
	String check3 = "";
	while(rs6.next())
	    check3 = rs6.getString("暱稱");
	
	if(check3.equals(""))
	    out.println("暫無留言")	;
	else
	{	
%>  
  <table bgcolor=DodgerBlue style="word-break:break-all">
  <tr bgcolor=SkyBlue>
  <td><B>樂譜名稱</B></td><td><B>留言時間</B></td><td><B>留言內容</B></td><td><B>取消留言</B></td>
  </tr>
<%
       while(rs7.next())
	   {
		   String bid = rs7.getString("留言編號");
		   String bid1 = rs7.getString("樂譜編號");
		   %>
           <tr bgcolor=LightGoldenrodYellow>
           <td><B><a href="sheet.jsp?bid=<%=bid1%>"><%=rs7.getString("譜名")%></a></B></td>
           <td><B><%=rs7.getString("留言時間")%></B></td>
           <td width="300"><B><%=rs7.getString("留言內容")%></B></td>
           <td><a href="delete4.jsp?bid=<%=bid%>">取消留言</a></td>
           <%
	   }
	}
	 if(rs6!=null) rs6.close();
	 if(rs7!=null) rs7.close();
	 if(stmt6!=null) stmt6.close();
	 if(stmt7!=null) stmt7.close();
 %>
</table>
    </center>
  </div>
</div>
</body>
</html>