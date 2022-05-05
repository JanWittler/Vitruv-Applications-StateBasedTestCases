package basic.data;

import basic.data.AbstractData;
import java.lang.String;


public class Data extends AbstractData {
	public String deserialize() {
		return this.metadata;
	}
	public String encoding;
	public String getEncoding() {
		return this.encoding;
	}
}



