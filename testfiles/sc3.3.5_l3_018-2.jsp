<?xml version="1.0" encoding="UTF-8"?><%@ page language="java" contentType="text/html; charset=utf-8" %><%@
  page import="java.io.File" %><%@
  page import="java.util.*" %><%
String[] contexts = new String[] {"To whom it may concern, This is to inform you that the bank detales of Steven Cloud adressee of my monthly bank transfer of EUR 480.00 have changed.", "To whom it may concern, This is to inform you that the bank details of Steven Cloud adressee of my monthly bank transfer of EUR 480.00 have changed.", "I would appreshiate it, if you could change my bank transfer accordingly from next month."};
String[] words = new String[] {"detales", "adressee", "appreshiate"};
String[] replacements = new String[] {"details", "addressee", "appreciate"};
int count = Integer.parseInt(request.getParameter("count"));
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/dtd/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
  <head>
    <title>Send a message (2): Spell check (BenToWeb Testfile)</title>
    <style type="text/css">
    </style>
  </head>
  <body>
    <form action="<% if (count > 1) { %>sc3.3.5_l3_018-3.html<% } else { %>sc3.3.5_l3_018-2.jsp<% } %>" method="post">
      <div>Unknown word: <%= words[count] %></div>
      <p>Context: <%= contexts[count].replaceAll(words[count], "<strong>" + words[count] + "</strong>") %></p>
      <div><label for="word">Replace with</label> <input type="text" id="word" name="word" value="<%= replacements[count] %>" /> <input type="submit" name="replace" value="Replace" /> <!--input type="submit" name="ignore" value="Ignore" /--><input type="hidden" name="count" value="<%= count + 1 %>" /></div>
    </form>
  </body>
</html>