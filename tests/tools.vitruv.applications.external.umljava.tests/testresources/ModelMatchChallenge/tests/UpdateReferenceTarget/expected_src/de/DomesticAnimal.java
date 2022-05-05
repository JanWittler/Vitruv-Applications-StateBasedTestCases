package de;

import java.lang.String;
import de.Person;


public class DomesticAnimal {
	public String nickname;
	public String getNickname() {
		return this.nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String species;
	public String getSpecies() {
		return this.species;
	}
	public Person owner;
	public Person getOwner() {
		return this.owner;
	}
	public void setOwner(Person owner) {
		this.owner = owner;
	}
}



