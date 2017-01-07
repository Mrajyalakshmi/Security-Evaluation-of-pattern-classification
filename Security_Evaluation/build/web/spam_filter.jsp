<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html> 
<html>

<head>
  <title>Security Evaluation</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
    <link rel="shortcut icon" type="x-icon" href="images/ic.png"/>
<!--        <script type="text/javascript">
window.history.forward(1);
function noBack(){
window.history.forward();
}
</script>-->
              <style>
    #id{
        width: 200px;
        height: 25px;
        background-color: #D3F2F7;
    }
    #but{
        width: 70px;
        height: 25px;
    }
    table{
        width: 900px;              
    }
    td{
        text-align: center;
    }
    table,td,tr{
        border-style: solid;
        border-collapse: collapse;
    }
    tr{
        height: 30px;
    }
</style>
<script>
    function val(){
        if(confirm("Are sure you wannna apply spam filter to this file...")){
         
        }
        else{
          return false;  
        }
    }
</script>
</head>

<!--<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">-->
<body>
    <%
if(request.getParameter("yes")!=null){
    out.println("<script>alert('spam filter applied...')</script>");
}    
%>
  <div id="main">
    <header>
	  <div id="banner">
	    <div id="welcome">
	      <h3>Security <span>Evaluation</span></h3>
	    </div><!--close welcome-->
	    
	  </div><!--close banner-->
    </header>

	<nav>
	  <div id="menubar">
        <ul id="nav">
         
            <li><a href="files.jsp">Upload</a></li>
            <li ><a href="download.jsp">Download</a></li>
          <li class="current"><a href="spam_filter.jsp">Spam Filter</a></li>
          <li><a href="user_page.jsp">Home</a></li>
<!--          <li><a href="projects.html">Projects</a></li>
          <li><a href="contact.html">Contact Us</a></li>-->
        </ul>
      </div><!--close menubar-->	
    </nav>	
    
	<div id="site_content">	

<!--      <div class="slideshow">
	    <ul class="slideshow">
          <li class="show"><img width="900" height="250" src="images/b1.png" alt="&quot;face detection&quot;"/></li>
          <li><img width="900" height="250" src="images/b2.png" alt="&quot;face detection&quot;" /></li>
          <li><img width="900" height="250" src="images/home_1.jpg" alt="&quot;Enter your caption here&quot;" /></li>
        </ul> 
	  </div>	-->
	
	  <div id="content">
        <div class="content_item">
            <%
HttpSession user=request.getSession();
String name=user.getAttribute("name").toString();  
String uname=user.getAttribute("username").toString(); 

Connection con=Dbconnection.getConn();
Statement st=con.createStatement();
ResultSet rt=st.executeQuery("select * from files where owner_='"+uname+"'");       
%>
<!--		  <h1>Welcome ! <%=name%></h1> -->

                      <table>
                          <caption> <h1> Files</h1> </caption>
                          <tr style="background-color: #ccffff;color: #7380A0">
                              <td>File Name</td><td>Time</td><td>Owner</td><td>Is Spam applied</td><td>Action</td>
                          </tr>
               <%
while(rt.next()){   
        String id=rt.getString("id");
   
              %>
              <tr>
                  <td><%=rt.getString("file_name")%></td>
                  <td><%=rt.getString("time_")%></td>
                  <td><%=rt.getString("owner_")%></td>
                  <td><%=rt.getString("applied_spam")%></td>
                  <td><a href="spam.jsp?<%=id%>" onclick="return val();">Apply Spam Filter</a></td>
<!--                  <td><a href="spam_filter?12" onclick="return val()">Apply Spam Filter</a></td>-->
              </tr>
              <%
}              
%>
                      </table>
                
             

		  
        </div><!--close content_item-->
      </div><!--close content-->   
	</div><!--close site_content-->  	
  </div><!--close main-->
  
<!--    <footer>
	  <a href="index.html">Home</a> | <a href="ourwork.html">Our Work</a> | <a href="testimonials.html">Testimonials</a> | <a href="projects.html">Projects</a> | <a href="contact.html">Contact</a><br/><br/>
	  website template by <a href="http://www.freehtml5templates.co.uk">Free HTML5 Templates</a>
    </footer>-->

  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>
