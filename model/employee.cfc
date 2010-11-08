/**
* @persistent
*/
component  displayname="Employee" hint="I am a model of a employee" output="false" persistent="true"{
	property name="employeeid" generator="increment" index="true" fieldtype="id" ormtype="int";
	property name="employeename" ormtype="string";
	property name="deptid" ormtype="int" ;
	property name="managerid" ormtype="int" ;
}
