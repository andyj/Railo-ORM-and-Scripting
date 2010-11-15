<cfmodule template="../tags/layout.cfm">
	<h2>This example is a small app which allows you to create departments then add managers</h2>
	<p>CFC used are:</p>
	<ol>
		<li><a href="../services/department.cfc">department.cfc [service]</a></li>
		<li><a href="../services/management.cfc">management.cfc [service]</a></li>
		<li><a href="../model/department.cfc">department.cfc [model]</a></li>
		<li><a href="../model/management.cfc">management.cfc [model]</a></li>
	</ol>
	<hr/>
	<cfscript>
		
		// DELETES
		if( structKeyExists( url, "del" ) ){
			switch(url.del){
				case "d": {
					application.departmentObj.delete( deptid=url.deptid );
					location(url='index.cfm', addtoken="false");
					break;
				}
				case "m": {
					application.managerObj.delete( deptid=url.deptid, managerid=url.managerid );
					location(url='index.cfm?deptid=#url.deptid#', addtoken="false");
					break;
				}
			}		
		}	
	
		// INSERTS
		// Department
		if( structKeyExists( form, "departname_name" ) AND len( trim( form.departname_name ) ) ){
			application.departmentObj.create( form.departname_name );
		}
		// Manager
		if( structKeyExists( url, "managername" ) AND structKeyExists( url, "deptid" )){
			application.managerObj.create( url.deptid, url.managername );
		}		
		
		
		// get all departments
		departments = application.departmentObj.listAll();
		
		if( structKeyExists( url, 'deptid' ) ){
			d = application.departmentObj.read( url.deptid );
		}
		
	</cfscript>
	
	<cfoutput>
		<table>
		<tr>
			<th>departments</th>
			<th>managers</th>
		</tr>
		<tr>
			<td>
				<form action="index.cfm" method="post">
					Dept. name: <input type="text" name="departname_name" />
					<input type="submit" name="add_dept" value="Add Dept." />
				</form>		
			</td>
			<td>
				<cfif structKeyExists(url, 'deptid')>
					<form action="index.cfm" method="get">
						Manager name: <input type="text" name="managername" />
						<input type="hidden" name="deptid" value="#url.deptid#" />
						<input type="submit" name="add_manager" value="Add Manager" />
					</form>				
				</cfif>
			</td>
		</tr>
		<tr>
			<td>
				<cfloop array="#departments#" index="record">
					<a href="index.cfm?deptid=#record.getDeptid()#">view</a> | 
					<a href="index.cfm?deptid=#record.getDeptid()#&amp;del=d">delete</a>: #record.getDeptname()#
					<br/>
				</cfloop>
			</td>
			<td>
				<cfif structKeyExists(url, 'deptid')>
					<!--- Get the managers out --->
					<cfset managers = d.getManager() />
					
					<cfif NOT arrayLen( managers )>
						<center>There are no managers</center>
					</cfif>
					
					<cfloop array="#managers#" index="record">
						<a href="index.cfm?deptid=#url.deptid#&managerid=#record.getmanagerid()#">view</a> | 
						<a href="index.cfm?deptid=#url.deptid#&managerid=#record.getmanagerid()#&amp;del=m">delete</a>: #record.getmanagername()#
						<br/>
					</cfloop>	
				</cfif>		
			</td>
		</tr>
		</table>
	</cfoutput>
	
</cfmodule>