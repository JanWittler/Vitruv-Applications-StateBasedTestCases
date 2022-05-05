package root;

import java.util.ArrayList;
import root.Department;
import root.Thesis;
import root.TeachingStaffMember;
import root.Student;


public class ThesisSystem {
	public ArrayList<Department>departments;
	public ArrayList<Department>getDepartments() {
		return this.departments;
	}
	public ArrayList<Thesis>theses;
	public ArrayList<Thesis>getTheses() {
		return this.theses;
	}
	public void setTheses(ArrayList<Thesis>theses) {
		this.theses = theses;
	}
	public ArrayList<TeachingStaffMember>teachingStaff;
	public ArrayList<TeachingStaffMember>getTeachingStaff() {
		return this.teachingStaff;
	}
	public void setTeachingStaff(ArrayList<TeachingStaffMember>teachingStaff) {
		this.teachingStaff = teachingStaff;
	}
	public ArrayList<Student>students;
	public ArrayList<Student>getStudents() {
		return this.students;
	}
	public void setStudents(ArrayList<Student>students) {
		this.students = students;
	}
}



