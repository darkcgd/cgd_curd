package com.cgd.crud.bean;

/**
 * Created by szmg on 17/9/22.
 */
public class OrderStatusCount {
    /**
     select count(1)total,sum(case when order_status=1 then 1 else 0 end)unpay_count
     ,sum(case when order_status=2 then 1 else 0 end) unsend_count
     ,sum(case when order_status=3 then 1 else 0 end) sendding_count
     ,sum(case when order_status=4 then 1 else 0 end) uncomment_count
     ,sum(case when order_status=5 then 1 else 0 end) success_count
     ,sum(case when order_status=6 then 1 else 0 end) cancel_count
     ,sum(case when order_status=7 then 1 else 0 end) delete_count
     from tbl_order
     */
    private Integer total;
    private Integer unpayCount;
    private Integer unsendCount;
    private Integer senddingCount;
    private Integer uncommentCount;
    private Integer successCount;
    private Integer cancelCount;
    private Integer deleteCount;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getUnpayCount() {
        return unpayCount;
    }

    public void setUnpayCount(Integer unpayCount) {
        this.unpayCount = unpayCount;
    }

    public Integer getUnsendCount() {
        return unsendCount;
    }

    public void setUnsendCount(Integer unsendCount) {
        this.unsendCount = unsendCount;
    }

    public Integer getSenddingCount() {
        return senddingCount;
    }

    public void setSenddingCount(Integer senddingCount) {
        this.senddingCount = senddingCount;
    }

    public Integer getUncommentCount() {
        return uncommentCount;
    }

    public void setUncommentCount(Integer uncommentCount) {
        this.uncommentCount = uncommentCount;
    }

    public Integer getSuccessCount() {
        return successCount;
    }

    public void setSuccessCount(Integer successCount) {
        this.successCount = successCount;
    }

    public Integer getCancelCount() {
        return cancelCount;
    }

    public void setCancelCount(Integer cancelCount) {
        this.cancelCount = cancelCount;
    }

    public Integer getDeleteCount() {
        return deleteCount;
    }

    public void setDeleteCount(Integer deleteCount) {
        this.deleteCount = deleteCount;
    }
}
