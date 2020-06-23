package com.example.springmybaits.daomain;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class Goods {
    private Integer id;
    private Integer gid;
    private String  gname;
    private String title;
    private Integer price;
    private Integer grade;
    private Integer mingwen;
    private Integer wzsj;
    private Integer pifu;
    private Integer yingxiong;
    private Integer guizu;
    private String sys;
    private String server;

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", pid=" + gid +
                ", gname='" + gname + '\'' +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", grade=" + grade +
                ", mingwen=" + mingwen +
                ", wzsj=" + wzsj +
                ", pifu=" + pifu +
                ", yingxiong=" + yingxiong +
                ", guizu=" + guizu +
                ", system='" + sys + '\'' +
                ", server='" + server + '\'' +
                '}';
    }
}
