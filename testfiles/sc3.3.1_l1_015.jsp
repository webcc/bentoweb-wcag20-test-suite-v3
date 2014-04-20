<%@page import="java.util.regex.*" %><%
 boolean error = false;
 String errStr="";
 if (request.getMethod().equals("POST")) {
	if (request.getParameter("e1").equals("")) {
		errStr = "The <a href='#id1'>email address</a> is required.";
		error = true;
   } else  {
	  //Set the email pattern string
	  Pattern p = Pattern.compile(".+@.+\\.[a-z]+");
      //Match the given string with the pattern
      Matcher m = p.matcher(request.getParameter("e1"));
      //check whether match is found 
      boolean matchFound = m.matches();
      if (!matchFound) {
		  errStr = "The <a href='#id1'>email address</a> does not seem to be valid. A valid email address consists of the name of the recipient followed by the @-sign and then followed by a domain address. For example test@test.org is a valid email address.";
		  error = true;
      }
	}
   if (!error) {
	   response.sendRedirect("processformdummy.html");
  }
}
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Web form - email check</title>
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
    <form method="post" action="sc3.3.1_l1_015.jsp">
    <div>
       <label class="leftcol" for="first">First name * : </label><input readonly="readonly" type="text" id="first" value="John" /><br />
       <label class="leftcol" for="last">Last name * : </label><input readonly="readonly" type="text" id="last" value="Smith" /><br />
	   <label class="leftcol" for="id1"><% if (error)  out.println("<img src='resources/images/alert_icon.gif' alt='**' /><span class='errTxt'>"); %>Email * <% if (error)  out.println("</span>"); %>: </label><input type="text" name="e1" id="id1" value="<%= (request.getParameter("e1")!=null)?request.getParameter("e1"):"" %>" /><br />
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
