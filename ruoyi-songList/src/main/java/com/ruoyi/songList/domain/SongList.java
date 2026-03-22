package com.ruoyi.songList.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import java.io.IOException;

/**
 * 歌单对象 song_list
 *
 * @author TommyG
 * @date 2026-02-26
 */
public class SongList
{
    private static final long serialVersionUID = 1L;

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

    /** 曲风 (原本存逗号分隔，现升级为存JSON) */
    @Excel(name = "曲风")
    private String musicalStyle;

    /** 新曲风（前端接收专用二维数组转JSON用） */
    @JsonDeserialize(using = JsonToStringDeserializer.class)
    private String newMusicalStyle;

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
    @JsonDeserialize(using = JsonToStringDeserializer.class)
    private String gift;

    /** 上传人 */
    @Excel(name = "上传人")
    @JsonDeserialize(using = JsonToStringDeserializer.class)
    private String uploader;

    /** 首字母 */
    @Excel(name = "首字母")
    private String firstLetter;

    public String getUploader() {
        return uploader;
    }

    public void setUploader(String uploader) {
        this.uploader = uploader;
    }

    public String getFirstLetter() {
        return firstLetter;
    }

    public void setFirstLetter(String firstLetter) {
        this.firstLetter = firstLetter;
    }

    // 自定义JSON转字符串反序列化器
    public static class JsonToStringDeserializer extends JsonDeserializer<String> {
        @Override
        public String deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
            // 如果是对象或数组，将其转换为JSON字符串
            if (p.getCurrentToken().isStructStart()) {
                return p.readValueAsTree().toString();
            }
            // 如果是基本类型，直接获取文本值
            return p.getValueAsString();
        }
    }

    public String getGift() {
        return gift;
    }

    public void setGift(String gift) {
        this.gift = gift;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setMusicName(String musicName) 
    {
        this.musicName = musicName;
    }

    public String getMusicName() 
    {
        return musicName;
    }

    public void setLanguage(String language) 
    {
        this.language = language;
    }

    public String getLanguage() 
    {
        return language;
    }

    public void setMusicalStyle(String musicalStyle) 
    {
        this.musicalStyle = musicalStyle;
    }

    public String getMusicalStyle() 
    {
        return musicalStyle;
    }

    public String getNewMusicalStyle() {
        return newMusicalStyle;
    }

    public void setNewMusicalStyle(String newMusicalStyle) {
        this.newMusicalStyle = newMusicalStyle;
    }

    public void setPay(String pay) 
    {
        this.pay = pay;
    }

    public String getPay() 
    {
        return pay;
    }

    public void setExclusiveLevel(String exclusiveLevel) 
    {
        this.exclusiveLevel = exclusiveLevel;
    }

    public String getExclusiveLevel() 
    {
        return exclusiveLevel;
    }

    public void setSongSlice(String songSlice) 
    {
        this.songSlice = songSlice;
    }

    public String getSongSlice() 
    {
        return songSlice;
    }

    public String getSinger() {
        return singer;
    }

    public void setSinger(String singer) {
        this.singer = singer;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("musicName", getMusicName())
            .append("singer", getSinger())
            .append("language", getLanguage())
            .append("musicalStyle", getMusicalStyle())
            .append("pay", getPay())
            .append("exclusiveLevel", getExclusiveLevel())
            .append("songSlice", getSongSlice())
            .append("remark", getRemark())
            .append("gift", getGift())
            .append("uploader", getUploader())
            .append("firstLetter", getFirstLetter())
            .toString();
    }
}
