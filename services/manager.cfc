/**
* @persistent
*/
component  displayname="Manager" hint="I am a service CFC for the manager" output="false" {
	
	
	/**
	* @hint I return an initialised instance.
	* @description I return an initialised Management object instance.
	**/		
	public services.manager function init(String dsn){
		variables.dsn = arguments.dsn;
		return this;
	}	
	
	/**
	* @hint I create a new Management object and add it to the database
	**/	
	public model.manager function create(numeric deptid, String managername){
		var m = new model.manager();
		m.setDeptId( arguments.deptid );
		m.setManagername( arguments.managername );
		entitySave( m );
		ormflush();	
		return m;
	}	
	
	/**
	* @hint I delete a single Management object from the database
	**/		
	public boolean function delete(numeric managerid){
		manager = EntityLoad('manager', arguments.managerid, true);
		
		// If the ID doesn't exists the manager variable will not be difined
		if( isDefined( 'manager' ) ){
			EntityDelete( manager );
			ormflush();	
			return true;
		} else{
			return false;
		}
	}	
	
	
}
