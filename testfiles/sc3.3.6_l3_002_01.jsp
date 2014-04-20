<?xml version="1.0" encoding="UTF-8"?>
<%@page language="java" contentType="text/html" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
boolean error = false;
String strOut="";
String aholder = request.getParameter("aholder");
String anumber = request.getParameter("anumber");
String bcode = request.getParameter("bcode");

aholder = aholder!=null?aholder:(String)session.getAttribute("aholder");
anumber = anumber!=null?anumber:(String)session.getAttribute("anumber");
bcode = bcode!=null?bcode:(String)session.getAttribute("bcode");
String submitValue = request.getParameter("submit");
boolean toChange = submitValue!=null && !(submitValue.equals("save")||submitValue.equals("continue"));
boolean toSave = submitValue!=null && submitValue.equals("save");
boolean toContinue = submitValue!=null && submitValue.equals("continue");

String submit = "continue";
if(toChange || toSave){
    submit = "save";
}

 if (request.getMethod().equals("POST")) {
	if(submitValue == null || toContinue || toSave){
		if (request.getParameter("aholder").equals("")) {
			strOut+="<li>The <a href=\"#aholder\" onclick=\"goto('aholder'); return false;\">account holder</a> must not be empty.</li>";
			error=true;
		}
		if (request.getParameter("anumber").equals("")) {
			strOut+="<li>The <a href=\"#anumber\" onclick=\"goto('anumber'); return false;\">account number</a> must not be empty.</li>";
			error=true;
		}
		if (isNoNumber(request.getParameter("anumber"))) {
			strOut+="<li>The <a href=\"#anumber\" onclick=\"goto('anumber'); return false;\">account number</a> may not contain letters.</li>";
			error=true;
		}
		if (request.getParameter("bcode").equals("")) {
			strOut+="<li>The <a href=\"#bcode\" onclick=\"goto('bcode'); return false;\">bank code</a> must not be empty.</li>";
			error=true;
		}
		if (isNoNumber(request.getParameter("bcode"))) {
			strOut+="<li>The <a href=\"#bcode\" onclick=\"goto('bcode'); return false;\">bank code</a> may not contain letters.</li>";
			error=true;
		}
	}
    if (!error) {
		session.setAttribute("aholder", request.getParameter("aholder"));
		session.setAttribute("anumber", request.getParameter("anumber"));
		session.setAttribute("bcode", request.getParameter("bcode"));
		if(!toSave){
		    if(!toChange){
				response.sendRedirect("sc3.3.6_l3_002_02.jsp");
		    }
		}else{
		    response.sendRedirect("sc3.3.6_l3_002_04.jsp");
		}
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
%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
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
	<h1>Bank transfer - Step 1</h1>
    <%
       if (error) {
		out.println("<div id='error'><strong>The transaction was not successful. Please check the following item and try again:</strong><ol>"+strOut+"</ol></div>");
       }
    %>
    <p>Please fill in the details regarding the account you want to transfer money <strong>from</strong>.</p>
    <p>Fields marked with an asterisk (*) are mandatory.</p>
    <form method="post" action="sc3.3.6_l3_002_01.jsp">
    <div>
    <label for="aholder" class="leftcolmedium">Account holder *</label><input type="text" name="aholder" id="aholder" value="<%= aholder!=null?aholder:"" %>" /><br />
    <label for="anumber" class="leftcolmedium">Account number *</label><input type="text" name="anumber" id="anumber" value="<%= anumber!=null?anumber:"" %>" /><br />
    <label for="bcode" class="leftcolmedium">Bank Code *</label><input type="text" name="bcode" id="bcode" value="<%= bcode!=null?bcode:"" %>" /><br />
	<br />
	<div class="space"><input type="submit" name="submit" name="submit" value="<%=submit%>" /><br/></div>
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
