/**
* @persistent
*/
component  displayname="Department" hint="I am a service CFC for the department" output="false" {
	
	/**
	* @hint I return an initialised instance.
	* @description I return an initialised Department object instance.
	**/	
	public services.department function init(String dsn){
		variables.dsn = arguments.dsn;
		return this;
	}	
	
	/**
	* @hint I return an array of department objects
	**/	
	public array function listAll(){
		var departmentList = EntityLoad("department");
		return departmentList;
	}		
	
	
	/**
	* @hint I create a new department object and add it to the database
	**/	
	public model.department function create(String deptname){
		var d = new model.department();
		d.setDeptname( arguments.deptname );
		entitySave( d );
		ormflush();	
		return d;
	}	

	/**
	* @hint I read a single department object from the database
	**/		
	public model.department function read(numeric deptid){
		var d = entityLoad('department', arguments.deptid, true);
		return d;
	}	

	/**
	* @hint I delete a single department object from the database
	**/			
	public boolean function delete(numeric deptid){
		department = EntityLoad('department', arguments.deptid, true);
		
		// If the ID doesn't exists the department variable will not be difined
		if( isDefined( 'department' ) ){
			EntityDelete( department );
			ormflush();	
			return true;
		} else{
			return false;
		}
	}	
	
	
}
