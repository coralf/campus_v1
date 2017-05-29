package com.campus.entity;

public class AdminInfo {
	
	private Integer id;	//INT PRIMARY KEY IDENTITY,
	private String name;//VARCHAR(10) NOT NULL UNIQUE,
	private String pwd ;//VARCHAR(16) NOT NULL,
	
	public AdminInfo() {
		// TODO Auto-generated constructor stub
	}

	public AdminInfo(Integer id, String name, String pwd) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	
	

}
