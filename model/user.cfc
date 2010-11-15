/**
* @persistent
*/
component  displayname="User" hint="I am a model of a user" output="false" persistent="true"{
	property name="userid" generator="increment" index="true" fieldtype="id" ormtype="int";
	property name="username" ormtype="string";
	property name="password" ormtype="string" ;
}
