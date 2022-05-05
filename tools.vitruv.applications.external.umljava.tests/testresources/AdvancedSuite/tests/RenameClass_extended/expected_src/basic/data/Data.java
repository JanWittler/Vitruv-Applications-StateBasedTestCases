package basic.data;

import basic.data.AbstractData;
import basic.data.Metadata;
import java.lang.String;


public class Data extends AbstractData {
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
}



