package basic.config;

import basic.config.ProvidedInterface;
import basic.config.RequiredInterface;
import java.lang.String;
import java.util.ArrayList;


public class EJB {
	private String name;
	public String getName() {
		return this.name;
	}
	private String host;
	public String getHost() {
		return this.host;
	}
	private String port;
	public String getPort() {
		return this.port;
	}
	private String appName;
	public String getAppName() {
		return this.appName;
	}
	private String moduleName;
	public String getModuleName() {
		return this.moduleName;
	}
	private String beanName;
	public String getBeanName() {
		return this.beanName;
	}
	public ArrayList<RequiredInterface>requiredInterfaces;
	public ArrayList<RequiredInterface>getRequiredInterfaces() {
		return this.requiredInterfaces;
	}
	public ArrayList<ProvidedInterface>providedInterfaces;
	public ArrayList<ProvidedInterface>getProvidedInterfaces() {
		return this.providedInterfaces;
	}
	void printProvidedInterfaces() {
		printProvidedInterfaces();
	}
	void printRequiredInterfaces() {
		printRequiredInterfaces();
	}
}



