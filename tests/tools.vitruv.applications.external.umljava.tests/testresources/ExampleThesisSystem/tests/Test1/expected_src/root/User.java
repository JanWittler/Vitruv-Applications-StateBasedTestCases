package root;

import java.lang.String;


public abstract class User {
	public int id;
	public int getId() {
		return this.id;
	}
	public String forename;
	public String getForename() {
		return this.forename;
	}
	public String surname;
	public String getSurname() {
		return this.surname;
	}
	public String emailAddress;
	public String getEmailAddress() {
		return this.emailAddress;
	}
	public String username;
	public String getUsername() {
		return this.username;
	}
	public String password;
	public String getPassword() {
		return this.password;
	}
}



