<a href="/index.cfm?rebuild=1">Rebuild</a> / 
<a href="views/dbdump.cfm">DB info</a>
<cfscript>
	/*
	  Call ormreload() function so that ORM configuration/mapping is always created afresh
	  when index.cfm is called.  This is convenirent to have in development time.  You shouldn't
	  do this in production
	*/	
	ormreload();


	departments = EntityLoad("department");
	
	dump( departments );
</cfscript>