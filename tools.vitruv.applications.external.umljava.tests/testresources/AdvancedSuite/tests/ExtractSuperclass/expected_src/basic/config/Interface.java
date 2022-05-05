package basic.config;

import basic.config.Method;
import java.lang.String;
import java.util.ArrayList;


public abstract class Interface {
	private String name;
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ArrayList<Method>methods;
	public ArrayList<Method>getMethods() {
		return this.methods;
	}
}



