<%@ page import="java.util.*" %><%
 boolean error1 = false;
 boolean error2 = false;
 boolean error3 = false;
 String errStr="";
 if (request.getMethod().equals("POST")) {
	if (request.getParameter("e1").equals("")) {
		errStr = "<li><strong>The <a href='#id1'>Day of birth</a> is required.</strong></li>";
		error1 = true;
    }
	else if (request.getParameter("e2").equals("")) {
		errStr = "<li><strong>The <a href='#id2'>Month of birth</a> is required.</strong></li>";
		error2 = true;
    }
	else if (request.getParameter("e3").equals("")) {
		errStr = "<li><strong>The <a href='#id3'>Year of birth</a> is required.</strong></li>";
		error3 = true;
    } else  {
        String day = request.getParameter("e1");
        String month = request.getParameter("e2");
        String year = request.getParameter("e3");
        try
        {
            Integer.parseInt(day);
        }
        catch (NumberFormatException e)
        {
			errStr = "<li><strong>The <a href='#id1'>day format</a> does not seem to be valid.</strong></li>";
			error1 = true;
        }
        try
        {
            Integer.parseInt(month);
        }
        catch (NumberFormatException e)
        {
			errStr = errStr + "<li><strong>The <a href='#id2'>month format</a> does not seem to be valid.</strong></li>";
			error2 = true;
        }
        try
        {
            Integer.parseInt(year);
        }
        catch (NumberFormatException e)
        {
			errStr = errStr + "<li><strong>The <a href='#id3'>year format</a> does not seem to be valid.</strong></li>";
			error3 = true;
        }
        if (!error1 && !error2 && !error3)
        {
			//
			GregorianCalendar gc = new GregorianCalendar();
			gc.set(Calendar.MONTH,(Integer.valueOf(month).intValue()-1));
			
			if (day.length() < 2) {
				errStr = "<li><strong>The format for <a href='#id1'>day</a> in the field 'Date of birth' does not seem to be valid.</strong><br />It must be of format 'dd' (e.g. 01, 28).</li>";
				error1=true;
			} 
			if ((Integer.valueOf(day).intValue()<1) || (Integer.valueOf(day).intValue()>gc.getActualMaximum(Calendar.DAY_OF_MONTH))) {
				errStr = errStr + "<li><strong>The value for the <a href='#id1'>day</a> in the field 'Date of birth' is out of range.</strong><br />Allowed values are between 01 and 31, depending on the month.</li>";
				error1 = true;
			}
			if (month.length() < 2) {
				errStr = errStr + "<li><strong>The format for <a href='#id3'>month</a> in the field 'Date of birth' does not seem to be valid.</strong><br />It must be of format 'mm' (e.g. 01, 12).</li>";
				error2=true;
			} 
			if ((Integer.valueOf(month).intValue()<1) || (Integer.valueOf(month).intValue()>12)) {
				errStr = errStr + "<li><strong>The value for the <a href='#id2'>month</a> in the field 'Date of birth' is out of range.</strong><br />Allowed values are between 01 and 12.</li>";
				error2 = true;
			} 
			if (year.length() != 4) {
				errStr = errStr + "<li><strong>The format for <a href='#id3'>year</a> in the field 'Date of birth' does not seem to be valid.</strong><br />It must be of format 'yyyy' (e.g. 1977, 2003).</li>";
				error3=true;
			}
		}
    }
    if (!error1 && !error2 && !error3) {
	   response.sendRedirect("processformdummy.html");
    }
}
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Web form - date check</title>
     <link rel="stylesheet" media="screen,projection" href="resources/css/sc3.3.css" type="text/css" />
     <style type="text/css">
.leftcollarge {
  width: 24em;
}
span.fcGroup {
  margin-top: 0.2em
}
span.fcGroup input {
  display: inline;
  float: none;
  margin-top: 0;
}
     </style>
  </head>
  <body>
    <h1>Registration</h1>
    <%
     if (error1 || error2 || error3) {
		out.println("<div id='error'>Registration was not successful.<br /><br />The form is redisplayed with incorrect fields identified by: <img src='resources/images/alert_icon.gif' alt='**' />.<br /><br />Please check the following item(s) and try again:<ol>"+errStr+"</ol></div>");
      }
    %>
    <p>Fields marked with an asterisk (*) are mandatory.</p>
    <form method="post" action="sc3.3.1_l1_038.jsp">
    <div>
       <label class="leftcollarge" for="first">First name * : </label><input readonly="readonly" type="text" id="first" value="John" /><br />
       <label class="leftcollarge" for="last">Last name * : </label><input readonly="readonly" type="text" id="last" value="Smith" /><br />
	   <span class="leftcollarge"><% if (error1 || error2 || error3)  out.println("<img src='resources/images/alert_icon.gif' alt='**' /><span class='errTxt'>"); %>Date of birth (<label for="id1">dd -</label>
	     <label for="id2">mm -</label>
	     <label for="id3">yyyy</label>) * :<% if (error1 || error2 || error3)  out.println("</span>"); %></span>
	   <span class="fcGroup"><input type="text" name="e1" id="id1" size="2" value="<%= (request.getParameter("e1")!=null)?request.getParameter("e1"):"" %>" /> -
	     <input type="text" name="e2" id="id2" size="2" value="<%= (request.getParameter("e2")!=null)?request.getParameter("e2"):"" %>" /> -
	     <input type="text" name="e3" id="id3" size="4" value="<%= (request.getParameter("e3")!=null)?request.getParameter("e3"):"" %>" /></span><br />
	   <div class="space"><input type="submit" name="subok" value="submit" /><br /></div>
	 </div>
	 </form>
  </body>

<!--
 Copyright &#169; BenToWeb Consortium 2004-2007

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
