package com.campus.entity;

/*
 * 	�û����԰�
 * */
public class UserMessageBoard {


	private Integer	id;//INT PRIMARY KEY IDENTITY,
	private Integer	userid;// INT REFERENCES USERINFO(ID),--�����û���ID(�������û�)
	private Integer	userMessId;// INT REFERENCES USERINFO(ID),----�����û���ID(�����û�)
	private String	content;// VARCHAR(120) NOT NULL,--������Ϣ
	private String	endtime;// DATETIME DEFAULT GETDATE()--����ʱ��
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
