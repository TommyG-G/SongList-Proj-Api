package com.ruoyi.songList.vo;

/**
 * 歌单操作结果
 * 
 * @author TommyG
 * @date 2026-03-05
 */
public class SongListOperationResult {
    
    /**
     * 操作类型
     */
    private String operationType;
    
    /**
     * 操作结果（影响行数）
     */
    private int result;
    
    /**
     * 提示信息
     */
    private String message;
    
    public SongListOperationResult() {
    }
    
    public SongListOperationResult(String operationType, int result, String message) {
        this.operationType = operationType;
        this.result = result;
        this.message = message;
    }
    
    // Getters and Setters
    public String getOperationType() {
        return operationType;
    }
    
    public void setOperationType(String operationType) {
        this.operationType = operationType;
    }
    
    public int getResult() {
        return result;
    }
    
    public void setResult(int result) {
        this.result = result;
    }
    
    public String getMessage() {
        return message;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }
}