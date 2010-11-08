/**
* @persistent
*/
component  displayname="Department" hint="I am a model of a department" output="false" persistent="true"{
	property name="deptid" generator="increment" index="true" fieldtype="id" ormtype="int";
	property name="deptname" ormtype="string";
}
