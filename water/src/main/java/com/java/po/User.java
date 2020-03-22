package com.java.po;

import java.sql.Timestamp;
import java.util.Date;

public class User {
    private Integer u_id; 
	private String u_username;
	private String u_password;
	private String u_name ;
	private String u_address ;
	private String u_email;
	private String u_phone ;
	private String u_activeCode;
	private boolean u_status;
	private Timestamp u_createTime;
	private String u_validate;
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getU_username() {
		return u_username;
	}
	public void setU_username(String u_username) {
		this.u_username = u_username;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_address() {
		return u_address;
	}
	public void setU_address(String u_address) {
		this.u_address = u_address;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_activeCode() {
		return u_activeCode;
	}
	public void setU_activeCode(String u_activeCode) {
		this.u_activeCode = u_activeCode;
	}
	public boolean isU_status() {
		return u_status;
	}
	public void setU_status(boolean u_status) {
		this.u_status = u_status;
	}
	public Timestamp getU_createTime() {
		return u_createTime;
	}
	public void setU_createTime(Timestamp u_createTime) {
		this.u_createTime = u_createTime;
	}
	public String getU_validate() {
		return u_validate;
	}
	public void setU_validate(String u_validate) {
		this.u_validate = u_validate;
	}
	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_username=" + u_username
				+ ", u_password=" + u_password + ", u_name=" + u_name
				+ ", u_address=" + u_address + ", u_email=" + u_email
				+ ", u_phone=" + u_phone + ", u_activeCode=" + u_activeCode
				+ ", u_status=" + u_status + ", u_createTime=" + u_createTime
				+ ", u_validate=" + u_validate + "]";
	}
	
}
