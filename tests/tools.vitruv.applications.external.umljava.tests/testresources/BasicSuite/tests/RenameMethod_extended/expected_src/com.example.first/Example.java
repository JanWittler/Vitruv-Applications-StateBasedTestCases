package com.example.first;

import java.lang.String;


public class Example {
	private String name;
	public String getName() {
		return this.name;
	}
	public boolean hasNameMatching(String otherName) {
		return this.name == otherName;
	}
}



