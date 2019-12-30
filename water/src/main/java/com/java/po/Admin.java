package com.java.po;

public class Admin {
	private Integer adm_id;
	private String adm_name;
	private String adm_password;
	private boolean adm_status;
	public Integer getAdm_id() {
		return adm_id;
	}
	public void setAdm_id(Integer adm_id) {
		this.adm_id = adm_id;
	}
	public String getAdm_name() {
		return adm_name;
	}
	public void setAdm_name(String adm_name) {
		this.adm_name = adm_name;
	}
	public String getAdm_password() {
		return adm_password;
	}
	public void setAdm_password(String adm_password) {
		this.adm_password = adm_password;
	}
	public boolean isAdm_status() {
		return adm_status;
	}
	public void setAdm_status(boolean adm_status) {
		this.adm_status = adm_status;
	}
	@Override
	public String toString() {
		return "Admin [adm_id=" + adm_id + ", adm_name=" + adm_name
				+ ", adm_password=" + adm_password + ", adm_status="
				+ adm_status + "]";
	}
	
	
}
