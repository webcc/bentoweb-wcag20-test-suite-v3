<%@page contentType="text/html"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%! int count = 0; 
  String quote= ""; %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Test Page: Famous Quotes</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" /><meta http-equiv="Pragma" content="no-cache" />
    <style type="text/css">
      q { display: block; }
    </style>
</head>
<body>
<h1>Test Page: Famous Quotes</h1>

<p>Many people have a favourite quote on their website; some even have a complete page dedicated to
favourite quotes. Some people misquote an author, and the erroneous quote starts a life of its own
when other website owners copy it without checking the original source. Mark Twain, Ambrose Bierce and George
Bernard Shaw are well-known for their sharp remarks.</p>
<% count++; %>
<%
switch (count % 10) {
  case 0: {
    quote = "<p>\n" +
      "<q>The world is full of willing people, some willing to work, the rest willing to let them.</q>\n" +
      "(<cite><span class=\"work\">Will and Will Power</span>, Robert Frost</cite>, American poet, 1875-1963).\n" +
    "</p>";
    break;
    }
  case 1: {
    quote = "<p>\n" +
      "<q>It is by the goodness of God that in our country we have those three unspeakably precious things: freedom of speech, freedom of conscience, and the prudence never to practice either of them.</q>\n"+
      "(Mark Twain, 1835-1910)\n" +
    "</p>";
    break;
    }
  case 2: {
    quote = "<p>\n" +
      "<q>Virtue is insufficient temptation.</q>\n" +
      "(George Bernard Shaw)\n" +
    "</p>";
    break;
    }
  case 3: {
    quote = "<p>\n" +
      "<q>Information is not knowledge. Knowledge is not wisdom. Wisdom is not truth. Truth is not beauty. Beauty is not love. Love is not music. Music is the best.</q>\n" +
      "(Frank Zappa)\n" +
    "</p>"; 
    break;
    }
  case 4: {
    quote = "<p>\n" +
      "<q>There are three types of people: those who can count, and those who can't.</q>\n" +
      "(Source unknown - probably wishes to remain anonymous)\n" +
    "</p> ";
    break;
    }
  case 5: {
    quote = " <p>\n" +
      "<q>The proper office of a friend is to side with you when you are in the wrong. Nearly anybody will side with you when you are in the right.</q>\n" +
      "(Mark Twain, 1835-1910)\n" +
    "</p>";
    break;
    }
  case 6: {
    quote = "<p>\n" +
      "<q>PRESENT, <abbr>n.</abbr> That part of eternity dividing the domain of disappointment from the realm of hope.</q>\n" +
      "<cite><span class=\"work\">The Devil's Dictionary</span>, Ambrose Bierce</cite>.\n" +
    "</p>";
    break;
    }
  case 7: {
    quote =  "<p>\n" +
      "<q>In theory, there is no difference between theory and practice. In practice there is.</q>\n" +
      "(Yogi Berra (?))\n" +
    "</p>";
    break;
    }
  case 8: {
    quote = " <p>\n" +
      "<q>When in doubt, tell the truth.</q>\n" +
      "(Mark Twain, 1835-1910)\n" +
    "</p>";
    break;
    }
  case 9: {
    quote = "<p>\n" +
      "<q>The reasonable man adapts himself to the world; the unreasonable one persists in trying to adapt the word to himself. Therefore, all progress depends on the unreasonable man.</q>\n" +
      "(George Bernard Shaw)\n" +
    "</p>";
    break;
  }
}
out.println(quote);
%>
<p><a href="sc2.2.1_l1_002.jsp">Refresh this page</a> (and get a new quote).</p>
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
