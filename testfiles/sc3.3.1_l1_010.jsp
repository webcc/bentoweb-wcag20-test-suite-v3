<%@page contentType="text/html"%><%
 boolean error = false;
 String errStr = null;
 if (request.getMethod()=="POST") {
	if (request.getParameter("e1").equals("") && request.getParameter("e2").equals("")) {
		errStr="The <a href='#id1'>password</a> field is required.";
        error=true;
   }
   if (!request.getParameter("e1").equals(request.getParameter("e2"))) {
		errStr="The entered <a href='#id1'>passwords</a> do not match.";
		error=true;
  }
   if (!error) {
	   response.sendRedirect("processformdummy.html");
   }
 }
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Web form - password fields</title>
     <link rel="stylesheet" media="screen,projection" href="resources/css/sc3.3.css" type="text/css" />
  </head>
  <body>
    <h1>Registration</h1>
    <%
       if (error) {
		out.println("<div id='error'>Registration was not successful.<br /><br />The form is redisplayed with incorrect fields identified by: <img src='resources/images/alert_icon.gif' alt='**' />.<br /><br />Please check the following item and try again:<ol><li><strong>"+errStr+"</strong> </li></ol></div>");
       }
    %>
    <p>Fields marked with an asterisk (*) are mandatory.</p>
    <form method="post" action="sc3.3.1_l1_010.jsp">
    <div>
       <div>Thank you for providing your personal data on the previous page.</div><br /><br />
	   <div id="id0"><% if (error)  out.println("<img src='resources/images/alert_icon.gif' alt='**' /><span class='errTxt'>"); %>Please enter your password and confirm it. *<% if (error)  out.println("</span>"); %></div>
	   <label for="id1">Password : </label><input type="password" name="e1" id="id1" value="" /><br />
	   <label for="id2">Confirm password : </label><input type="password" name="e2" id="id2" value="" /><br />
	   <div class="space"><input type="submit" name="subok" value="submit" /><br /></div>
	 </div>
	 </form>
  </body>

<!--
 Copyright &#169; BenToWeb Consortium 2004-2006

 Licensed under the BenToWeb License, Version 1.0 (the "License"); you may
 not use this file except in compliance with the License. You may obtain
 a copy of the License at http://bentoweb.org/refs/LICENSE.html

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->
</html>