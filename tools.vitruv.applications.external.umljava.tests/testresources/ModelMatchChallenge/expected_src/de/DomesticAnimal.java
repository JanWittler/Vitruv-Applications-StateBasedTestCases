package de;

import java.lang.String;
import de.Owner;


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
	public Owner owner;
	public Owner getOwner() {
		return this.owner;
	}
	public void setOwner(Owner owner) {
		this.owner = owner;
	}
}



