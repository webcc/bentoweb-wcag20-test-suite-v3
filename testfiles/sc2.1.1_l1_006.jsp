<%@page contentType="text/html"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String thepage = null;
int x=0;
int y=0;
if(request.getParameter("themap.x")!=null && request.getParameter("themap.y")!=null)
{
	x = Integer.parseInt(request.getParameter("themap.x"));
	y = Integer.parseInt(request.getParameter("themap.y"));
	if(x<100)
		thepage ="Home";
	else if(x>100 && x<200)
		thepage="News";
	else
		thepage="Services";
}
else
	thepage ="Home";
%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Test Page: Server side map</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <meta http-equiv="Pragma" content="no-cache" />
</head>
<body>
    <form name="ss" id="sss" method="get" action="">
        <input type="image" name="themap" style="border:none;" src="resources/images/sc2.1.1_l1_005.gif" alt="navigation map (Text links follow)" />
	</form>
    <div title="alternative navigation">
        [<a href="?themap.x=1&themap.y=1">Home</a>]
        [<a href="?themap.x=101&themap.y=1">News</a>]
        [<a href="?themap.x=201&themap.y=1">Services</a>]	
	</div>
<h1><%= thepage %> Page</h1>

<p>This is the content of <%= thepage %> page</p>

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
