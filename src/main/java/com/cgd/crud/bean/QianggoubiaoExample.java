package com.cgd.crud.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class QianggoubiaoExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public QianggoubiaoExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andQianggouIdIsNull() {
            addCriterion("qianggou_id is null");
            return (Criteria) this;
        }

        public Criteria andQianggouIdIsNotNull() {
            addCriterion("qianggou_id is not null");
            return (Criteria) this;
        }

        public Criteria andQianggouIdEqualTo(Integer value) {
            addCriterion("qianggou_id =", value, "qianggouId");
            return (Criteria) this;
        }

        public Criteria andQianggouIdNotEqualTo(Integer value) {
            addCriterion("qianggou_id <>", value, "qianggouId");
            return (Criteria) this;
        }

        public Criteria andQianggouIdGreaterThan(Integer value) {
            addCriterion("qianggou_id >", value, "qianggouId");
            return (Criteria) this;
        }

        public Criteria andQianggouIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("qianggou_id >=", value, "qianggouId");
            return (Criteria) this;
        }

        public Criteria andQianggouIdLessThan(Integer value) {
            addCriterion("qianggou_id <", value, "qianggouId");
            return (Criteria) this;
        }

        public Criteria andQianggouIdLessThanOrEqualTo(Integer value) {
            addCriterion("qianggou_id <=", value, "qianggouId");
            return (Criteria) this;
        }

        public Criteria andQianggouIdIn(List<Integer> values) {
            addCriterion("qianggou_id in", values, "qianggouId");
            return (Criteria) this;
        }

        public Criteria andQianggouIdNotIn(List<Integer> values) {
            addCriterion("qianggou_id not in", values, "qianggouId");
            return (Criteria) this;
        }

        public Criteria andQianggouIdBetween(Integer value1, Integer value2) {
            addCriterion("qianggou_id between", value1, value2, "qianggouId");
            return (Criteria) this;
        }

        public Criteria andQianggouIdNotBetween(Integer value1, Integer value2) {
            addCriterion("qianggou_id not between", value1, value2, "qianggouId");
            return (Criteria) this;
        }

        public Criteria andQianngouNameIsNull() {
            addCriterion("qianngou_name is null");
            return (Criteria) this;
        }

        public Criteria andQianngouNameIsNotNull() {
            addCriterion("qianngou_name is not null");
            return (Criteria) this;
        }

        public Criteria andQianngouNameEqualTo(String value) {
            addCriterion("qianngou_name =", value, "qianngouName");
            return (Criteria) this;
        }

        public Criteria andQianngouNameNotEqualTo(String value) {
            addCriterion("qianngou_name <>", value, "qianngouName");
            return (Criteria) this;
        }

        public Criteria andQianngouNameGreaterThan(String value) {
            addCriterion("qianngou_name >", value, "qianngouName");
            return (Criteria) this;
        }

        public Criteria andQianngouNameGreaterThanOrEqualTo(String value) {
            addCriterion("qianngou_name >=", value, "qianngouName");
            return (Criteria) this;
        }

        public Criteria andQianngouNameLessThan(String value) {
            addCriterion("qianngou_name <", value, "qianngouName");
            return (Criteria) this;
        }

        public Criteria andQianngouNameLessThanOrEqualTo(String value) {
            addCriterion("qianngou_name <=", value, "qianngouName");
            return (Criteria) this;
        }

        public Criteria andQianngouNameLike(String value) {
            addCriterion("qianngou_name like", value, "qianngouName");
            return (Criteria) this;
        }

        public Criteria andQianngouNameNotLike(String value) {
            addCriterion("qianngou_name not like", value, "qianngouName");
            return (Criteria) this;
        }

        public Criteria andQianngouNameIn(List<String> values) {
            addCriterion("qianngou_name in", values, "qianngouName");
            return (Criteria) this;
        }

        public Criteria andQianngouNameNotIn(List<String> values) {
            addCriterion("qianngou_name not in", values, "qianngouName");
            return (Criteria) this;
        }

        public Criteria andQianngouNameBetween(String value1, String value2) {
            addCriterion("qianngou_name between", value1, value2, "qianngouName");
            return (Criteria) this;
        }

        public Criteria andQianngouNameNotBetween(String value1, String value2) {
            addCriterion("qianngou_name not between", value1, value2, "qianngouName");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andLogoIsNull() {
            addCriterion("logo is null");
            return (Criteria) this;
        }

        public Criteria andLogoIsNotNull() {
            addCriterion("logo is not null");
            return (Criteria) this;
        }

        public Criteria andLogoEqualTo(String value) {
            addCriterion("logo =", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoNotEqualTo(String value) {
            addCriterion("logo <>", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoGreaterThan(String value) {
            addCriterion("logo >", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoGreaterThanOrEqualTo(String value) {
            addCriterion("logo >=", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoLessThan(String value) {
            addCriterion("logo <", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoLessThanOrEqualTo(String value) {
            addCriterion("logo <=", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoLike(String value) {
            addCriterion("logo like", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoNotLike(String value) {
            addCriterion("logo not like", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoIn(List<String> values) {
            addCriterion("logo in", values, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoNotIn(List<String> values) {
            addCriterion("logo not in", values, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoBetween(String value1, String value2) {
            addCriterion("logo between", value1, value2, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoNotBetween(String value1, String value2) {
            addCriterion("logo not between", value1, value2, "logo");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNull() {
            addCriterion("remark is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("remark is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("remark =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("remark <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("remark >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("remark >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("remark <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("remark <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("remark like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("remark not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("remark in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("remark not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("remark between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("remark not between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlIsNull() {
            addCriterion("directe_url is null");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlIsNotNull() {
            addCriterion("directe_url is not null");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlEqualTo(String value) {
            addCriterion("directe_url =", value, "directeUrl");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlNotEqualTo(String value) {
            addCriterion("directe_url <>", value, "directeUrl");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlGreaterThan(String value) {
            addCriterion("directe_url >", value, "directeUrl");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlGreaterThanOrEqualTo(String value) {
            addCriterion("directe_url >=", value, "directeUrl");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlLessThan(String value) {
            addCriterion("directe_url <", value, "directeUrl");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlLessThanOrEqualTo(String value) {
            addCriterion("directe_url <=", value, "directeUrl");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlLike(String value) {
            addCriterion("directe_url like", value, "directeUrl");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlNotLike(String value) {
            addCriterion("directe_url not like", value, "directeUrl");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlIn(List<String> values) {
            addCriterion("directe_url in", values, "directeUrl");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlNotIn(List<String> values) {
            addCriterion("directe_url not in", values, "directeUrl");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlBetween(String value1, String value2) {
            addCriterion("directe_url between", value1, value2, "directeUrl");
            return (Criteria) this;
        }

        public Criteria andDirecteUrlNotBetween(String value1, String value2) {
            addCriterion("directe_url not between", value1, value2, "directeUrl");
            return (Criteria) this;
        }

        public Criteria andIsInvalidIsNull() {
            addCriterion("is_invalid is null");
            return (Criteria) this;
        }

        public Criteria andIsInvalidIsNotNull() {
            addCriterion("is_invalid is not null");
            return (Criteria) this;
        }

        public Criteria andIsInvalidEqualTo(String value) {
            addCriterion("is_invalid =", value, "isInvalid");
            return (Criteria) this;
        }

        public Criteria andIsInvalidNotEqualTo(String value) {
            addCriterion("is_invalid <>", value, "isInvalid");
            return (Criteria) this;
        }

        public Criteria andIsInvalidGreaterThan(String value) {
            addCriterion("is_invalid >", value, "isInvalid");
            return (Criteria) this;
        }

        public Criteria andIsInvalidGreaterThanOrEqualTo(String value) {
            addCriterion("is_invalid >=", value, "isInvalid");
            return (Criteria) this;
        }

        public Criteria andIsInvalidLessThan(String value) {
            addCriterion("is_invalid <", value, "isInvalid");
            return (Criteria) this;
        }

        public Criteria andIsInvalidLessThanOrEqualTo(String value) {
            addCriterion("is_invalid <=", value, "isInvalid");
            return (Criteria) this;
        }

        public Criteria andIsInvalidLike(String value) {
            addCriterion("is_invalid like", value, "isInvalid");
            return (Criteria) this;
        }

        public Criteria andIsInvalidNotLike(String value) {
            addCriterion("is_invalid not like", value, "isInvalid");
            return (Criteria) this;
        }

        public Criteria andIsInvalidIn(List<String> values) {
            addCriterion("is_invalid in", values, "isInvalid");
            return (Criteria) this;
        }

        public Criteria andIsInvalidNotIn(List<String> values) {
            addCriterion("is_invalid not in", values, "isInvalid");
            return (Criteria) this;
        }

        public Criteria andIsInvalidBetween(String value1, String value2) {
            addCriterion("is_invalid between", value1, value2, "isInvalid");
            return (Criteria) this;
        }

        public Criteria andIsInvalidNotBetween(String value1, String value2) {
            addCriterion("is_invalid not between", value1, value2, "isInvalid");
            return (Criteria) this;
        }

        public Criteria andCreateUserIsNull() {
            addCriterion("create_user is null");
            return (Criteria) this;
        }

        public Criteria andCreateUserIsNotNull() {
            addCriterion("create_user is not null");
            return (Criteria) this;
        }

        public Criteria andCreateUserEqualTo(String value) {
            addCriterion("create_user =", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotEqualTo(String value) {
            addCriterion("create_user <>", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserGreaterThan(String value) {
            addCriterion("create_user >", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserGreaterThanOrEqualTo(String value) {
            addCriterion("create_user >=", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLessThan(String value) {
            addCriterion("create_user <", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLessThanOrEqualTo(String value) {
            addCriterion("create_user <=", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLike(String value) {
            addCriterion("create_user like", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotLike(String value) {
            addCriterion("create_user not like", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserIn(List<String> values) {
            addCriterion("create_user in", values, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotIn(List<String> values) {
            addCriterion("create_user not in", values, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserBetween(String value1, String value2) {
            addCriterion("create_user between", value1, value2, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotBetween(String value1, String value2) {
            addCriterion("create_user not between", value1, value2, "createUser");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeIsNull() {
            addCriterion("qianggoubiao_time is null");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeIsNotNull() {
            addCriterion("qianggoubiao_time is not null");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeEqualTo(String value) {
            addCriterion("qianggoubiao_time =", value, "qianggoubiaoTime");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeNotEqualTo(String value) {
            addCriterion("qianggoubiao_time <>", value, "qianggoubiaoTime");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeGreaterThan(String value) {
            addCriterion("qianggoubiao_time >", value, "qianggoubiaoTime");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeGreaterThanOrEqualTo(String value) {
            addCriterion("qianggoubiao_time >=", value, "qianggoubiaoTime");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeLessThan(String value) {
            addCriterion("qianggoubiao_time <", value, "qianggoubiaoTime");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeLessThanOrEqualTo(String value) {
            addCriterion("qianggoubiao_time <=", value, "qianggoubiaoTime");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeLike(String value) {
            addCriterion("qianggoubiao_time like", value, "qianggoubiaoTime");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeNotLike(String value) {
            addCriterion("qianggoubiao_time not like", value, "qianggoubiaoTime");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeIn(List<String> values) {
            addCriterion("qianggoubiao_time in", values, "qianggoubiaoTime");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeNotIn(List<String> values) {
            addCriterion("qianggoubiao_time not in", values, "qianggoubiaoTime");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeBetween(String value1, String value2) {
            addCriterion("qianggoubiao_time between", value1, value2, "qianggoubiaoTime");
            return (Criteria) this;
        }

        public Criteria andQianggoubiaoTimeNotBetween(String value1, String value2) {
            addCriterion("qianggoubiao_time not between", value1, value2, "qianggoubiaoTime");
            return (Criteria) this;
        }

        public Criteria andQianggouBrandIdIsNull() {
            addCriterion("qianggou_brand_id is null");
            return (Criteria) this;
        }

        public Criteria andQianggouBrandIdIsNotNull() {
            addCriterion("qianggou_brand_id is not null");
            return (Criteria) this;
        }

        public Criteria andQianggouBrandIdEqualTo(Integer value) {
            addCriterion("qianggou_brand_id =", value, "qianggouBrandId");
            return (Criteria) this;
        }

        public Criteria andQianggouBrandIdNotEqualTo(Integer value) {
            addCriterion("qianggou_brand_id <>", value, "qianggouBrandId");
            return (Criteria) this;
        }

        public Criteria andQianggouBrandIdGreaterThan(Integer value) {
            addCriterion("qianggou_brand_id >", value, "qianggouBrandId");
            return (Criteria) this;
        }

        public Criteria andQianggouBrandIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("qianggou_brand_id >=", value, "qianggouBrandId");
            return (Criteria) this;
        }

        public Criteria andQianggouBrandIdLessThan(Integer value) {
            addCriterion("qianggou_brand_id <", value, "qianggouBrandId");
            return (Criteria) this;
        }

        public Criteria andQianggouBrandIdLessThanOrEqualTo(Integer value) {
            addCriterion("qianggou_brand_id <=", value, "qianggouBrandId");
            return (Criteria) this;
        }

        public Criteria andQianggouBrandIdIn(List<Integer> values) {
            addCriterion("qianggou_brand_id in", values, "qianggouBrandId");
            return (Criteria) this;
        }

        public Criteria andQianggouBrandIdNotIn(List<Integer> values) {
            addCriterion("qianggou_brand_id not in", values, "qianggouBrandId");
            return (Criteria) this;
        }

        public Criteria andQianggouBrandIdBetween(Integer value1, Integer value2) {
            addCriterion("qianggou_brand_id between", value1, value2, "qianggouBrandId");
            return (Criteria) this;
        }

        public Criteria andQianggouBrandIdNotBetween(Integer value1, Integer value2) {
            addCriterion("qianggou_brand_id not between", value1, value2, "qianggouBrandId");
            return (Criteria) this;
        }

        public Criteria andQianggouPlatformIdIsNull() {
            addCriterion("qianggou_platform_id is null");
            return (Criteria) this;
        }

        public Criteria andQianggouPlatformIdIsNotNull() {
            addCriterion("qianggou_platform_id is not null");
            return (Criteria) this;
        }

        public Criteria andQianggouPlatformIdEqualTo(Integer value) {
            addCriterion("qianggou_platform_id =", value, "qianggouPlatformId");
            return (Criteria) this;
        }

        public Criteria andQianggouPlatformIdNotEqualTo(Integer value) {
            addCriterion("qianggou_platform_id <>", value, "qianggouPlatformId");
            return (Criteria) this;
        }

        public Criteria andQianggouPlatformIdGreaterThan(Integer value) {
            addCriterion("qianggou_platform_id >", value, "qianggouPlatformId");
            return (Criteria) this;
        }

        public Criteria andQianggouPlatformIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("qianggou_platform_id >=", value, "qianggouPlatformId");
            return (Criteria) this;
        }

        public Criteria andQianggouPlatformIdLessThan(Integer value) {
            addCriterion("qianggou_platform_id <", value, "qianggouPlatformId");
            return (Criteria) this;
        }

        public Criteria andQianggouPlatformIdLessThanOrEqualTo(Integer value) {
            addCriterion("qianggou_platform_id <=", value, "qianggouPlatformId");
            return (Criteria) this;
        }

        public Criteria andQianggouPlatformIdIn(List<Integer> values) {
            addCriterion("qianggou_platform_id in", values, "qianggouPlatformId");
            return (Criteria) this;
        }

        public Criteria andQianggouPlatformIdNotIn(List<Integer> values) {
            addCriterion("qianggou_platform_id not in", values, "qianggouPlatformId");
            return (Criteria) this;
        }

        public Criteria andQianggouPlatformIdBetween(Integer value1, Integer value2) {
            addCriterion("qianggou_platform_id between", value1, value2, "qianggouPlatformId");
            return (Criteria) this;
        }

        public Criteria andQianggouPlatformIdNotBetween(Integer value1, Integer value2) {
            addCriterion("qianggou_platform_id not between", value1, value2, "qianggouPlatformId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}