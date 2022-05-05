package basic.config;

import basic.config.Method;
import java.lang.String;
import java.util.ArrayList;


public class RequiredInterface {
	private String name;
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ArrayList<Method>requiredMethods;
	public ArrayList<Method>getRequiredMethods() {
		return this.requiredMethods;
	}
}



