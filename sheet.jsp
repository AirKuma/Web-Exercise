<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>
<script type="text/javascript" src="jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="audioplayer.js"></script>

<script type="text/javascript">
$(document).ready(
$(function(){
	 var content = $('#paino').height();
	 var content2 = $('#message2').height();
	 content+=350;
     message.style.top=content+"px";
	 content+=270;
	 message2.style.top=content+"px";
	 content+=(content2+250);
     apDiv1.style.height=content+"px";
})
);
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
	height: 1500px;
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
	width: 704px;
	height: 50px;
	z-index: 1;
	left: 100px;
	top: 160px;
}
#paino {
	position: absolute;
	width: 800px;
	left: 46px;
	top: 302px;
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
	top: 100px;
	border-left: #4c618e 4px solid;
	border-right: #4c618e 4px solid;
	border-top: #4c618e 2px solid;
	border-bottom: #4c618e 2px solid;
}
#message2 {
	position: absolute;
	width: 800px;
	left: 46px;
	top: 1144px;
	border-left: #4c618e 4px solid;
	border-right: #4c618e 4px solid;
	border-top: #4c618e 2px solid;
	border-bottom: #4c618e 2px solid;
}
</style>
</head>
<%
    session.setAttribute("bid",request.getParameter("bid"));
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

<div id="paino">
    <center>
      <p><font size=5 color="blue">���^��</font></p>
      <form  name="form2" method="post" action="">
        <input type="submit" name="button2" value="����" />
        �����G
        <select name="select" >
         <option value="1">�@�P</option>
         <option value="2">�G�P</option>
         <option value="3">�T�P</option>
         <option value="4">�|�P</option>
         <option value="5">���P</option>
        </select>
        <input type="submit" name="submit" value="����" />
      </form>
      <hr>
<%
	Statement stmt_music = conDB.createStatement();
	ResultSet rs_music;
	String sql_music="";
	sql_music = "SELECT �q�� FROM sheet WHERE ���нs��='"+request.getParameter("bid")+"'";
	rs_music = stmt_music.executeQuery(sql_music);
	String music="";
	while(rs_music.next()){
		music = rs_music.getString("�q��");
%>

<script type="text/javascript">
$( 'audio' ).audioPlayer(
{
    classPrefix: 'audioplayer',
    strPlay: 'Play',
    strPause: 'Pause',
    strVolume: 'Volume'
});
</script>
    <audio src="music/<%= music%>" preload="auto" controls></audio>
<!--http://osvaldas.info/audio-player-responsive-and-touch-friendly-->
<HR />
<%
	}
	if(rs_music!=null)	rs_music.close();
	if(stmt_music!=null)	stmt_music.close();
%>

<%  
   Statement stmt = conDB.createStatement();
   Statement stmt2 = conDB.createStatement();
   ResultSet rs,rs2;
   String sql="",sql1=""; 
   sql = "SELECT * FROM sheet WHERE ���нs��='"+request.getParameter("bid")+"'";
   sql1 = "SELECT * FROM sheetimg WHERE ���нs��='"+request.getParameter("bid")+"'";
   rs = stmt.executeQuery(sql);
   rs2= stmt2.executeQuery(sql1);
   String sheetname = "";
   int s = 0,s1=0;
   
    while(rs.next())
	{
		sheetname = rs.getString("�ЦW");
		s = Integer.parseInt(rs.getString("�����H��"));
		s1 = Integer.parseInt(rs.getString("�����`��"));	
    } 
	if(rs!=null) rs.close();
	 while(rs2.next())
	{
%>
<img width="500" height="700" src="sheet/<%=rs2.getString("���нs��")%>/<%=rs2.getString("����")%>">
<%	
    } 
	if(rs2!=null) rs2.close();
