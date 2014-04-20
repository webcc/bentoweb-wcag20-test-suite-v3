<%@page contentType="text/html"%><%
 boolean error = false;
 if (request.getMethod().equals("POST")) {
  if (!request.getParameter("e1").equals("")) {
    response.sendRedirect("processformdummy.html");
  }  else {
    error=true;
  }
 }
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Web form - text input field</title>
     <link rel="stylesheet" media="screen,projection" href="resources/css/sc3.3.css" type="text/css" />
  </head>
  <body>
    <h1>Registration</h1>
    <%
       if (error) {
		out.println("<div id='error'>Registration was not successful.<br /><br />The form is redisplayed with incorrect fields identified by: <img src='resources/images/alert_icon.gif' alt='**' />.<br /><br />Please check the following item and try again:<ol><li><strong>The <a href='#id1'>Customer Code</a> field is required.</strong> </li></ol></div>");
       }
    %>
    <p>Fields marked with an asterisk (*) are mandatory.</p>
    <form method="post" action="sc3.3.1_l1_002.jsp">
    <div>
       <label class="leftcollarge" for="first">First name * : </label><input readonly="readonly" type="text" id="first" value="John" /><br />
       <label class="leftcollarge" for="last">Last name * : </label><input readonly="readonly" type="text" id="last" value="Smith" /><br />
	   <label class="leftcollarge" for="id1">
	   <% if (error)  out.println("<img src='resources/images/alert_icon.gif' alt='**' /><span class='errTxt'>"); %>
	   Customer Code *
	   <% if (error)  out.println("</span>"); %>
	   : </label><input type="text" name="e1" id="id1" value="" /><br />
	   <div class="space"><input type="submit" name="subok" value="submit" /><br /></div>
	 </div>
	 </form>
  </body>

<!--
 Copyright &#169; BenToWeb Consortium 2004-2007

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
