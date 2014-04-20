<%@page language="java" contentType="text/html"
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Web form - bank transfer</title>
    <link rel="stylesheet" media="screen,projection" href="resources/css/sc3.3.css" type="text/css" />
  </head>
  <body>
    <h1>Bank transfer - Confirmation</h1>
    <p>Your transaction has been processed.</p>
    <div class="show1">
    <h2>Transfer from</h2>
	Account holder: <%= session.getAttribute( "aholder" ) %> <br/>
	Account number: <%= session.getAttribute( "anumber") %> <br/>
	Bank code: <%= session.getAttribute( "bcode") %> <br/>
	<h2>Transfer to</h2>
	Account holder: <%= session.getAttribute( "aholder_to" ) %> <br/>
	Account number: <%= session.getAttribute( "anumber_to") %> <br/>
	Bank code: <%= session.getAttribute( "bcode_to") %> <br/>
	<h2>Amount</h2>
	Transfer amount: <%= session.getAttribute( "tamount") %> <br/>
    </div>
    <p> Thank you.</p>
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
