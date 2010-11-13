/**
* @persistent
*/
component  displayname="Department" hint="I am a service CFC for the department" output="false" {
	
	
	public services.department function init(String dsn){
		variables.dsn = arguments.dsn;
		return this;
	}	
	
	public array function listAll(){
		var departmentList = EntityLoad("department");
		return departmentList;
	}		
	
	
	// CRUD
	public model.department function create(String deptname){
		var d = new model.department();
		d.setDeptname( arguments.deptname );
		entitySave( d );
		ormflush();	
		return d;
	}	
	
	public void function read(){
	}	
	
	public void function update(){
	}	
	
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
