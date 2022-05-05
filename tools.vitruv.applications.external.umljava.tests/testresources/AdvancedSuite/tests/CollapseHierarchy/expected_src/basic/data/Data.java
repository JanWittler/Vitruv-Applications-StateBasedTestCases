package basic.data;

import basic.data.Metadata;
import java.lang.Integer;
import java.lang.String;
import java.util.ArrayList;

public class Data {
	public Metadata metadata;
	public Metadata getMetadata() {
		return this.metadata;
	}
	public void setMetadata(Metadata metadata) {
		this.metadata = metadata;
	}
	public String deserialize() {
		return this.metadata;
	}
	public ArrayList<Integer> binaryData;
	public ArrayList<Integer> getBinaryData() {
		return this.binaryData;
	}
	public void setBinaryData(ArrayList<Integer> binaryData) {
		this.binaryData = binaryData;
	}
}



