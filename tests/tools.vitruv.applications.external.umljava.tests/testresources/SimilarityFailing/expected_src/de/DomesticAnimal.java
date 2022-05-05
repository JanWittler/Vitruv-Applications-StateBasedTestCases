package de;

import java.lang.String;
import de.Owner;


public class DomesticAnimal {
	public String nickname;
	public String getNickname() {
		return this.nickname;
	}
	public String species;
	public String getSpecies() {
		return this.species;
	}
	public void setSpecies(String species) {
		this.species = species;
	}
	public Owner owner;
	public Owner getOwner() {
		return this.owner;
	}
	public void setOwner(Owner owner) {
		this.owner = owner;
	}
}



