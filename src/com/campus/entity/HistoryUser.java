package com.campus.entity;


/**
 * 用户信息历史记录表
 * */
public class HistoryUser {

	
	private Integer id;// INT PRIMARY KEY IDENTITY(1000,1) NOT NULL,--ID
	private Integer historyId;// INT REFERENCES userInfo(id) NOT NULL,--关联用户表ID
	private Integer password;// VARCHAR(16),--密码
	private Integer time;// datetime default GETDATE()--时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getHistoryId() {
		return historyId;
	}
	public void setHistoryId(Integer historyId) {
		this.historyId = historyId;
	}
	public Integer getPassword() {
		return password;
	}
	public void setPassword(Integer password) {
		this.password = password;
	}
	public Integer getTime() {
		return time;
	}
	public void setTime(Integer time) {
		this.time = time;
	}
	public HistoryUser(Integer id, Integer historyId, Integer password,
			Integer time) {
		super();
		this.id = id;
		this.historyId = historyId;
		this.password = password;
		this.time = time;
	}
	public HistoryUser() {
		super();
	}
	
	
	
}
