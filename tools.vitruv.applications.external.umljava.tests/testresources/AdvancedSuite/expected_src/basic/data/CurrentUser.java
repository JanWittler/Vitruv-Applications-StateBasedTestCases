package basic.data;

import java.lang.String;


public class CurrentUser {
	private int id;
	public int getId() {
		return this.id;
	}
	private String firstName;
	public String getFirstName() {
		return this.firstName;
	}
	private String lastName;
	public String getLastName() {
		return this.lastName;
	}
	private String email;
	public String getEmail() {
		return this.email;
	}
	private String passwordHash;
	public String getPasswordHash() {
		return this.passwordHash;
	}
	public CurrentUser(int id,String firstName,String lastName,String email,String passwordHash) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.passwordHash = passwordHash;
	}
}



