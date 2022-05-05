package com.example.first;

import java.lang.String;


public class Example {
	private String name;
	public String getName() {
		return this.name;
	}
	public boolean nameEquals(String otherName) {
		return this.name == otherName;
	}
	private int counter;
	public int getCounter() {
		return this.counter;
	}
	public void setCounter(int counter) {
		this.counter = counter;
	}
}



