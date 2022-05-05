package basic.data;

import basic.data.AbstractData;
import basic.data.Metadata;


public class Data extends AbstractData {
	public Metadata metadata;
	public Metadata getMetadata() {
		return this.metadata;
	}
	public void setMetadata(Metadata metadata) {
		this.metadata = metadata;
	}
	public static boolean deserializeData(Data data) {
		return this.metadata;
	}
}



