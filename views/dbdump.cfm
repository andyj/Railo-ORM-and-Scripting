<cfset dsn = "ormTest">

<cfdbinfo type="tables" datasource="#dsn#" name="dbi">

<cfloop query="dbi">
	<cfif trim( dbi.table_schem ) EQ "PUBLIC">
		<h3><cfoutput>#dbi.TABLE_NAME#</cfoutput></h3>
		<cfdbinfo type="columns" table="#dbi.TABLE_NAME#" datasource="#dsn#" name="dbitbl">
		<cfdump var="#dbitbl#">
	</cfif>
</cfloop>

