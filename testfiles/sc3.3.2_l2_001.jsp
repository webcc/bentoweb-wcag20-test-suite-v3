<%@page contentType="text/html"%><%
 if (request.getMethod()=="POST") {
	if (request.getParameter("username").equals("test@test.org") && request.getParameter("password").equals("test")) {
	   response.sendRedirect("processformdummy.html");
	}
 }
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Web form - log-in page</title>
     <link rel="stylesheet" media="screen,projection" href="resources/css/sc3.3.css" type="text/css" />
  </head>
  <body>
	<h1>Log-in</h1>
    <p>
    Please enter your user name and password.
    </p>
    <form method="post" action="sc3.3.2_l2_001.jsp">
    <div>
	<label for="id1">User name: </label><input type="text" name="username" id="id1" value="" /><br />
	<label for="id2">Password: </label><input type="password" name="password" id="id2" value="" /><br />
	 <div class="space"><input type="submit" value="submit" /><br/></div>
	</div>
	</form>
<!-- 	<p><small>*) testaccount - user name: test@test.org, password: test</small></p> -->
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