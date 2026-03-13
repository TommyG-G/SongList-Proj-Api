package com.ruoyi.songList.vo;

import com.ruoyi.common.annotation.Excel;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.songList.domain.SongList;

/**
 * 歌单导出VO对象
 * 
 * @author TommyG
 * @date 2026-03-13
 */
public class SongListExportVo {
    
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

    /** 礼物（只显示name字段） */
    @Excel(name = "礼物")
    private String gift;

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

    /**
     * 从SongList对象转换为导出VO对象
     * 
     * @param songList 原始歌单对象
     * @return 导出VO对象
     */
    public static SongListExportVo fromSongList(SongList songList) {
        SongListExportVo exportVo = new SongListExportVo();
        exportVo.setMusicName(songList.getMusicName());
        exportVo.setSinger(songList.getSinger());
        exportVo.setLanguage(songList.getLanguage());
        exportVo.setMusicalStyle(songList.getMusicalStyle());
        exportVo.setPay(songList.getPay());
        exportVo.setExclusiveLevel(songList.getExclusiveLevel());
        exportVo.setSongSlice(songList.getSongSlice());
        exportVo.setRemark(songList.getRemark());
        
        // 处理礼物字段：从JSON中提取name字段
        if (songList.getGift() != null && !songList.getGift().trim().isEmpty()) {
            try {
                ObjectMapper objectMapper = new ObjectMapper();
                JsonNode giftJson = objectMapper.readTree(songList.getGift());
                if (giftJson.has("name")) {
                    exportVo.setGift(giftJson.get("name").asText());
                } else {
                    exportVo.setGift(songList.getGift());
                }
            } catch (Exception e) {
                // 如果解析失败，直接使用原始值
                exportVo.setGift(songList.getGift());
            }
        }
        
        return exportVo;
    }
}