<cfset isRailo = (server.coldfusion.productname EQ "Railo")? true:false />
<cfmodule template="tags/layout.cfm">
<div id="center">
<p>
	<b>For this demo you'll need to create </b>
	<cfif isRailo>
		a HSQLDB (Hypersonic SQL DB) datasource in the Railo administrtor.<br>
		<a href="/railo-context/admin/server.cfm?action=services.datasource">Click here</a>
	<cfelse>
		an Apache Derby Embedded datasource in the Adobe ColdFusion 9 administrator.<br/>
		<a href="/CFIDE/administrator/index.cfm">Click here</a>
	</cfif>
</p>
<p>
</p>
</div>
</cfmodule>
