package com.students.model;

public class Students {
	private String username;
	private String password;
	private String name;

	public Students() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Students(String username, String password, String name) {
		super();
		this.username = username;
		this.password = password;
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Students [username=" + username + ", password=" + password + ", name=" + name + "]";
	}

}
