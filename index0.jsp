<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>
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
  <div id="cover"> <a href="index0.jsp" tittle="�¥���W������"><img src="images/0.jpg" width="900" height="175" id="logo" title="�¥���W������"/></a>  </div>
  <div id="link">
    <ul>
      <li><a href="index0.jsp">���� </a></li>
      <li><a href="teach.jsp">�о� </a></li>
      <li><a href="piano.jsp">���^�� </a></li>
      <li><a href="personal.jsp">�ӤH��T</a></li>
    </ul>
  </div>
  <div id="apDiv4">
    <center>
<%
     Object obj1 = session.getAttribute("name");
	 Object obj2 = session.getAttribute("password");
     if(obj1==null||obj2==null){  
%>
      <p><font size=5 color="blue">�|���n�J</font></p>
      <hr>
    <form  name="form1" method="post" action="login_check.jsp">
        <p>
          �b���G
            <input type="text" name="name" />
        </p>
        <p>
          �K�X�G
            <input type="password" name="password" />
        </p>
        <p>
          <input type="submit" name="button" value="�n�J" />
        </p>
    </form>  
<%
	}
   else
   {  
%><br><br><br><br><br>
<%    
       String nickname = (String)session.getAttribute("nickname");
	   out.println("<font size=4 color=red>"+nickname+"�z�n"+"</font><br><br><br><br>");	
%>
<form  name="form2" method="post" action="out_check.jsp">
   <input type="submit" name="button1" value="�n�X" />
    </form> 
<%    	   
   }
   if(request.getParameter("error")!=null)
   {
	   if(request.getParameter("error").equals("1"))
	       out.println("<font color=red>�b���αK�X����ť�</font>") ;  
	   else if(request.getParameter("error").equals("2"))
	       out.println("<font color=red>�b���αK�X��J���~</font>") ;  	               
   }
%>
<%
	if(session.getAttribute("nickname")==null){
%>
    <form name="form3" method="post" action="register.jsp">
      <input type="submit" name="button2" value="���U" />
    </form>
<%
	}
%>
    <p>&nbsp;</p>
    </center>
  </div>

  <div id="apDiv5">
    <center>
      <p><font size=5 color="blue">�~���s��</font></p>
      <hr>
      <p><a href="http://www.gangqinpu.com/" target="_blank">���ο��^</a></p>
      <p><a href="http://www.popiano.org/big5/piano/" target="_blank">�y����^��</a></p>
      <p><a href="http://www.77music.com/" target="_blank">�����^��</a></p>
      <p><a href="http://www.tintinpiano.com/" target="_blank">�ʧʪ����^��</a></p>
      <p><a href="http://www.poppiano.org/" target="_blank">����y����^��|</a></p>
    </center>
  </div>
  <div id="apDiv6">
    <center>
    <p><font size=5 color="blue">���^�а�</font></p>
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
  		<td><B>���нs��</B></td>
  		<td><B>���ЦW��</B></td>
  		<td><B>�@����</B></td>
  		<td><B>���äH��</B></td>
  		<td><B>��������</B></td>
	</tr>
<%
    int i = 0;
	while(rs.next())
	{
		i++;
		String bid = rs.getString("���нs��");
%>
		<tr bgcolor=LightGoldenrodYellow>
        	<td><B><%=bid%></B></td>
        	<td><B><a href="sheet.jsp?bid=<%=bid%>"><%=rs.getString("�ЦW")%></a></B></td>
        	<td><B><%=rs.getString("�@����")%></B></td>
        	<td><B><%=rs.getString("���äH��")%></B></td>
        	<td><B><%=rs.getString("��������")%></B></td>
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