component output="false"{
	// application variables
	this.name = "#hash( getCurrentTemplatePath() )#";
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
		return true;
	}	
	
	/**
	 * @hint A request starts
	 */
	public boolean function onRequestStart(String targetPage){
	
		if( structKeyExists(url, "rebuild") ){
			this.ormsettings.dbcreate = "dropcreate";
			include "install/setup.cfm";
		}
	
		return true;
	}	
}
