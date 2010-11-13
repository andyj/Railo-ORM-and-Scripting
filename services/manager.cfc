/**
* @persistent
*/
component  displayname="Manager" hint="I am a service CFC for the manager" output="false" {
	
	
	public services.manager function init(String dsn){
		variables.dsn = arguments.dsn;
		return this;
	}	
	
	public array function listAll(numeric deptid){
		var managerList = EntityLoad( "manager", arguments.deptid );
		return managerList;
	}		
	
	
	// CRUD
	public model.manager function create(numeric deptid, String managername){
		var m = new model.manager();
		m.setDeptId( arguments.deptid );
		m.setManagername( arguments.managername );
		entitySave( m );
		ormflush();	
		return m;
	}	
	
	public void function read(){
	}	
	
	public void function update(){
	}	
	
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
