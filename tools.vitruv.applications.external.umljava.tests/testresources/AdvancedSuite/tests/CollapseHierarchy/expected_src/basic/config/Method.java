package basic.config;

import java.lang.String;


public class Method {
	public String name;
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int parametersCount;
	public int getParametersCount() {
		return this.parametersCount;
	}
	public void setParametersCount(int parametersCount) {
		this.parametersCount = parametersCount;
	}
	public String toString() {
		return this.name;
	}
}



