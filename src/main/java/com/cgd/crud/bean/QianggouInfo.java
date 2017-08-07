package com.cgd.crud.bean;

import java.util.Date;
import java.util.List;

public class QianggouInfo {
	private String brand;
	private String platform;
	private Date qianggouTime;
	private List<Qianggoubiao> listInfo;
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	public Date getQianggouTime() {
		return qianggouTime;
	}
	public void setQianggouTime(Date qianggouTime) {
		this.qianggouTime = qianggouTime;
	}
	public List<Qianggoubiao> getListInfo() {
		return listInfo;
	}
	public void setListInfo(List<Qianggoubiao> listInfo) {
		this.listInfo = listInfo;
	}
	
	
}
