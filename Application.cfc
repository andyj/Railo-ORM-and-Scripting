component output="false"{
	// application variables
	this.name = "#hash( getCurrentTemplatePath() )#v0008";
	this.sessionmanagement = true;
	this.clientmanagement = true;
	this.scriptProtect = false; 
	this.welcomefilelist = "views/index.cfm";
	this.isDevelopment = true;
	
	
	// orm settings
	this.datasource = "ormTest";
	this.ormEnabled = true;
	this.ormsettings.dbcreate = "dropcreate";
	this.ormsettings.logSQL = true;
	this.ormsettings.cflocation = "models";
	
	
	/**
	 * @hint The application first starts
	 */
	public boolean function onApplicationStart(){
		application.departmentObj = createObject('services.department').init( this.datasource );
		application.managerObj = createObject('services.manager').init( this.datasource );
		return true;
	}	
	
	/**
	 * @hint A request starts
	 */
	public boolean function onRequestStart(String targetPage){
		
		// Remove when finished initial development
		onApplicationStart();
		
		
		if( structKeyExists(url, "rebuild") ){
			onApplicationStart();
			this.ormsettings.dbcreate = "dropcreate";
			ormflush();	
			//application.departmentObj.create("Human resources");
		}
	
		//writeDump(var=application.departmentObj, abort=1);
	
		return true;
	}	
}
