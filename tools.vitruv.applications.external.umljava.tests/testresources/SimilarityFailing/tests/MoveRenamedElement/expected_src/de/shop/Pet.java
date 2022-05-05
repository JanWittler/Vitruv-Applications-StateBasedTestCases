package de.shop;

import java.lang.String;
import de.Owner;


public class Pet {
	public String moniker;
	public String getMoniker() {
		return this.moniker;
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



