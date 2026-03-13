package com.ruoyi.common.core.domain.param;

public class UserExtendInfo {

    private String UID;

    private String liveUrl;

    private String homePage;

    public String getUID() {
        return UID;
    }

    public void setUID(String UID) {
        this.UID = UID;
    }

    public String getLiveUrl() {
        return liveUrl;
    }

    public void setLiveUrl(String liveUrl) {
        this.liveUrl = liveUrl;
    }

    public String getHomePage() {
        return homePage;
    }

    public void setHomePage(String homePage) {
        this.homePage = homePage;
    }

    @Override
    public String toString() {
        return "UserExtendInfo{" +
                "UID='" + UID + '\'' +
                ", liveUrl='" + liveUrl + '\'' +
                ", homePage='" + homePage + '\'' +
                '}';
    }
}
