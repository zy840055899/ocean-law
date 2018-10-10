package com.jinge.ocean.entity;

public class Page {
    private Long totals;

    private Long page;//当前

    private Long rows;//一次取几条数据

    private long startRow;


    public Long getTotals() {
        return totals;
    }

    public void setTotals(Long totals) {
        this.totals = totals;
    }

    public Long getPage() {
        return page;
    }

    public void setPage(Long page) {
        this.page = ((page == null) ? 1 : page);
    }

    public Long getRows() {
        return rows;
    }

    public void setRows(Long rows) {
        this.rows = ((rows == null) ? 10 : rows);
    }

    public Long getStartRow() {

        if (page == null || rows == null) {
            return null;
        } else {
            return (page - 1) * rows;
        }
    }

    public void setStartRow(long startRow) {
        this.startRow = startRow;
    }

}
