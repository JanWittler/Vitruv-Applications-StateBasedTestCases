package basic.config;

import basic.config.Method;
import java.lang.String;
import java.util.ArrayList;


public class ProvidedInterface {
	private String name;
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ArrayList<Method>providedMethods;
	public ArrayList<Method>getProvidedMethods() {
		return this.providedMethods;
	}
}



