package basic.config;

import basic.config.Operation;
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
	public ArrayList<Operation> requiredOperations;
	public ArrayList<Operation> getRequiredOperations() {
		return this.requiredOperations;
	}
}



