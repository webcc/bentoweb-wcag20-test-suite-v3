<?xml version="1.0" encoding="UTF-8"?>
<%@page language="java" contentType="text/html" session="true" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
List books = (List)session.getAttribute("books");
books = books!=null?books:new ArrayList<String>();
if(request.getMethod().equals("POST")){
    String[] restoredBooks = request.getParameterValues("books");
    if(restoredBooks != null){
        for(int i = 0;i < restoredBooks.length; i++){
            books.remove(restoredBooks[i]);
        }
        response.sendRedirect("sc3.3.3_l2_003_01.jsp");
    }
}

%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Web form - removed books</title>
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
	<h1>Shopping Cart History</h1>
    <form method="post" action="sc3.3.3_l2_003_02.jsp">
    <div>
    <% 
    if(books.size() > 0){
   	%><h2>Removed Books:</h2>
   	<p>Removed books older than 2 weeks will be automatically deleted.</p>
   	<%
   		for(int i = 0; i < books.size(); i++){
   		    %>
   		   	<div class="show1"><label for="books_<%=i%>" class="leftcolnormal"><%= books.get(i)%></label><input type="checkbox" name="books" id="books_<%=i%>" value="<%= books.get(i)%>" /><br /></div>
   		    <%
   		}
   	%>
   	<br />
	<div class="space"><input type="submit" value="Restore" /><br/></div>
   	<%
    }else{
        %>
        <p>No removed books.</p>
        <%
    }
    %>
	
	<div class="space"><a href="sc3.3.3_l2_003_01.jsp">To shopping cart.</a><br/></div>
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
