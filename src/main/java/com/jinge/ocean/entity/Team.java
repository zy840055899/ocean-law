package com.jinge.ocean.entity;

import java.util.Date;

/**
 * @author zheng 2018-9-27 16:21:07
 * 执法队伍实体类
 */
public class Team {
    private int id;
    private String name;
    private String phone;
    private String head;
    private String headArea;
    private Date createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getHeadArea() {
        return headArea;
    }

    public void setHeadArea(String headArea) {
        this.headArea = headArea;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Team{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", head='" + head + '\'' +
                ", headArea='" + headArea + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
