package com.ruoyi.common.core.domain.param;

public class UserExtendInfo {

    private Long userId;

    private String uid;

    private String liveUrl;

    private String homePage;

    private String backgroundImage;

    private String backgroundColor;

    private String pageTitle;

    private String mainPrompt;

    private String subPrompt;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
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

    public String getBackgroundImage() {
        return backgroundImage;
    }

    public void setBackgroundImage(String backgroundImage) {
        this.backgroundImage = backgroundImage;
    }

    public String getBackgroundColor() {
        return backgroundColor;
    }

    public void setBackgroundColor(String backgroundColor) {
        this.backgroundColor = backgroundColor;
    }

    public String getPageTitle() {
        return pageTitle;
    }

    public void setPageTitle(String pageTitle) {
        this.pageTitle = pageTitle;
    }

    public String getMainPrompt() {
        return mainPrompt;
    }

    public void setMainPrompt(String mainPrompt) {
        this.mainPrompt = mainPrompt;
    }

    public String getSubPrompt() {
        return subPrompt;
    }

    public void setSubPrompt(String subPrompt) {
        this.subPrompt = subPrompt;
    }

    @Override
    public String toString() {
        return "UserExtendInfo{" +
                "uid='" + uid + '\'' +
                ", liveUrl='" + liveUrl + '\'' +
                ", homePage='" + homePage + '\'' +
                ", backgroundImage='" + backgroundImage + '\'' +
                ", backgroundColor='" + backgroundColor + '\'' +
                ", pageTitle='" + pageTitle + '\'' +
                ", mainPrompt='" + mainPrompt + '\'' +
                ", subPrompt='" + subPrompt + '\'' +
                '}';
    }
}
