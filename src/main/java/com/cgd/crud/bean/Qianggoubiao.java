package com.cgd.crud.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Qianggoubiao {
    private Integer qianggouId;

    private String qianngouName;

    @DateTimeFormat( pattern = "yyyy-MM-dd hh:mm:ss" )
    private Date createTime;

    private String logo;

    private String remark;

    private String directeUrl;

    private String isInvalid;

    private String createUser;

    private String qianggoubiaoTime;

    private Integer qianggouBrandId;

    private Integer qianggouPlatformId;

    private Brand brand;
    
    public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public Integer getQianggouId() {
        return qianggouId;
    }

    public void setQianggouId(Integer qianggouId) {
        this.qianggouId = qianggouId;
    }

    public String getQianngouName() {
        return qianngouName;
    }

    public void setQianngouName(String qianngouName) {
        this.qianngouName = qianngouName == null ? null : qianngouName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo == null ? null : logo.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getDirecteUrl() {
        return directeUrl;
    }

    public void setDirecteUrl(String directeUrl) {
        this.directeUrl = directeUrl == null ? null : directeUrl.trim();
    }

    public String getIsInvalid() {
        return isInvalid;
    }

    public void setIsInvalid(String isInvalid) {
        this.isInvalid = isInvalid == null ? null : isInvalid.trim();
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

    public String getQianggoubiaoTime() {
        return qianggoubiaoTime;
    }

    public void setQianggoubiaoTime(String qianggoubiaoTime) {
        this.qianggoubiaoTime = qianggoubiaoTime == null ? null : qianggoubiaoTime.trim();
    }

    public Integer getQianggouBrandId() {
        return qianggouBrandId;
    }

    public void setQianggouBrandId(Integer qianggouBrandId) {
        this.qianggouBrandId = qianggouBrandId;
    }

    public Integer getQianggouPlatformId() {
        return qianggouPlatformId;
    }

    public void setQianggouPlatformId(Integer qianggouPlatformId) {
        this.qianggouPlatformId = qianggouPlatformId;
    }

	@Override
	public String toString() {
		return "Qianggoubiao [qianggouId=" + qianggouId + ", qianngouName=" + qianngouName + ", createTime="
				+ createTime + ", logo=" + logo + ", remark=" + remark + ", directeUrl=" + directeUrl + ", isInvalid="
				+ isInvalid + ", createUser=" + createUser + ", qianggoubiaoTime=" + qianggoubiaoTime
				+ ", qianggouBrandId=" + qianggouBrandId + ", qianggouPlatformId=" + qianggouPlatformId + ", brand="
				+ brand + ", getBrand()=" + getBrand() + ", getQianggouId()=" + getQianggouId() + ", getQianngouName()="
				+ getQianngouName() + ", getCreateTime()=" + getCreateTime() + ", getLogo()=" + getLogo()
				+ ", getRemark()=" + getRemark() + ", getDirecteUrl()=" + getDirecteUrl() + ", getIsInvalid()="
				+ getIsInvalid() + ", getCreateUser()=" + getCreateUser() + ", getQianggoubiaoTime()="
				+ getQianggoubiaoTime() + ", getQianggouBrandId()=" + getQianggouBrandId()
				+ ", getQianggouPlatformId()=" + getQianggouPlatformId();
	}
    
    
}