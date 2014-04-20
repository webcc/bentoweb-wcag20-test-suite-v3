<%@ page import="java.text.DateFormat, java.text.SimpleDateFormat, java.text.ParseException, java.text.Format, java.util.*" %><%
 boolean error = false;
 String errStr="";
 if (request.getMethod().equals("POST")) {
	if (request.getParameter("e1").equals("")) {
		errStr = "<li><strong>The <a href='#id1'>Date of birth</a> is required.</strong></li>";
		error = true;
     } else  {
        String strDate = request.getParameter("e1");
		strDate = strDate.replace(" ", "");
		// check format
		try{
			DateFormat formatter =	new SimpleDateFormat("dd/MM/yyyy");
			Date date = formatter.parse(strDate);
	        // check range
			int start=0;
			int stop= strDate.indexOf('/');
	        String day = strDate.substring(start, stop);
			start=stop+1;
			stop = strDate.indexOf('/', start);
			String month = strDate.substring(start, stop);
			start=stop+1;
			String year = strDate.substring(start);
			//
			GregorianCalendar gc = new GregorianCalendar();
			gc.set(Calendar.MONTH,(Integer.valueOf(month).intValue()-1));
			
			if (day.length() < 2) {
				errStr = "<li><strong>The format for <a href='#id1'>day</a> in the field 'Date of birth' does not seem to be valid.</strong><br />It must be of format 'dd' (e.g. 01, 28).</li>";
				error=true;
			} 
			if ((Integer.valueOf(day).intValue()<1) || (Integer.valueOf(day).intValue()>gc.getActualMaximum(Calendar.DAY_OF_MONTH))) {
				errStr = errStr + "<li><strong>The value for the <a href='#id1'>day</a> in the field 'Date of birth' is out of range.</strong><br />Allowed values are between 01 and 31, depending on the month.</li>";
				error = true;
			}
			if (month.length() < 2) {
				errStr = errStr + "<li><strong>The format for <a href='#id1'>month</a> in the field 'Date of birth' does not seem to be valid.</strong><br />It must be of format 'mm' (e.g. 01, 12).</li>";
				error=true;
			} 
			if ((Integer.valueOf(month).intValue()<1) || (Integer.valueOf(month).intValue()>12)) {
				errStr = errStr + "<li><strong>The value for the <a href='#id1'>month</a> in the field 'Date of birth' is out of range.</strong><br />Allowed values are between 01 and 12.</li>";
				error = true;
			} 
//			if (year.length() < 4) {
			if (year.length() != 4) {
				errStr = errStr + "<li><strong>The format for <a href='#id1'>year</a> in the field 'Date of birth' does not seem to be valid.</strong><br />It must be of format 'yyyy' (e.g. 1977, 2003).</li>";
				error=true;
			}
			/*
			if ((Integer.valueOf(year).intValue()<1850) || (Integer.valueOf(year).intValue()>2006)) {
				errStr = errStr + "<li><strong>The value for the <a href='#id1'>year</a> in the field 'Date of birth' is out of range.</strong><br />Allowed values are between 1850 and 2006.</li>";
				error = true;
			}
			*/
		}
		catch(ParseException e)
		{
			errStr = "<li><strong>The <a href='#id1'>date format</a> does not seem to be valid.</strong></li>";
			error = true;
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
		out.println("<div id='error'>Registration was not successful.<br /><br />The form is redisplayed with incorrect fields identified by: <img src='resources/images/alert_icon.gif' alt='**' />.<br /><br />Please check the following item(s) and try again:<ol>"+errStr+"</ol></div>");
      }
    %>
    <p>Fields marked with an asterisk (*) are mandatory.</p>
    <form method="post" action="sc3.3.1_l1_016.jsp">
    <div>
       <label class="leftcollarge" for="first">First name * : </label><input readonly="readonly" type="text" id="first" value="John" /><br />
       <label class="leftcollarge" for="last">Last name * : </label><input readonly="readonly" type="text" id="last" value="Smith" /><br />
	   <label class="leftcollarge" for="id1"><% if (error)  out.println("<img src='resources/images/alert_icon.gif' alt='**' /><span class='errTxt'>"); %>Date of birth (dd/mm/yyyy) * :<% if (error)  out.println("</span>"); %></label>
	   <input type="text" name="e1" id="id1" value="<%= (request.getParameter("e1")!=null)?request.getParameter("e1"):"" %>" /><br />
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
