<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>
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
var alarm=alert("�Х��n�J!!");
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
  <div id="cover"> <a href="index0.jsp" tittle="�¥���W������"><img src="images/0.jpg" width="900" height="175" id="logo" title="�¥���W������"/></a>  </div>
<div id="link">
    <ul>
       <li><a href="index0.jsp">���� </a></li>
      <li><a href="teach.jsp">�о� </a></li>
      <li><a href="piano.jsp">���^�� </a></li>
      <li><a href="personal.jsp">�ӤH��T</a></li>
    </ul>
  </div>
<script type="text/javascript">

</script>

<div id="apDiv4">
    <center>
<%
     String nickname = (String)session.getAttribute("nickname");
%>
      <p><font color="blue" size="5"><%=nickname%>�ӤH��T</font></p>
      <hr>
      <a name="4" id="4"></a>
      <p><font color="red" size="4">�ڪ����áG</font></p>
<%  
    Statement stmt = conDB.createStatement();
	Statement stmt1 = conDB.createStatement();
    ResultSet rs,rs1;
    String sql=""; 
    sql = "SELECT ���нs��,�ЦW,�@����,���äH��,�������� FROM sheet,preference WHERE preference.�ʺ�='"+nickname+"'and ���нs��=�ڪ�����";
    rs = stmt.executeQuery(sql); 
	rs1 = stmt1.executeQuery(sql); 
	
	String check = "";
	while(rs.next())
	    check = rs.getString("���нs��");
	
	if(check.equals(""))
	    out.println("�ȵL����")	;
	else
	{	
%>  
  <table bgcolor=DodgerBlue>
  <tr bgcolor=SkyBlue>
  <td><B>���нs��</B></td><td><B>���ЦW��</B></td><td><B>�@����</B></td><td><B>���äH��</B></td><td><B>��������</B></td><td><B>��������</B></td>
  </tr>
<%
       while(rs1.next())
	   {
		   String bid = rs1.getString("���нs��");
		   %>
           <tr bgcolor=LightGoldenrodYellow>
           <td><B><%=bid%></B></td>
           <td><B><a href="sheet.jsp?bid=<%=bid%>"><%=rs1.getString("�ЦW")%></a></B></td>
           <td><B><%=rs1.getString("�@����")%></B></td>
           <td><B><%=rs1.getString("���äH��")%></B></td>
           <td><B><%=rs1.getString("��������")%></B></td>
           <td><a href="delete.jsp?bid=<%=bid%>">��������</a></td>
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
      <p><font color="red" size="4">�ڪ������G</font></p>
<%  
    Statement stmt2 = conDB.createStatement();
	Statement stmt3 = conDB.createStatement();
    ResultSet rs2,rs3;
    String sql1=""; 
    sql1 = "SELECT ���нs��,�ЦW,�ڪ���������,�������� FROM sheet,score WHERE score.�ʺ�='"+nickname+"'and ���нs��=�ڪ�����";
    rs2 = stmt2.executeQuery(sql1); 
	rs3 = stmt3.executeQuery(sql1); 
	
	String check1 = "";
	while(rs2.next())
	    check1 = rs2.getString("���нs��");
	
	if(check1.equals(""))
	    out.println("�ȵL����")	;
	else
	{	
%>  
  <table bgcolor=DodgerBlue>
  <tr bgcolor=SkyBlue>
  <td><B>���нs��</B></td><td><B>���ЦW��</B></td><td><B>�ڪ���������</B></td><td><B>���е�������</B></td><td><B>��������</B></td>
  </tr>
<%
       while(rs3.next())
	   {
		   String bid = rs3.getString("���нs��");
		   %>
           <tr bgcolor=LightGoldenrodYellow>
           <td><B><%=bid%></B></td>
           <td><B><a href="sheet.jsp?bid=<%=bid%>"><%=rs3.getString("�ЦW")%></a></B></td>
           <td><B><%=rs3.getString("�ڪ���������")%></B></td>
           <td><B><%=rs3.getString("��������")%></B></td>
           <td><a href="delete2.jsp?bid=<%=bid%>">��������</a></td>
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
      <p><font color="red" size="4">�ڪ��d���G</font></p>
      <p><font color="blue">�оǤ�G</font></p>
<%  
    Statement stmt4 = conDB.createStatement();
	Statement stmt5 = conDB.createStatement();
    ResultSet rs4,rs5;
    String sql2=""; 
    sql2 = "SELECT * FROM message WHERE �ʺ�='"+nickname+"'";
    rs4 = stmt4.executeQuery(sql2); 
	rs5 = stmt5.executeQuery(sql2); 
	
	String check2 = "";
	while(rs4.next())
	    check2 = rs4.getString("�ʺ�");
	
	if(check2.equals(""))
	    out.println("�ȵL�d��")	;
	else
	{	
%>  
  <table bgcolor=DodgerBlue style="word-break:break-all">
  <tr bgcolor=SkyBlue>
  <td><B>�d���ɶ�</B></td><td><B>�d�����e</B></td><td><B>�����d��</B></td>
  </tr>
<%
       while(rs5.next())
	   {
		   String bid = rs5.getString("�d���s��");
		   %>
           <tr bgcolor=LightGoldenrodYellow>
           <td><B><%=rs5.getString("�d���ɶ�")%></B></td>
           <td width="300"><B><%=rs5.getString("�d�����e")%></B></td>
           <td><a href="delete3.jsp?bid=<%=bid%>">�����d��</a></td>
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
    <p><font color="blue">���^�СG</font></p>
<%  
    Statement stmt6 = conDB.createStatement();
	Statement stmt7 = conDB.createStatement();
    ResultSet rs6,rs7;
    String sql3=""; 
    sql3 = "SELECT * FROM message2,sheet WHERE message2.�ʺ�='"+nickname+"'and message2.���нs��=sheet.���нs��";
    rs6 = stmt6.executeQuery(sql3); 
	rs7 = stmt7.executeQuery(sql3); 
	
	String check3 = "";
	while(rs6.next())
	    check3 = rs6.getString("�ʺ�");
	
	if(check3.equals(""))
	    out.println("�ȵL�d��")	;
	else
	{	
%>  
  <table bgcolor=DodgerBlue style="word-break:break-all">
  <tr bgcolor=SkyBlue>
  <td><B>���ЦW��</B></td><td><B>�d���ɶ�</B></td><td><B>�d�����e</B></td><td><B>�����d��</B></td>
  </tr>
<%
       while(rs7.next())
	   {
		   String bid = rs7.getString("�d���s��");
		   String bid1 = rs7.getString("���нs��");
		   %>
           <tr bgcolor=LightGoldenrodYellow>
           <td><B><a href="sheet.jsp?bid=<%=bid1%>"><%=rs7.getString("�ЦW")%></a></B></td>
           <td><B><%=rs7.getString("�d���ɶ�")%></B></td>
           <td width="300"><B><%=rs7.getString("�d�����e")%></B></td>
           <td><a href="delete4.jsp?bid=<%=bid%>">�����d��</a></td>
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