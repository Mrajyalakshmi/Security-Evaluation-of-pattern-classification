<%-- 
    Document   : disp_image
    Created on : Dec 9, 2014, 2:58:52 PM
    Author     : IBN33
--%>

<%@page import="pack.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
    pageEncoding="ISO-8859-1"%>  
<%@ page import="java.sql.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>
<html>
    <body>
<% 
Blob image = null;
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String type=null;

try {
    HttpSession user=request.getSession();
String uname=user.getAttribute("username").toString();
    
 con= Dbconnection.getConn();
stmt = con.createStatement();
rs = stmt.executeQuery("select image_ from user_reg where username='"+uname+"' ");

int found=0;
InputStream in;
byte[] bytearray = new byte[1048576];


if(rs!=null)
    {
    int size=0;
 while (rs.next()) {
found=1;
in=rs.getBinaryStream(1);
response.reset();
response.setContentType("image/jpg");
while((size=in.read(bytearray))!= -1 ){
response.getOutputStream().write(bytearray,0,size);
response.getOutputStream().flush();
 response.getOutputStream().close();
}
}
 }

if(found==0)
out.println("image not found for given image");


 

} catch (Exception e) {

out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());
return;

} finally {

try {

rs.close();
stmt.close();
con.close();
} catch (SQLException e) {
    
e.printStackTrace();

}

}

%>
    </body>
</html>