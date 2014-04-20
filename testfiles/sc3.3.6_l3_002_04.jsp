<%@page language="java" contentType="text/html"
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Web form - bank transfer</title>
    <link rel="stylesheet" media="screen,projection" href="resources/css/sc3.3.css" type="text/css" />
  </head>
  <%String action = request.getParameter("submit"); %>
  <body>
  
    <h1>Bank transfer - Confirmation</h1>
    <div>
    <form method="post" action="sc3.3.6_l3_002_01.jsp">
    <div>
    <h2>Transfer from</h2>
	Account holder: <%= session.getAttribute( "aholder" ) %> <br/>
	Account number: <%= session.getAttribute( "anumber") %> <br/>
	Bank code: <%= session.getAttribute( "bcode") %> <br/>
	<%if( action == null || !action.equals("submit")){%>
	<div class="space"><input type="submit" name="submit" value="change transfer from" /></div><br/>
	<%} %>
	</div>
	
	</form>
	<form method="post" action="sc3.3.6_l3_002_02.jsp">
	<div>
	<h2>Transfer to</h2>
	Account holder: <%= session.getAttribute( "aholder_to" ) %> <br/>
	Account number: <%= session.getAttribute( "anumber_to") %> <br/>
	Bank code: <%= session.getAttribute( "bcode_to") %> <br/>
	<%if( action == null || !action.equals("submit")){%>
	<div class="space"><input type="submit" name="submit" value="change transfer to" /></div><br/>
	<%} %>
	</div>
	
	</form>
	<form method="post" action="sc3.3.6_l3_002_03.jsp">
	<div>
	<h2>Amount</h2>
	Transfer amount: <%= session.getAttribute( "tamount") %> <br/>
	<%if( action == null || !action.equals("submit")){%>
	<div class="space"><input type="submit" name="submit" value="change amount" /></div><br/>
	<%} %>
	</div></form>
    <form method="post" action="sc3.3.6_l3_002_04.jsp">
	<div>
    
    <% 
       if(action == null){
    %>
	<div class="space"><input type="submit" name="submit" value="submit" /><br/></div>
	
	<%
       }else if(action.equals("submit")){
	%>
    <p> Transaction successfully executed. Thank you.</p>
    <%
       }else{
        %>
       	<div class="space"><input type="submit" name="submit" value="submit" /><br/></div>
       	<%
       }
    %>
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
