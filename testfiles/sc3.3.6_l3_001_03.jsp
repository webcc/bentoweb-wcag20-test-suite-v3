<%@page language="java" contentType="text/html"
%><%
boolean error = false;
String strOut="";
 if (request.getMethod().equals("POST")) {

	if (request.getParameter("tamount").equals("")) {
		strOut+="<li>The <a href=\"#tamount\" onclick=\"goto('tamount'); return false;\">transfer amount</a> must not be empty.</li>";
		error=true;
	}
	if (isNoNumber(request.getParameter("tamount"))) {
		strOut+="<li>The <a href=\"#tamount\" onclick=\"goto('tamount'); return false;\">transfer amount</a> may not contain letters.</li>";
		error=true;
	}
    if (!error) {
		session.setAttribute( "tamount", request.getParameter("tamount"));
		response.sendRedirect("sc3.3.6_l3_001_04.jsp");
	}
}
%><%! 
boolean isNoNumber(String number) {
	int l = number.length();
	int i = 0;
	boolean err = false;
	for (i=0; i<l; i++) {
		if (Character.isLetter(number.charAt(i))) {
			err=true;
		}
	}
	return err;
}
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Web form - bank transfer</title>
    <link rel="stylesheet" media="screen,projection" href="resources/css/sc3.3.css" type="text/css" />
    <script type="text/javascript">
      <!--
        function goto(id) {
          document.getElementById(id).focus();
        }
      //-->
    </script> 
  </head>
  <body>
	<h1>Bank transfer - Step 3</h1>
    <%
       if (error) {
		out.println("<div id='error'><strong>The transaction was not successful. Please check the following item and try again:</strong><ol>"+strOut+"</ol></div>");
       }
    %>
    <p>Please fill in the amount of money you want to transfer.</p>
    <p>Fields marked with an asterisk (*) are mandatory.</p>
    <form method="post" action="sc3.3.6_l3_001_03.jsp">
    <div>
    <label for="id1" class="leftcollarge">Transfer amount (in Euro) *</label><input type="text" name="tamount" id="tamount" value="<%= (request.getMethod().equals("POST"))?request.getParameter("tamount"):"" %>" /><br />
	<br />
	<div class="space"><input type="submit" value="submit" /><br/></div>
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
