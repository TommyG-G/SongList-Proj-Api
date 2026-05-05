package com.ruoyi.common.utils.bilibili;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.*;

/**
 * Bilibili API 工具类
 * 参考: https://github.com/SocialSisterYi/bilibili-API-collect
 * 
 * @author ruoyi
 * @date 2026-04-25
 */
@Component
public class BilibiliApiUtils
{
    private static final RestTemplate restTemplate = new RestTemplate();

    // B站API基础URL
    private static final String BILI_PASSPORT_URL = "https://passport.bilibili.com";
    private static final String BILI_API_URL = "https://api.bilibili.com";
    private static final String BILI_LIVE_URL = "https://api.live.bilibili.com";

    /**
     * 生成登录二维码
     * 
     * @return 二维码信息 {url, qrcode_key}
     */
    public Map<String, String> generateQRCode()
    {
        try
        {
            String url = BILI_PASSPORT_URL + "/x/passport-login/web/qrcode/generate";
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            HttpEntity<String> entity = new HttpEntity<>(headers);
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
            
            JSONObject result = JSON.parseObject(response.getBody());
            if (result.getInteger("code") == 0)
            {
                JSONObject data = result.getJSONObject("data");
                Map<String, String> qrInfo = new HashMap<>();
                qrInfo.put("url", data.getString("url"));
                qrInfo.put("qrcodeKey", data.getString("qrcode_key"));
                return qrInfo;
            }
            else
            {
                throw new RuntimeException("生成二维码失败: " + result.getString("message"));
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException("调用B站API异常: " + e.getMessage());
        }
    }

    /**
     * 查询二维码扫描状态
     * 
     * @param qrcodeKey 二维码密钥
     * @return 登录结果 {code, message, cookies}
     */
    public Map<String, Object> checkQRCodeStatus(String qrcodeKey)
    {
        try
        {
            String url = BILI_PASSPORT_URL + "/x/passport-login/web/qrcode/poll?qrcode_key=" + qrcodeKey;
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            HttpEntity<String> entity = new HttpEntity<>(headers);
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
            
            JSONObject result = JSON.parseObject(response.getBody());
            Map<String, Object> statusInfo = new HashMap<>();
            
            if (result.getInteger("code") == 0)
            {
                JSONObject data = result.getJSONObject("data");
                Integer code = data.getInteger("code");
                
                // code: 0-扫码成功, 86038-二维码过期, 86090-已扫码未确认, 86101-未扫码
                statusInfo.put("code", code);
                statusInfo.put("message", data.getString("message"));
                
                if (code == 0)
                {
                    // 登录成功，提取Cookie信息
                    String urlStr = data.getString("url");
                    Map<String, String> cookies = extractCookiesFromUrl(urlStr);
                    statusInfo.put("cookies", cookies);
                    statusInfo.put("success", true);
                }
                else
                {
                    statusInfo.put("success", false);
                }
            }
            else
            {
                statusInfo.put("success", false);
                statusInfo.put("message", result.getString("message"));
            }
            
            return statusInfo;
        }
        catch (Exception e)
        {
            throw new RuntimeException("查询二维码状态异常: " + e.getMessage());
        }
    }

    /**
     * 从URL中提取Cookie信息
     * 
     * @param url 包含Cookie参数的URL
     * @return Cookie映射
     */
    private Map<String, String> extractCookiesFromUrl(String url)
    {
        Map<String, String> cookies = new HashMap<>();
        
        if (url != null && url.contains("?"))
        {
            String queryString = url.substring(url.indexOf("?") + 1);
            String[] params = queryString.split("&");
            
            for (String param : params)
            {
                String[] keyValue = param.split("=");
                if (keyValue.length == 2)
                {
                    cookies.put(keyValue[0], keyValue[1]);
                }
            }
        }
        
        return cookies;
    }

    /**
     * 获取B站用户信息
     * 
     * @param sessdata SESSDATA Cookie
     * @param biliJct bili_jct Cookie
     * @return 用户信息
     */
    public Map<String, Object> getUserInfo(String sessdata, String biliJct)
    {
        try
        {
            String url = BILI_API_URL + "/x/member/web/account";
            
            HttpHeaders headers = new HttpHeaders();
            headers.set("Cookie", "SESSDATA=" + sessdata + "; bili_jct=" + biliJct);
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            HttpEntity<String> entity = new HttpEntity<>(headers);
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
            
            JSONObject result = JSON.parseObject(response.getBody());
            if (result.getInteger("code") == 0)
            {
                return result.getJSONObject("data").toJavaObject(Map.class);
            }
            else
            {
                throw new RuntimeException("获取用户信息失败: " + result.getString("message"));
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException("获取用户信息异常: " + e.getMessage());
        }
    }

    /**
     * 验证Cookie是否有效
     * 
     * @param sessdata SESSDATA Cookie
     * @return 是否有效
     */
    public boolean validateCookie(String sessdata)
    {
        try
        {
            String url = BILI_API_URL + "/x/space/myinfo";
            
            HttpHeaders headers = new HttpHeaders();
            headers.set("Cookie", "SESSDATA=" + sessdata);
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            HttpEntity<String> entity = new HttpEntity<>(headers);
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
            
            JSONObject result = JSON.parseObject(response.getBody());
            return result.getInteger("code") == 0;
        }
        catch (Exception e)
        {
            return false;
        }
    }

    /**
     * 获取舰长列表
     * 
     * @param roomId 直播间ID
     * @param anchorUid 主播UID
     * @param sessdata SESSDATA Cookie
     * @param biliJct bili_jct Cookie
     * @param page 页码
     * @param pageSize 每页数量
     * @return 舰长列表
     */
    public List<Map<String, Object>> getGuardList(Long roomId, String anchorUid, String sessdata, String biliJct, Integer page, Integer pageSize)
    {
        List<Map<String, Object>> allGuards = new ArrayList<>();
        
        try
        {
            // 如果未指定页码，则获取所有页
            if (page == null || page <= 0)
            {
                page = 1;
            }
            if (pageSize == null || pageSize <= 0)
            {
                pageSize = 30; // B站API默认每页30条
            }
            
            // 循环获取所有页的数据
            while (true)
            {
                String url = BILI_LIVE_URL + "/xlive/app-room/v2/guardTab/topList"
                        + "?roomid=" + roomId
                        + "&page=" + page
                        + "&ruid=" + anchorUid
                        + "&page_size=" + pageSize
                        + "&skip_followed=true";
                
                HttpHeaders headers = new HttpHeaders();
                headers.set("Cookie", "SESSDATA=" + sessdata + "; bili_jct=" + biliJct);
                headers.setContentType(MediaType.APPLICATION_JSON);
                
                HttpEntity<String> entity = new HttpEntity<>(headers);
                ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
                
                JSONObject result = JSON.parseObject(response.getBody());
                if (result.getInteger("code") != 0)
                {
                    throw new RuntimeException("获取舰长列表失败: " + result.getString("message"));
                }
                
                JSONObject data = result.getJSONObject("data");
                JSONArray list = data.getJSONArray("list");
                
                if (list == null || list.isEmpty())
                {
                    break; // 没有更多数据
                }
                
                // 解析舰长数据
                for (int i = 0; i < list.size(); i++)
                {
                    JSONObject guard = list.getJSONObject(i);
                    Map<String, Object> guardInfo = new HashMap<>();
                    
                    guardInfo.put("uid", guard.getString("uid"));
                    guardInfo.put("username", guard.getString("username"));
                    guardInfo.put("face", guard.getString("face"));
                    guardInfo.put("guard_level", guard.getInteger("guard_level"));
                    
                    // 舰长等级文本
                    Integer level = guard.getInteger("guard_level");
                    if (level == 1) {
                        guardInfo.put("guard_level_text", "总督");
                    } else if (level == 2) {
                        guardInfo.put("guard_level_text", "提督");
                    } else {
                        guardInfo.put("guard_level_text", "舰长");
                    }
                    
                    guardInfo.put("start_time", guard.getDate("start_time"));
                    guardInfo.put("end_time", guard.getDate("end_time"));
                    guardInfo.put("is_auto_renew", guard.getInteger("is_auto_renew"));
                    guardInfo.put("room_id", roomId);
                    guardInfo.put("anchor_uid", anchorUid);
                    
                    allGuards.add(guardInfo);
                }
                
                // 检查是否还有下一页
                Integer totalPage = data.getInteger("page_info") != null ? 
                    data.getJSONObject("page_info").getInteger("total_page") : 1;
                
                if (page >= totalPage)
                {
                    break; // 已经获取完所有页
                }
                
                page++; // 继续获取下一页
            }
            
            return allGuards;
        }
        catch (Exception e)
        {
            throw new RuntimeException("获取舰长列表异常: " + e.getMessage());
        }
    }

    /**
     * 发送私信
     * 
     * @param receiverUid 接收者UID
     * @param content 消息内容
     * @param sessdata SESSDATA Cookie
     * @param biliJct bili_jct Cookie
     * @param dedeUserid DedeUserID Cookie
     * @return 发送结果
     */
    public Map<String, Object> sendPrivateMessage(String receiverUid, String content, String sessdata, String biliJct, String dedeUserid)
    {
        Map<String, Object> result = new HashMap<>();
        
        try
        {
            String url = BILI_API_URL + "/x/msgfeed/private/send";
            
            // 构建请求参数
            Map<String, String> params = new HashMap<>();
            params.put("msg[sender_uid]", dedeUserid);
            params.put("msg[receiver_id]", receiverUid);
            params.put("msg[receiver_type]", "1"); // 1表示个人
            params.put("msg[msg_type]", "1"); // 1表示文本消息
            params.put("msg[dev_id]", generateDeviceId());
            params.put("msg[timestamp]", String.valueOf(System.currentTimeMillis() / 1000));
            params.put("msg[content]", content);
            params.put("csrf", biliJct);
            params.put("csrf_token", biliJct);
            
            HttpHeaders headers = new HttpHeaders();
            headers.set("Cookie", "SESSDATA=" + sessdata + "; bili_jct=" + biliJct + "; DedeUserID=" + dedeUserid);
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
            
            // 构建表单数据
            StringBuilder formBody = new StringBuilder();
            for (Map.Entry<String, String> entry : params.entrySet())
            {
                if (formBody.length() > 0)
                {
                    formBody.append("&");
                }
                formBody.append(entry.getKey()).append("=").append(java.net.URLEncoder.encode(entry.getValue(), "UTF-8"));
            }
            
            HttpEntity<String> entity = new HttpEntity<>(formBody.toString(), headers);
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
            
            JSONObject jsonResult = JSON.parseObject(response.getBody());
            result.put("success", jsonResult.getInteger("code") == 0);
            result.put("message", jsonResult.getString("message"));
            result.put("code", jsonResult.getInteger("code"));
            
            return result;
        }
        catch (Exception e)
        {
            result.put("success", false);
            result.put("message", "发送失败: " + e.getMessage());
            return result;
        }
    }

    /**
     * 生成设备ID
     * 
     * @return 设备ID
     */
    private String generateDeviceId()
    {
        return UUID.randomUUID().toString().replace("-", "").substring(0, 16).toUpperCase();
    }
}
