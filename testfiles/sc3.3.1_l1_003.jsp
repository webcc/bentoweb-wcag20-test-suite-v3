<%@page contentType="text/html"%><%
 if ((request.getMethod()=="POST") && (request.getParameter("e1")!=null)) {
   response.sendRedirect("processformdummy.html");
 }
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Web form - radio buttons</title>
     <link rel="stylesheet" media="screen,projection" href="resources/css/sc3.3.css" type="text/css" />
  </head>
  <body>
    <h1>Registration</h1>
    <p>Fields marked with an asterisk (*) are mandatory.</p>
    <form method="post" action="sc3.3.1_l1_003.jsp">
    <div>
       <label class="leftcol" for="first">First name * : </label><input readonly="readonly" type="text" id="first" value="John" /><br />
       <label class="leftcol" for="last">Last name * : </label><input readonly="readonly" type="text" id="last" value="Smith" /><br /><br />
 	   <div class="leftcol">Gender * :</div><input type="radio" name="e1" id="id1" value="1" /><label class="midcol" for="id1">male</label> 
	                             <input type="radio" name="e1" id="id2" value="2" /><label class="midcol" for="id2">female</label><br />
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
