<cfsetting showdebugoutput="false">
<cfprocessingdirective pageencoding="utf-8">
<cfif thisTag.executionMode is "start">
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>960 Grid System</title>
	<style>
		*{ margin:0; outline:0; padding:0}
		body{ font:13px/1.5'Helvetica Neue',Arial,'Liberation Sans',FreeSans,sans-serif; margin: 0 50px;}
		a:focus{ outline:1px dotted}
		input{ border:1px solid silver; font-size:10px; padding:2px;}
		table{border-collapse: collapse;}
		th{letter-spacing:2px;padding:0 0 20px 0;width:300px;}
		td{padding:0 0 20px 0;}
		td>form{text-align:center;}
	</style>
</head>
<body>
	<h1>Scripting and ORM examples</h1>
	<hr>
	<!--- Simple nav links --->
	<a href="/index.cfm">Home</a> /
	<a href="/index.cfm?rebuild=1">Rebuild</a> /
	<a href="views/dbdump.cfm">DB info</a>
	<hr>
	<div id="container">
<cfelse>
	</div><!-- end container -->
</body>
</html>
</cfif>