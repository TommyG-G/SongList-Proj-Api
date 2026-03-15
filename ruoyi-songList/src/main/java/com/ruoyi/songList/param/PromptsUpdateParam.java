package com.ruoyi.songList.param;

public class PromptsUpdateParam {

    private String pageTitle;

    private String mainPrompt;

    private String subPrompt;

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
        return "PromptsUpdateParam{" +
                "pageTitle='" + pageTitle + '\'' +
                ", mainPrompt='" + mainPrompt + '\'' +
                ", subPrompt='" + subPrompt + '\'' +
                '}';
    }
}
