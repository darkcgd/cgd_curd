package com.cgd.crud.bean;

import java.util.Date;

public class Qianggoubiao {
    private Integer qianggouId;

    private String qianngouName;

    private Date createTime;

    private String directeUrl;

    private Date qianggoubiaoTime;

    private Integer qianggouBrandId;

    private Integer qianggouPlatformId;

    private String logo;

    private String remark;

    private String isInvalid;

    private String createUser;

    private Brand brand;
    
    private Platform platform;
    
    
    
    public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public Platform getPlatform() {
		return platform;
	}

	public void setPlatform(Platform platform) {
		this.platform = platform;
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

    public String getDirecteUrl() {
        return directeUrl;
    }

    public void setDirecteUrl(String directeUrl) {
        this.directeUrl = directeUrl == null ? null : directeUrl.trim();
    }

    public Date getQianggoubiaoTime() {
        return qianggoubiaoTime;
    }

    public void setQianggoubiaoTime(Date qianggoubiaoTime) {
        this.qianggoubiaoTime = qianggoubiaoTime;
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
}