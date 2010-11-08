/**
* @persistent
*/
component  displayname="Manager" hint="I am a model of a manager" output="false" persistent="true"{
	property name="managerid" generator="increment" index="true" fieldtype="id" ormtype="int";
	property name="managername" ormtype="string";
	property name="deptid" ormtype="int" ;
}
