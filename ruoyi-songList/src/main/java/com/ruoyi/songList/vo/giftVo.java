package com.ruoyi.songList.vo;


public class giftVo  {

    private String name;

    private String price;

    private String icon;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    @Override
    public String toString() {
        return "giftVo{" +
                "name='" + getName() + '\'' +
                ", price='" + getPrice() + '\'' +
                ", icon='" + getIcon() + '\'' +
                '}';
    }
}
