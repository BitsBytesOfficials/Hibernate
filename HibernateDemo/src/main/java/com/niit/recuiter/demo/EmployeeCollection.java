package com.niit.recuiter.demo;

import java.util.Set;

public class EmployeeCollection {
	private int employeeId;
	private String employeeName;
	private Set<String> phoneNumbers;

	int getEmployeeId() {
		return employeeId;
	}

	void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	String getEmployeeName() {
		return employeeName;
	}

	void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	Set<String> getPhoneNumbers() {
		return phoneNumbers;
	}

	void setPhoneNumbers(Set<String> phoneNumbers) {
		this.phoneNumbers = phoneNumbers;
	}

}
