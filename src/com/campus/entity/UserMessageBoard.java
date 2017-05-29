package com.campus.entity;

/*
 * 	用户留言板
 * */
public class UserMessageBoard {


	private Integer	id;//INT PRIMARY KEY IDENTITY,
	private Integer	userid;// INT REFERENCES USERINFO(ID),--关联用户表ID(被留言用户)
	private Integer	userMessId;// INT REFERENCES USERINFO(ID),----关联用户表ID(留言用户)
	private String	content;// VARCHAR(120) NOT NULL,--留言信息
	private String	endtime;// DATETIME DEFAULT GETDATE()--留言时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getUserMessId() {
		return userMessId;
	}
	public void setUserMessId(Integer userMessId) {
		this.userMessId = userMessId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public UserMessageBoard(Integer id, Integer userid, Integer userMessId,
			String content, String endtime) {
		super();
		this.id = id;
		this.userid = userid;
		this.userMessId = userMessId;
		this.content = content;
		this.endtime = endtime;
	}
	public UserMessageBoard() {
		super();
	}
	
	
	
	
}
