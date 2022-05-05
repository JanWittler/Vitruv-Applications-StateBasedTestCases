package basic.data;

import java.lang.Integer;
import java.util.ArrayList;

public abstract class AbstractData {
	public ArrayList<Integer> binaryData;
	public ArrayList<Integer> getBinaryData() {
		return this.binaryData;
	}
	public void setBinaryData(ArrayList<Integer> binaryData) {
		this.binaryData = binaryData;
	}
}



