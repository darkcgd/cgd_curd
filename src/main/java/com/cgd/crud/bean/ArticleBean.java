package com.cgd.crud.bean;

import java.util.Date;

public class ArticleBean {
    private Integer id;

    private String title;

    private String directeUrl;

    private String logo;

    private Date createTime;

    private Date updateTime;

    private Integer readCount;

    private Integer tagId1;

    private Integer tagId2;

    private Integer tagId3;

    private Integer createUserId;

    private String status;

    private String remark;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDirecteUrl() {
        return directeUrl;
    }

    public void setDirecteUrl(String directeUrl) {
        this.directeUrl = directeUrl == null ? null : directeUrl.trim();
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo == null ? null : logo.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getReadCount() {
        return readCount;
    }

    public void setReadCount(Integer readCount) {
        this.readCount = readCount;
    }

    public Integer getTagId1() {
        return tagId1;
    }

    public void setTagId1(Integer tagId1) {
        this.tagId1 = tagId1;
    }

    public Integer getTagId2() {
        return tagId2;
    }

    public void setTagId2(Integer tagId2) {
        this.tagId2 = tagId2;
    }

    public Integer getTagId3() {
        return tagId3;
    }

    public void setTagId3(Integer tagId3) {
        this.tagId3 = tagId3;
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}