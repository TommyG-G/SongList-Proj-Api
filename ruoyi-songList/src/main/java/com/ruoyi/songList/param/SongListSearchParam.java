package com.ruoyi.songList.param;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.songList.domain.SongList;

public class SongListSearchParam {

    /** ID（序号） */
    private Long id;

    /** 歌名 */
    @Excel(name = "歌名")
    private String musicName;

    /** 歌手 */
    @Excel(name = "歌手")
    private String singer;

    /** 语言 */
    @Excel(name = "语言")
    private String language;

    /** 曲风 */
    @Excel(name = "曲风")
    private String musicalStyle;

    /** 付费 */
    @Excel(name = "付费")
    private String pay;

    /** 大航海 */
    @Excel(name = "大航海")
    private String exclusiveLevel;

    /** 歌切 */
    @Excel(name = "歌切")
    private String songSlice;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    /** 礼物 */
    @Excel(name = "礼物")
    @JsonDeserialize(using = SongList.JsonToStringDeserializer.class)
    private String gift;

    /** 上传人 */
    @Excel(name = "上传人")
    @JsonDeserialize(using = SongList.JsonToStringDeserializer.class)
    private String uploader;

    /** 选中首字母 */
    @Excel(name = "选中首字母")
    private String selectedLetter;

    private Boolean isFree;

    private Boolean hasPayInfo;

    public Boolean getIsFree() {
        return isFree;
    }

    public void setIsFree(Boolean isFree) {
        this.isFree = isFree;
    }

    public Boolean getHasPayInfo() {
        return hasPayInfo;
    }

    public void setHasPayInfo(Boolean hasPayInfo) {
        this.hasPayInfo = hasPayInfo;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMusicName() {
        return musicName;
    }

    public void setMusicName(String musicName) {
        this.musicName = musicName;
    }

    public String getSinger() {
        return singer;
    }

    public void setSinger(String singer) {
        this.singer = singer;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getMusicalStyle() {
        return musicalStyle;
    }

    public void setMusicalStyle(String musicalStyle) {
        this.musicalStyle = musicalStyle;
    }

    public String getPay() {
        return pay;
    }

    public void setPay(String pay) {
        this.pay = pay;
    }

    public String getExclusiveLevel() {
        return exclusiveLevel;
    }

    public void setExclusiveLevel(String exclusiveLevel) {
        this.exclusiveLevel = exclusiveLevel;
    }

    public String getSongSlice() {
        return songSlice;
    }

    public void setSongSlice(String songSlice) {
        this.songSlice = songSlice;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getGift() {
        return gift;
    }

    public void setGift(String gift) {
        this.gift = gift;
    }

    public String getUploader() {
        return uploader;
    }

    public void setUploader(String uploader) {
        this.uploader = uploader;
    }

    public String getSelectedLetter() {
        return selectedLetter;
    }

    public void setSelectedLetter(String selectedLetter) {
        this.selectedLetter = selectedLetter;
    }

    @Override
    public String toString() {
        return "SongListSearchParam{" +
                "id=" + id +
                ", musicName='" + musicName + '\'' +
                ", singer='" + singer + '\'' +
                ", language='" + language + '\'' +
                ", musicalStyle='" + musicalStyle + '\'' +
                ", pay='" + pay + '\'' +
                ", exclusiveLevel='" + exclusiveLevel + '\'' +
                ", songSlice='" + songSlice + '\'' +
                ", remark='" + remark + '\'' +
                ", gift='" + gift + '\'' +
                ", uploader='" + uploader + '\'' +
                ", selectedLetter='" + selectedLetter + '\'' +
                ", isFree=" + isFree +
                ", hasPayInfo=" + hasPayInfo +
                '}';
    }
}
