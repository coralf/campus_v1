package com.campus.entity;

import java.util.Calendar;
import java.util.Date;

public class UserInfo {
	
	
	private Integer id;
	private String username ;
	private String pwd;
	private String email;
	private String phone;
	private Integer age;
	private String userIcon;
	private String userDes;	
	private String registerDate;
	private Integer score;
	private Integer experience;
	private Integer state;	
	private String validateCode;
	private Date regDate;
	private String sex; 
	
	public String getSex() {
		return sex;
	}
	
	
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public Integer getAge() {
		return age;
	}
	
	
	public void setAge(Integer age) {
		this.age = age;
	}
	
	
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getValidateCode() {
		return validateCode;
	}
	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}
	public UserInfo(Integer id, String username, String pwd, String email,
			String phone, Integer age, String userIcon, String userDes,
			String registerDate, Integer score, Integer experience,
			Integer state, String sex) {
		super();
		this.id = id;
		this.username = username;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.age = age;
		this.userIcon = userIcon;
		this.userDes = userDes;
		this.registerDate = registerDate;
		this.score = score;
		this.experience = experience;
		this.state = state;
		this.sex=sex;
	}
	public UserInfo() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserIcon() {
		return userIcon;
	}
	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}
	public String getUserDes() {
		return userDes;
	}
	public void setUserDes(String userDes) {
		this.userDes = userDes;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getExperience() {
		return experience;
	}
	public void setExperience(Integer experience) {
		this.experience = experience;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	
    public Date getLastActivateTime() {  
        Calendar cl = Calendar.getInstance();  
        cl.setTime(regDate);  
        cl.add(Calendar.DATE , 2);  
        return cl.getTime();  
    } 
	

}
