<%@page language="java" contentType="text/html"
%><%
boolean error = false;
String strOut="";
 if (request.getMethod().equals("POST")) {

	if (request.getParameter("aholder_to").equals("")) {
		strOut+="<li>The <a href=\"#aholder_to\" onclick=\"goto('aholder_to'); return false;\">account holder</a> must not be empty.</li>";
		error=true;
	}
	if (request.getParameter("anumber_to").equals("")) {
		strOut+="<li>The <a href=\"#anumber_to\" onclick=\"goto('anumber_to'); return false;\">account number</a> must not be empty.</li>";
		error=true;
	}
	if (isNoNumber(request.getParameter("anumber_to"))) {
		strOut+="<li>The <a href=\"#anumber_to\" onclick=\"goto('anumber_to'); return false;\">account number</a> may not contain letters.</li>";
		error=true;
	}
	if (request.getParameter("bcode_to").equals("")) {
		strOut+="<li>The <a href=\"#bcode_to\" onclick=\"goto('bcode_to'); return false;\">bank code</a> must not be empty.</li>";
		error=true;
	}
	if (isNoNumber(request.getParameter("bcode_to"))) {
		strOut+="<li>The <a href=\"#bcode_to\" onclick=\"goto('bcode_to'); return false;\">bank code</a> may not contain letters.</li>";
		error=true;
	}
    if (!error) {
		session.setAttribute( "aholder_to", request.getParameter("aholder_to"));
		session.setAttribute( "anumber_to", request.getParameter("anumber_to"));
		session.setAttribute( "bcode_to", request.getParameter("bcode_to"));
		response.sendRedirect("sc3.3.6_l3_001_03.jsp");
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
	<h1>Bank transfer - Step 2</h1>
    <%
       if (error) {
		out.println("<div id='error'><strong>The transaction was not successful. Please check the following item and try again:</strong><ol>"+strOut+"</ol></div>");
       }
    %>
    <p>Please fill in the details regarding the account you want to transfer money <strong>to</strong>.</p>
    <p>Fields marked with an asterisk (*) are mandatory.</p>
    <form method="post" action="sc3.3.6_l3_001_02.jsp">
    <div>
    <label for="id1" class="leftcolmedium">Account holder *</label><input type="text" name="aholder_to" id="aholder_to" value="<%= (request.getMethod().equals("POST"))?request.getParameter("aholder_to"):"" %>" /><br />
    <label for="id1" class="leftcolmedium">Account number *</label><input type="text" name="anumber_to" id="anumber_to" value="<%= (request.getMethod().equals("POST"))?request.getParameter("anumber_to"):"" %>" /><br />
    <label for="id1" class="leftcolmedium">Bank Code *</label><input type="text" name="bcode_to" id="bcode_to" value="<%= (request.getMethod().equals("POST"))?request.getParameter("bcode_to"):"" %>" /><br />
	<br />
	<div class="space"><input type="submit" value="continue" /><br/></div>
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
