<cfmodule template="tags/layout.cfm">

	<!--- Simple nav links --->
	<a href="/index.cfm?rebuild=1">Rebuild</a> / <a href="views/dbdump.cfm">DB info</a>
	<cfscript>
		// INSERTS
		if( structKeyExists( form, "departname_name" ) AND len( trim( form.departname_name ) ) ){
			d = EntityNew( 'department' );
			d.setDeptname( form.departname_name );
			EntitySave( d );
			ormflush();
		}
		
		// DELETES
		if( structKeyExists( url, "del" ){
			if( len( trim( url.deptid ) ) ){
				
			}	
		
		}
		
		// get all departments
		departments = EntityLoad("department");
		
		if( structKeyExists( url, 'deptid' ) ) managers = EntityLoad("manager", url.deptid) ; 
		
		//employees = EntityLoad("employee");
		//managers = EntityLoad("manager");
		
	</cfscript>
	<cfoutput>
		<table>
		<tr>
			<th>departments</th>
			<th>managers</th>
			<th>employees</th>
		</tr>
		<tr>
			<td>
				<form action="index.cfm" method="post">
					Dept. name: <input type="text" name="departname_name" />
					<input type="submit" name="dept_add" value="Add Dept." />
				</form>		
			</td>
			<td>
				<form action="index.cfm" method="post">
					Manager name: <input type="text" name="managername" />
					<input type="hidden" name="deptid" value="#url.deptid#" />
					<input type="submit" name="dept_add" value="Add Dept." />
				</form>				
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				<cfloop array="#departments#" index="record">
					<a href="index.cfm?deptid=#record.getDeptid()#">view</a> | 
					<a href="index.cfm?deptid=#record.getDeptid()#&amp;del=1">delete</a>: #record.getDeptname()#
					<br/>
				</cfloop>
			</td>
			<td>
				<cfdump var="#managers#">
			</td>
			<td></td>
		</tr>
		</table>
	</cfoutput>
</cfmodule>