%>
</table>
<%
     if(request.getParameter("button2")!=null)
	 {
        Object obj1 = session.getAttribute("name");
	    Object obj2 = session.getAttribute("password");
        if(obj1==null&&obj2==null)
	    {
%>
<script language="javascript">
<!--
var alarm=alert("�Х��n�J!!");
location.replace("index0.jsp");
-->
</script>
<%		
	    }
        else
	    {
			Statement stmt3 = conDB.createStatement();
            ResultSet rs1;
			String nick = (String)session.getAttribute("nickname");
			String  sql2 = "SELECT * FROM preference WHERE �ʺ�='"+nick+"'and �ڪ�����='" + request.getParameter("bid") + "'";
            rs1 = stmt3.executeQuery(sql2);  
			String sheet = "";
			
			while(rs1.next())
				sheet = rs1.getString("�ڪ�����");
			if(sheet.equals("")!=true)
			{
%>
<script language="javascript">
<!--
var alarm=alert("���Фw����!!");
location.replace("sheet.jsp?bid=<%=request.getParameter("bid")%>");
-->
</script>
<%					
			}
			else
			{
		        Statement stmt1 = conDB.createStatement();
		        String upd = "Insert into preference(�ʺ�, �ڪ�����) values('"+nick+"','"+request.getParameter("bid")+"')";
	      	    stmt1.executeUpdate(upd); 
			
		    	sql="Update sheet SET ���äH��=���äH��+1 where ���нs��='" + request.getParameter("bid") + "'";
			    stmt.executeUpdate(sql);
		        if(stmt1!=null) stmt1.close();
%>
<script language="javascript">
<!--
var alarm=alert("���æ��\!!");
location.replace("sheet.jsp?bid=<%=request.getParameter("bid")%>");
-->
</script>
<%					
			}
			if(stmt!=null) stmt.close();
			if(stmt3!=null) stmt3.close();
        }
	}
     if(request.getParameter("submit")!=null)
	 {
        Object obj1 = session.getAttribute("name");
	    Object obj2 = session.getAttribute("password");
        if(obj1==null&&obj2==null)
	    {
%>
<script language="javascript">
<!--
var alarm=alert("�Х��n�J!!");
location.replace("index0.jsp");
-->
</script>
<%		
	    }
        else
	    {
			int a = Integer.parseInt(request.getParameter("select"));
			Statement stmt3 = conDB.createStatement();
            ResultSet rs1;
			String nick = (String)session.getAttribute("nickname");
			String  sql2 = "SELECT * FROM score WHERE �ʺ�='"+nick+"'and �ڪ�����='" + request.getParameter("bid") + "'";
            rs1 = stmt3.executeQuery(sql2);  
			String sco = "";
			
			while(rs1.next())
				sco = rs1.getString("�ڪ�����");
			if(sco.equals("")!=true)
			{
%>
<script language="javascript">
<!--
var alarm=alert("���Фw����!!");
location.replace("sheet.jsp?bid=<%=request.getParameter("bid")%>");
-->
</script>
<%					
			}
			else
			{
		        Statement stmt1 = conDB.createStatement();
		        String upd = "Insert into score(�ʺ�, �ڪ�����,�ڪ���������) values('"+nick+"','"+request.getParameter("bid")+"',"+a+")";
	      	    stmt1.executeUpdate(upd); 
			
		        int score = (s1+a)/(s+1);
			
			    sql="Update sheet SET �����H��=�����H��+1,�����`��=�����`��+"+a+",��������="+score+" where ���нs��='" + request.getParameter("bid") + "'";
			    stmt.executeUpdate(sql);		
			    if(stmt!=null) stmt.close();
				if(stmt1!=null) stmt1.close();
%>
<script language="javascript">
<!--
var alarm=alert("�������\!!");
location.replace("sheet.jsp?bid=<%=request.getParameter("bid")%>");
-->
</script>
<%					
			}
			if(stmt!=null) stmt.close();
			if(stmt3!=null) stmt3.close();
        }
	}
%>

    </center>
  </div>
<div id="message">
  <center>
  <a name="b" id="b"></a>
    <p><font size="3" color="blue">�d���O</font></p>
    <hr />
    <form id="form1" name="form1" method="post" action="message2_check.jsp">
      <textarea name="textarea" cols="45" rows="8"></textarea>
      <input type="submit" name="button" value="�e�X" />
    </form>
  </center>
</div>
<div id="message2">
  <center>
    <p><font size="3" color="blue">�Q�װ�</font></p>
    <hr />
    <%  
   Statement stmt4 = conDB.createStatement();
   Statement stmt5 = conDB.createStatement();
   ResultSet rs4,rs5;
   String sql4=""; 
   sql4 = "SELECT * FROM message2 WHERE ���нs��='"+request.getParameter("bid")+"' ORDER BY �d���ɶ� DESC";
   rs4 = stmt4.executeQuery(sql4); 
   rs5 = stmt5.executeQuery(sql4); 
   
   String check = "";
   while(rs4.next())
	    check = rs4.getString("�ʺ�");
	
	if(check.equals(""))
	    out.println("�ȵL�Q��")	;
	else
	{	
%>
    <table bgcolor="DodgerBlue" width="800" style="word-break:break-all">
      <tr bgcolor="SkyBlue">
        <td><b>�ʺ�</b></td>
        <td><b>�d���ɶ�</b></td>
        <td width="500"><b>�d�����e</b></td>
      </tr>
      <%
       while(rs5.next())
	   {
%>
      <tr bgcolor="LightGoldenrodYellow">
        <td><b><%=rs5.getString("�ʺ�")%></b></td>
        <td><b><%=rs5.getString("�d���ɶ�")%></b></td>
        <td><b><%=rs5.getString("�d�����e")%></b></td>
        <%
	   }
	   if(rs4!=null) rs4.close();
	   if(stmt4!=null) stmt4.close();
	   if(rs5!=null) rs5.close();
	   if(stmt5!=null) stmt5.close();
	}  
	if(conDB!=null) conDB.close();
  %>
      </tr>
    </table>
  </center>
</div>

</div>
</body>
</html>