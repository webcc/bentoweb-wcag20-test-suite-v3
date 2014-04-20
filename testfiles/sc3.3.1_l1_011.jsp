<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html;charset=utf-8"%><%
 if ((request.getMethod()=="POST") && (!request.getParameter("e1").equals("")) && (!request.getParameter("e1").equals("\u0020"))) {
   response.sendRedirect("processformdummy.html");
 }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Web form - textarea</title>
     <link rel="stylesheet" media="screen,projection" href="resources/css/sc3.3.css" type="text/css" />
  </head>
  <body>
    <h1>Registration</h1>
    <p>Fields marked with an asterisk (*) are mandatory.</p>
    <form method="post" action="sc3.3.1_l1_011.jsp">
       <label class="leftcol" for="first">First name * : </label><input readonly="readonly" type="text" id="first" value="John" /><br />
       <label class="leftcol" for="last">Last name * : </label><input readonly="readonly" type="text" id="last" value="Smith" /><br /><br />
	   <label for="id1">Describe your profession * :</label><br />
	   <textarea id="id1" name="e1" rows="5" cols="30"> </textarea><br />
	   <div class="space"><input type="submit" name="subok" value="submit" /></div>
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
