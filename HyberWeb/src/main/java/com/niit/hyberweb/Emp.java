package com.niit.hyberweb;

public class Emp {

	private int id;
	private String name;
	private Address address;//HAS-A RELtionship (component);
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public Emp(String name, Address address) {
		super();
		this.name = name;
		this.address = address;
	}
	public Emp() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
