<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
</script>
<script type="text/javascript">
$(document).ready(
$(function(){
	 var content = $('#message2').height();
	 content+=1650;
     apDiv11.style.height=content+"px";
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
#apDiv11 {
	position: absolute;
	width: 900px;
	height: 1800px;
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
	z-index: 1;
	left: 100px;
	top: 160px;
}
#apDiv4 {
	position: absolute;
	width: 800px;
	height: 760px;
	left: 46px;
	top: 300px;
	border-left: #4c618e 4px solid;
	border-right: #4c618e 4px solid;
	border-top: #4c618e 2px solid;
	border-bottom: #4c618e 2px solid;
}
#message {
	position: absolute;
	width: 800px;
	height: 220px;
	left: 46px;
	top: 1110px;
	border-left: #4c618e 4px solid;
	border-right: #4c618e 4px solid;
	border-top: #4c618e 2px solid;
	border-bottom: #4c618e 2px solid;
}
#message2 {
	position: absolute;
	width: 800px;
	left: 0px;
	top: 270px;
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
<div id="apDiv11">
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
      <p><font size=5 color="blue">教學</font></p>
      <hr>
      <p><strong><font size=4 >一、音高與譜表 </font></strong>      </p>
      <p>音名：C　　 D　　 E 　　F 　　　G　　 　A　　 B</p>
      <p>唱名：Ｄｏ　Ｒｅ　Ｍｉ　Ｆａ　Ｓｏｌ　ＬＡ　Ｓｉ</p>
      <p><img src="images/teach/1.png" alt="" width="550" height="50" /></p>
      <p><strong>　C5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;F5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;G5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C6</strong></p>
      <p>&nbsp;</p>
      <p><strong><font size=4 >二、拍子</font></strong>      </p>
      <table cellspacing="0" cellpadding="0">
        <tr>
          <td width="12%" align="center" bgcolor="#E4E4E4" height="32">全音符</td>
          <td width="15%" align="center" bgcolor="#E4E4E4" height="32">二分音符</td>
          <td width="15%" align="center" bgcolor="#E4E4E4" height="32">四分音符</td>
          <td width="15%" align="center" bgcolor="#E4E4E4" height="32">八分音符</td>
          <td width="12%" align="center" bgcolor="#E4E4E4" height="32">十六分<br />
            音符</td>
          <td width="15%" align="center" bgcolor="#E4E4E4" height="32">三十二分<br />
            音符</td>
          <td width="24%" align="center" bgcolor="#E4E4E4" height="32">六十四分<br />
            音符</td>
        </tr>
        <tr>
          <td width="12%" align="center" height="67"><img border="0" src="http://reocities.com/SouthBeach/castle/8104/pict/notes1.gif" width="58" height="65" /></td>
          <td width="15%" align="center" height="67"><img border="0" src="http://reocities.com/SouthBeach/castle/8104/pict/notes2.gif" width="58" height="65" /></td>
          <td width="15%" align="center" height="67"><img border="0" src="http://reocities.com/SouthBeach/castle/8104/pict/notes4.gif" width="58" height="65" /></td>
          <td width="15%" align="center" height="67"><img border="0" src="http://reocities.com/SouthBeach/castle/8104/pict/notes8.gif" width="58" height="65" /></td>
          <td width="12%" align="center" height="67"><img border="0" src="http://reocities.com/SouthBeach/castle/8104/pict/notes16.gif" width="58" height="65" /></td>
          <td width="15%" align="center" height="67"><img border="0" src="http://reocities.com/SouthBeach/castle/8104/pict/notes32.gif" width="58" height="65" /></td>
          <td width="24%" align="center" height="67"><img border="0" src="http://reocities.com/SouthBeach/castle/8104/pict/notes64.gif" width="58" height="65" /></td>
        </tr>
        <br />
      </table>
      <p>&nbsp;</p>
      <p><strong><font size="4" >三、音程</font></strong></p>
      <p><img src="images/teach/2.png" alt="" width="553" height="58" /></p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一度&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二度&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三度&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;四度&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;五度&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;六度&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;七度&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;八度 </p>
<p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <a name="a" id="a"></a>
    </center>
  </div>
<div id="message">
<center>
<p><font size=3 color="blue">留言板</font></p>
<HR />
<form id="form1" name="form1" method="post" action="message_check.jsp">
  <textarea name="textarea" cols="45" rows="8"></textarea>
  <input type="submit" name="button" value="送出" />
  <div id="message2">
    <center>
      <p><font size="3" color="blue">討論區</font></p>
      <hr />
<%  
   Statement stmt = conDB.createStatement();
   Statement stmt1 = conDB.createStatement();
   ResultSet rs,rs1;
   String sql=""; 
   sql = "SELECT * FROM message ORDER BY 留言時間 DESC";
   rs = stmt.executeQuery(sql); 
   rs1 = stmt1.executeQuery(sql); 
   
   String check = "";
   while(rs1.next())
	    check = rs1.getString("暱稱");
	
	if(check.equals(""))
	    out.println("暫無討論")	;
	else
	{	
%>  
  <table bgcolor=DodgerBlue width="800" style="word-break:break-all">
  <tr bgcolor=SkyBlue>
  <td><B>暱稱</B></td><td><B>留言時間</B></td><td width="500"><B>留言內容</B></td>
  </tr>
<%
       while(rs.next())
	   {
%>
           <tr bgcolor=LightGoldenrodYellow>
           <td><B><%=rs.getString("暱稱")%></B></td>
           <td><B><%=rs.getString("留言時間")%></B></td>
           <td><B><%=rs.getString("留言內容")%></B></td> 
<%
	   }
	   if(rs!=null) rs.close();
	   if(stmt!=null) stmt.close();
	   if(conDB!=null) conDB.close();
	}  
  %>
</table>          
    </center>
  </div>
</form> 
</center>
</div>
</div>
</body>
</html>