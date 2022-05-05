package basic.config;

import basic.config.EJB;
import java.lang.String;
import java.util.ArrayList;


public class Config {
	private static int timestamp;
	private static boolean reconfigurable;
	public static ArrayList<EJB>ejbs;
	public static void loadConfig() {
	}
	public static boolean isReconfigurable() {
		return this.reconfigurable;
	}
	public static String getEJBs() {
		return this.ejbs;
	}
}



