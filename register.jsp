<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>
<style type="text/css">
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
#register {
	position: absolute;
	width: 300px;
	height: 110px;
	left: 300px;
	top: 220px;
}
</style>
</head>
<body>
<div id="apDiv1">
  <div id="cover"> <a href="index0.jsp" tittle="�¥���W������"><img src="images/0.jpg" width="900" height="175" id="logo" title="�¥���W������"/></a> </div>
  <div id="register">
    <div style="border: 1px solid blue; width: 320px;">
    <center>  
      <form id="form1" name="form1" method="post" action="register_check.jsp">
        <p><font size=5 color="red">�|�����U</font></p><hr>
        <p>�ʺ�:
          <input type="text" name="text_nickname" value=
        <%
	         if(request.getParameter("bk1")!=null)
		         out.println(request.getParameter("bk1"));
	    %>
        >
        </p>
        <p>�b��:
          <input type="text" name="text_ac" value=
        <%
	    	if(request.getParameter("bk2")!=null)
		  	  out.println(request.getParameter("bk2"));
		%>
   		 >
        </p>
        <p>
          �K�X:
          <input type="password" name="text_pw" />
        </p>
        <p>
          �T�{�K�X:
          <input type="password" name="text_re_pw" />
        </p>
        <p>
          E-Mail:
          <input type="text" name="text_email" value=
   	    <%
	        if(request.getParameter("bk5")!=null)
		        out.println(request.getParameter("bk5"));
	    %>
        >
      </p>
        <p>
          <input type="submit" name="button" value="�e�X" />
          <input type="submit" name="button2" value="���]" />
        </p>
      </form>
      <p>
        <%   
   if(request.getParameter("error")!=null)
   {
	   if(request.getParameter("error").equals("1"))
	       out.println("<font color=red>��Ƥ��i���ť�!!</font>");
	   else if(request.getParameter("error").equals("2"))
	       out.println("<font color=red>E-mail�榡���~</font>") ;  
	   else if(request.getParameter("error").equals("3"))
	       out.println("<font color=red>�T�{�K�X���~</font>") ;       
	   else if(request.getParameter("error").equals("4"))
	       out.println("<font color=red>���ʺ٤w�ϥ�</font>") ;
	   else if(request.getParameter("error").equals("5"))
	       out.println("<font color=red>���b���w�ϥ�</font>") ;
	   else if(request.getParameter("error").equals("6"))
	       out.println("<font color=red>��E-MAIL�w�ϥ�</font>") ; 
   }
%>           
      </p>
      <p> <a href="index0.jsp">�^����</a></p>
    </center>
    </div>
  </div>
</div>
</body>
</html>