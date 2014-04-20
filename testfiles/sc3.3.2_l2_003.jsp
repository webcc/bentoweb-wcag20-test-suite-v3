<%@ page import="java.util.*" %><%
boolean error = false;
String strOut="";
int month=0;
int day=0;
int year=0;

if (request.getMethod().equals("POST")) {

    if (request.getParameter("day").equals("")) {
		 strOut+="<li>Field '<a href='#id1'>day</a>' is incomplete.</li>";
		 error = true;
   }
    if (request.getParameter("month").equals("")) {
		strOut+="<li>Field '<a href='#id2'>month</a>' is incomplete.</li>";
		error = true;
	}
    if (request.getParameter("year").equals("")) {
		strOut+="<li>Field '<a href='#id3'>year</a>' is incomplete.</li>";
		error = true;
	}

	if (! request.getParameter("day").equals("")) {
		try {
			day = Integer.parseInt(request.getParameter("day"));
            if ((day<1)||(day>31)) {
                strOut+="<li>The value for '<a href='#id1'>day</a>' must lie between '1' and '31' as a maximum (depending on the year and month).</li>";
                error=true;
            }
       	} catch (NumberFormatException e) {
            strOut+="<li>'<a href='#id1'>day</a>' does not seem to be a number.</li>";
            error=true;
       	}
	}
	if (! request.getParameter("month").equals("")) {
	    try {
    		month = Integer.parseInt(request.getParameter("month"));
            if ((month<1)||(month>12)) {
                strOut+="<li>The value for '<a href='#id2'>month</a>' must lie between '1' and '12'.</li>";
                error=true;
            }
        } catch (NumberFormatException e) {
        	strOut+="<li>'<a href='#id2'>month</a>' does not seem to be a number.</li>";
            error=true;
        }
	}
	if (! request.getParameter("year").equals("")) {
		try {
            year = Integer.parseInt(request.getParameter("year"));
            if ((year<1900)||(year>2099)) {
                strOut+="<li>The value for '<a href='#id3'>year</a>' must lie between '1900' and '2099'.</li>";
                error=true;
            }
       } catch (NumberFormatException e) {
            strOut+="<li>'<a href='#id3'>year</a>' does not seem to be a number.</li>";
            error=true;
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
    <title>Web form - date check</title>
    <link rel="stylesheet" media="screen,projection" href="resources/css/sc3.3.css" type="text/css" />
  </head>
  <body>
    <h1>Registration</h1>
    <%
       if (error) {
		out.println("<div id='error'><strong>Registration was not successful.<br /><br />The form is redisplayed with incorrect fields identified by: <img src='resources/images/alert_icon.gif' alt='**' /><br /><br />Suggestions on how to correct the failures are provided in a help link next to the label of the corresponding form field.<br /><br />Please check the following item and try again:</strong><ol>"+strOut+"</ol></div>");
       }
    %>
    <p>Fields marked with an asterisk (*) are mandatory.</p>
    <form method="post" action="sc3.3.2_l2_003.jsp">
	  <p class="space"><label class="leftcollarge" for="first">First name * : </label><input readonly="readonly" type="text" id="first" value="John" /></p>
	  <p class="space"><label class="leftcollarge" for="last">Last name * : </label><input readonly="readonly" type="text" id="last" value="Smith" /></p>
        <div class="space">
      <% if (error) {  out.println("<img src='resources/images/alert_icon.gif' width='16' height='16' alt='Alert!' /> <span class='errTxt'>Please provide a correct date.</span><br/>"); } %>
          <span class="leftcollarge">Date <label for="id1">(dd/</label><label for="id2">mm/</label><label for="id3">yyyy)</label> * : <% if (error) { out.println("<a href='#hd'>help</a>");} %></span>
        <input type="text" name="day" id="id1" size="1" maxlength="2" value="<%= (request.getMethod()=="POST")?request.getParameter("day"):"" %>" />
        <input type="text" name="month" id="id2" size="1" maxlength="2" value="<%= (request.getMethod()=="POST")?request.getParameter("month"):""%>" />
	    <input type="text" name="year" id="id3" size="2" maxlength="4" value="<%= (request.getMethod()=="POST")?request.getParameter("year"):""%>" />
        </div>

		<div class="space"><input type="submit" value="submit" /><br/></div>
	</form>
	<% if (error) { %>
	<h2><a name="hd" id="hd">Date</a></h2>
	<p>The format required is:</p>
	<ul>
	<li>max. two digits for the day (the value for 'day' must lie between '1' and '31', e.g. '2' or '28')</li>
	<li>max. two digits for the month (the value for 'month' must lie between '1' and '12', e.g. '2' for February or '11' for November)</li>
	<li>four digits for the year (the value for 'year' must lie between '1900' and '2099', e.g. '1999' or '2006').</li>
	</ul>
	<p><a href="#id1">Return to the date field</a></p>
	<% } %>
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
